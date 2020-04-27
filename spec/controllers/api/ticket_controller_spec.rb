require 'rails_helper'

describe Api::TicketController, type: :controller do

  it 'creates a ticket and excavator' do
    post :create, params: valid_params
    expect(response.status).to eq(200)
    expect(Ticket.count).to eq(1)
    expect(Excavator.count).to eq(1)
  end

  it 'fails to create a ticket and excavator' do
    post :create, params: invalid_params
    expect(response.status).to eq(400)
    expect(Ticket.count).to eq(0)
    expect(Excavator.count).to eq(0)
  end
end