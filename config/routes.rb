Rails.application.routes.draw do
  root 'welcome#show'

  resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:show]
  resources :shelters, only: [:index]
  resources :reports, only: [:new, :create, :index]
  post '/reports/new', to: 'reports#create'

  get '/dashboard', to: 'dashboard#show'

  #oauth handrolls
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
