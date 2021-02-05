Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  resources :kebabs
  root to: 'kebabs#index'
end
