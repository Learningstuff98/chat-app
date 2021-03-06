Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :chatrooms, only: [:new, :create, :show] do
    resources :comments, only: [:create]
  end
end
