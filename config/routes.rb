Rails.application.routes.draw do
  devise_for :users
  root 'users#top'

  resources :posts, only: [:new, :create, :index, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :edit, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
