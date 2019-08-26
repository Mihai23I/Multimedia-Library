# frozen_string_literal: true

Rails.application.routes.draw do

  root 'static_pages#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:edit, :update]
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  get 'user_password_resets/new'
  get 'user_password_resets/edit'

  resources :account_activations, only: [:edit]
  resources :user_password_resets, only: [:new, :create, :edit, :update]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
