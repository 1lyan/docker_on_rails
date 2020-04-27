Rails.application.routes.draw do
  root 'tickets#index'

  resources :tickets, only: [:index, :show, :destroy]

  namespace :api, defaults: { format: :json }, path: '/api' do
    resources :ticket, only: [:create]
  end
end
