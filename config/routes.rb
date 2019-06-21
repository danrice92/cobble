Rails.application.routes.draw do
  root "landings#index"

  resources :users, only: [:create]
end
