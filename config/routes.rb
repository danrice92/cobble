Rails.application.routes.draw do
  root "landings#index"

  # account creation
  resources :users, only: [:create]
  get "/sign_up", to: "users#new", as: :sign_up

  # logins
  resources :sessions, only: [:create]
  get "/sign_in", to: "sessions#new", as: :sign_in

  # authenticate token
  get "/auth/:id", to: "sessions#auth"

  resources :job_experiences, only: [:new, :create]
end
