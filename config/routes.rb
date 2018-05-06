Rails.application.routes.draw do
  get 'users/new'
  resource :users
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
