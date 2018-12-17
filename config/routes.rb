Rails.application.routes.draw do
  root "landings#index"

  resources :users, only: [:create]
  get "/sign_up", to: "users#sign_up"
  resources :sessions, only: [:new, :create]
  get "/auth/:id", to: "sessions#auth"

  resources :job_experiences, only: [:new, :create]
end
