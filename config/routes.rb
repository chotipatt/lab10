Rails.application.routes.draw do
  get 'main/login'
  get 'main/destroy'
  post 'main/user_item'
  get 'main/user_item'
  get 'main/user'
  get 'main/calculate'
  post 'main/create'
  get 'main/inventories'
  get 'shop/:id' ,to: 'shop#index', as: 'shop'
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
