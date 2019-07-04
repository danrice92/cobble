Rails.application.routes.draw do
  root "landings#index"

  resources :users, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]
  get "/auth/:id", to: "sessions#auth"

  resources :consultations, only: [:new]
end
