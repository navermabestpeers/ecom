Rails.application.routes.draw do
  resources :reviews
  get 'payments/index'
  get 'payments/pay'
  get 'payment/index'
  get 'payment/pay'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  resources :products do
    resources :reviews
  end
  resources :lineitems
  # Defines the root path route ("/")
  resource :carts, only: [:show]
  root "home#index"
  #resources :products
  resources :orders do
    resources :payments
  end
  resources :payments

 
end
