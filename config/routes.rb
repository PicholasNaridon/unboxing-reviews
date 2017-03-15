Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
    end
  end

  resources :items do
    resources :reviews
  end

  namespace :admin do
    resources :users, only: [:index]
  end

  resources :items

  resources :search

  resources :reviews

  devise_for :users

  get 'homes/index'

  root 'homes#index'

end
