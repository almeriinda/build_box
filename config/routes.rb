Rails.application.routes.draw do
  root 'orders#index'
  get "up" => "rails/health#show", as: :rails_health_check
  post '/orders/create', to: 'orders#create'
  resources :orders, only: [:index]
end
