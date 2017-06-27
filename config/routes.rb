Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'users#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'auth/:provider/callback' => 'sessions#create_facebook'
end
