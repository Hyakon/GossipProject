Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :users
  resources :gossips do
    resources :reviews
  end
  resources :sessions, only: [:new, :create, :destroy]
end
