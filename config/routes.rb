Rails.application.routes.draw do
  resources :invoice_products
  resources :invoices
  resources :clients do
    member do
      post :invoice_create
    end
  end
  get 'backups/create_backup'
  resources :prices
  resources :product_movements
  resources :vendors
  resources :storehouses do
    member do
      post :invoice_create
    end
  end
  resources :employees
  resources :products do
    member do
      post :move_to_storehouse
      post :clone
    end
  end

  devise_for :administrators
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'products#index'
end
