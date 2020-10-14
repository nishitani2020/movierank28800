Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  resources :movies, only: [:new, :create, :show, :destroy]
  resources :movies, only: [:show] do
    resources :comments, only: :create
  end
  
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end