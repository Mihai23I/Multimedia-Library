# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#new'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  resources :users
end
