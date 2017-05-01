Rails.application.routes.draw do
  root 'requests#new'

  resources :requests, only: [:new, :create]
end
