Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/pay'
  get 'payment/index'
  get 'payment/pay'
  devise_for :users
  
 
  resources :products do
    resources :reviews
  end

  resources :lineitems
  
  resource :carts, only: [:show]
  root "home#index"
  

  resources :orders do
      member do
        get :cancel
      end
    resources :payments
  end

  #get '/orders/:id', to: 'orders#cancel' , as: 'order'
  
  resources :payments

 
end
