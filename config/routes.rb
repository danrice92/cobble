Rails.application.routes.draw do
  root "landings#index"

  resources :job_experiences, only: [:new, :create]
end
