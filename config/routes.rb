Rails.application.routes.draw do
  resources :items
  resources :wishlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :inventories
  end
  
  root 'users#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'auth/facebook/callback' => 'sessions#create_facebook'
end
