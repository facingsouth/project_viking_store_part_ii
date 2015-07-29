Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/admin' => 'admin#index'
  # get '/addresses/:id' => 'addresses#index'
  get '/user/unplaced' => 'user#unplaced' 
  # get '/users/addresses/:id' => 'users#addresses', as: 'addresses'
  get '/users/unplaced/:id' => 'users#unplaced', as: 'unplaced'
  resources :dashboard, only: :index
  resources :categories
  resources :products
  resources :users
  resources :addresses
  resources :credit_cards
  resources :orders
end

