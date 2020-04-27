require 'rails_helper'

describe Ticket do

  describe 'dependencies' do
    it { should have_one(:excavator) }
  end

  describe 'validations' do
    it { should validate_presence_of(:request_number) }
    it { should validate_presence_of(:request_type) }
    it { should validate_presence_of(:primary_service_area_code) }
    it { should validate_presence_of(:additional_service_area_codes) }
    it { should validate_presence_of(:well_known_text) }

    it '#response_due_date_check' do
      date = '2011/07/13 23:59:59'
      params = {
        request_number: '1',
        request_type: 'Normal',
        primary_service_area_code: 'Code',
        additional_service_area_codes: ['A', 'B'],
        well_known_text: 'Some long text gos here',
        response_due_date: date
      }
      ticket = Ticket.create(params)
      expect(ticket.errors[:response_due_date]).to eq([])
    end
  end
end