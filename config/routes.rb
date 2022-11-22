Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/pay'
  get 'payment/index'
  get 'payment/pay'
  devise_for :users
  
  root "home#index"
  
  resources :products do
    resources :reviews
  end

  resources :lineitems
  
  resource :carts, only: [:show]
  
  

  resources :orders do
      member do
        get :shipped        
        get :being_packed
        get :complete
        get :cancel
      end
  end

  #get '/orders/:id', to: 'orders#cancel' , as: 'order'
  
  resources :payments

 
end
