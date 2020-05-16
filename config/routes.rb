Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :po_products
  resources :users
  
  resources :products do 
    resources :po_products
  end

  resources :purchase_orders do 
    resources :po_products
  end

end
