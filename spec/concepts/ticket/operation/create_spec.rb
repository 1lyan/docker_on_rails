require 'rails_helper'

describe Ticket::Create do
  it 'fails' do
    result = Ticket::Create.(invalid_params)

    expect(result).to be_failure
    expect(Ticket.count).to eq(0)
    expect(Excavator.count).to eq(0)

  end

  it 'works' do
    result = Ticket::Create.(valid_params)
    expect(result).to be_success
    expect(Ticket.count).to eq(1)
    expect(Excavator.count).to eq(1)
  end
end