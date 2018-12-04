Rails.application.routes.draw do
  resources :listings
  resources :reservations
  resources :users
  resources :sessions
  delete "/sessions", to: "sessions#destroy", as: "log_out"

end
