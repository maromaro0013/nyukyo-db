Rails.application.routes.draw do
  root "residents#index"

  resources :residents
  resources :food_types

  devise_for :users
end
