Rails.application.routes.draw do
  resources :listings
  resources :users
  resources :sessions, only: [:new, :create]
  delete "/sessions", to: "sessions#destroy", as: "log_out"
  resources :reservations

end
