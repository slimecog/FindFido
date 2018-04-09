Rails.application.routes.draw do
  root 'welcome#show'

  resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:show]
  resources :shelters, only: [:index]

  get '/dashboard', to: 'dashboard#show'

  #oauth handrolls
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
