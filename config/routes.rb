Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :kebabs do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: %i[destroy]

  root to: 'kebabs#index'
end
