Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'

  resources :bookings, only: [:new, :create, :show]
end
