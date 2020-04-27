module Api
  class TicketController < ActionController::Base

    def create
      result = Ticket::Create.(check_params)

      return render json: { text: 'Not OK', status: :bad_request }, status: :bad_request if result.failure?

      render json: { text: 'OK', status: :ok }
    end

    def check_params
      params.permit(
        :RequestNumber,
        :SequenceNumber,
        :RequestType,
        ServiceArea: { PrimaryServiceAreaCode: [:SACode], AdditionalServiceAreaCodes: [SACode:[]] },
        ExcavationInfo: { DigsiteInfo: [:WellKnownText] },
        DateTimes: [:ResponseDueDateTime],
        Excavator: [:CompanyName, :Address, :City, :State, :Zip, :CrewOnsite]
      )
    end

  end
end
