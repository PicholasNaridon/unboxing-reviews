Rails.application.routes.draw do
  resources :items

  devise_for :users do
    resources :items
  end

  get 'homes/index'

  root 'homes#index'

end
