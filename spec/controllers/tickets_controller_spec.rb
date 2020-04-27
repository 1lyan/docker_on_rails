require 'rails_helper'

describe TicketsController, type: :controller do

  it 'renders an index page' do
    get :index

    expect(response).to render_template 'tickets/index'
  end

  it 'renders an show page' do
    result = Ticket::Create.(valid_params)
    get :show, params: { id: result['ticket'].id }

    expect(response).to render_template 'tickets/show'
  end
end