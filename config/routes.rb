Rails.application.routes.draw do
  resources :users
  root 'welcome#index'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DS+L available within this file, see http://guides.rubyonrails.org/routing.html
end
