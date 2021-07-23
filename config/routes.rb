Rails.application.routes.draw do
  root "residents#index"
  resources :residents
  devise_for :users
end
