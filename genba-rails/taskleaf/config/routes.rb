Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'sessions/new'
  namespace :admin do
    resources :users
  end

  resources :tasks
  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
  end
end
