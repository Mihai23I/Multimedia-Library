# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#new'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[edit update]
end
