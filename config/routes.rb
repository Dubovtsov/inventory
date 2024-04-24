Rails.application.routes.draw do
  devise_for :users

  resources :invoice_products
  resources :invoices do
    member do
      patch :complete
      get :to_print
    end
  end
  resources :clients
  resources :prices
  resources :product_movements
  resources :vendors
  resources :storehouses
  resources :employees
  resources :products do
    member do
      post :move_to_storehouse
      post :add_to_invoice
      post :remove_from_invoice
      post :clone
      post :add_files
    end
  end
  resources :cart_items
  resources :carts do
    member do
      get :to_print
    end
  end
  resources :attachments, only: :destroy
  devise_for :administrators
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: "dashboard#index"
  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'products#index'
end
