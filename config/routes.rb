Rails.application.routes.draw do
  resources :items do
    resources :reviews
  end

  resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
    resources :votes, only: [:create]
  end

  resources :items
  resources :reviews
  devise_for :users
  get 'homes/index'
  root 'homes#index'
end
