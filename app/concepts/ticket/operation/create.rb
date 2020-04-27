require "trailblazer"

class Ticket
  class Create < Trailblazer::Operation
    step :prepare_params!
    step :persist!

    def prepare_params!(options, **)
      options[:ticket_params] = ticket_params(options)
      options[:excavator_params] = excavator_params(options)
    end

    def persist!(options, **)
      ApplicationRecord.transaction do
        ticket = Ticket.create(options[:ticket_params])
        excavator = ticket.create_excavator(options[:excavator_params])
        options['ticket'] = ticket
        options['excavator'] = excavator
      rescue ActiveRecord::RecordNotSaved => _
        false
      end
    end

    private

    def address(params)
      address = params[:Excavator][:Address]
      city = params[:Excavator][:City]
      state = params[:Excavator][:State]
      zip = params[:Excavator][:Zip]

      "#{address} #{city} #{state} #{zip}"
    end

    def ticket_params(params)
      {
        request_number: params[:RequestNumber],
        sequence_number: params[:SequenceNumber],
        request_type: params[:RequestType],
        primary_service_area_code: params[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
        additional_service_area_codes: params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
        well_known_text: params[:ExcavationInfo][:DigsiteInfo][:WellKnownText],
        response_due_date: params[:DateTimes][:ResponseDueDateTime]
      }
    end

    def excavator_params(params)
      {
        company_name: params[:Excavator][:CompanyName],
        address: address(params),
        crew_on_site: params[:Excavator][:CrewOnsite] == 'true'
      }
    end

  end
end
