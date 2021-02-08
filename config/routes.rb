Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  resources :kebabs do
    resources :reviews, only: %i[create]
  end
  resources :reviews, only: %i[destroy]

  root to: 'kebabs#index'
end
