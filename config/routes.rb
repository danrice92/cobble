Rails.application.routes.draw do
  root "landings#index"

  resource :users, only: [:new, :create]

  resources :job_experiences, only: [:new, :create]
end
