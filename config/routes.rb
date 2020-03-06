Rails.application.routes.draw do

  root to: "home#index"

  resources :customers
  resources :packages
  resources :additional_services

end
