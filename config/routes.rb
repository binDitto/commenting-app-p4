Rails.application.routes.draw do

  resources :users do
    resources :posts,
    only: [:index, :new, :create]
  end

  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :votes, only: [:create]
  end
  get 'posts', to: 'posts#all'


  root 'welcome#index'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DS+L available within this file, see http://guides.rubyonrails.org/routing.html
end
