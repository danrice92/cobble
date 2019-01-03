Rails.application.routes.draw do
  root "landings#index"

  # account creation
  resources :users, only: [:create]
  get "/sign_up", to: "users#new"

  # logins
  resources :sessions, only: [:create, :destroy]
  get "/sign_in", to: "sessions#new"

  # authenticate token
  get "/auth/:id", to: "sessions#auth"

  resources :job_experiences, only: [:new, :create, :edit, :update]
end
