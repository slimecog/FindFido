Rails.application.routes.draw do
  root 'welcome#show'

  resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:show]
  resources :shelters, only: [:index]

  get '/dashboard', to: 'dashboard#show'
  get '/report', to: 'reports#new'

  #oauth handrolls
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
