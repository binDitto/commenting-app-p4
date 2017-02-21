Rails.application.routes.draw do

  resources :users do
    resources :posts,
    only: [:index, :new, :create]
    resources :comments, only: [ :index, :destroy ]
  end

  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :votes, only: [:create]
    resources :comments, only: [:create, :destroy ], module: :posts
  end

  resources :comments, only: [ :create, :destroy ] do
    resources :comments, only: [:create, :destroy ], module: :comments
  end

  get 'posts', to: 'posts#all'

  root 'welcome#index'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DS+L available within this file, see http://guides.rubyonrails.org/routing.html
end
