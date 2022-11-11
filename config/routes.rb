Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  resources :products
  resources :lineitems
  # Defines the root path route ("/")
  resource :carts, only: [:show]
  root "home#index"
  #resources :products
  resources :orders
end
