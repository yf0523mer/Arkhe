Rails.application.routes.draw do
  get 'map/index'
  devise_for :users
  root 'users#top'
  get '/map_request', to: 'posts#map', as: 'map_request'
  get 'posts/' => 'posts#index'

  resources :users
  resources :posts
  resources :places
  resources :favorites
  resources :images
  resources :comments
  resources :maps, only: [:index]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :posts, only: [:new, :create, :index, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :edit, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
