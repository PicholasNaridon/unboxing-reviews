Rails.application.routes.draw do
  resources :items

  devise_for :users


  get 'homes/index'

  root 'homes#index'

end
