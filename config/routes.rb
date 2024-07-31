Rails.application.routes.draw do

  get "user_admin", to: "admin#index"
  get "admin_user_access", to: "admin#user_access"
  delete "admin_destroy/:id", to: "admin#destroy", as: "destroy/user"
  
  get 'category/index', to: "category#index"
  get 'search/index', to: "category#search"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  # root "post#index"

  resources :movies do
    resource :review, only: [:new, :create]
  end

  root 'pages#home'
end
