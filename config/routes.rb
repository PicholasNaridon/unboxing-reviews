Rails.application.routes.draw do
  resources :items do
    resources :reviews, only: [:create]
  end

  devise_for :users


  get 'homes/index'

  root 'homes#index'

end
