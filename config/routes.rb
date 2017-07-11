Rails.application.routes.draw do
  resources :items
  resources :wishlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/inventories', to: 'inventories#index', as: :my_inventories
  resources :inventories, :except => :index

  root 'users#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'auth/facebook/callback' => 'sessions#create_facebook'
end
