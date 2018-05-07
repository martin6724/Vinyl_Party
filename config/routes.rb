Rails.application.routes.draw do
  root 'sessions#new'
  get 'users/new'
  resources :sessions
  resource :users do
  resources :albums
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
