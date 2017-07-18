Rails.application.routes.draw do

  resources :wishlists do
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/my_inventories', to: 'inventories#index', as: :my_inventories
  resources :inventories, :except => :index do
    resources :items
  end

  root 'users#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'auth/facebook/callback' => 'sessions#create_facebook'
end
