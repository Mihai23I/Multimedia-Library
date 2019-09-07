# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :administrator do
    resources :videos
    resources :items
    resources :users
    resources :physical_videos
  end

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

  resources :items do
    resources :physical_videos, only: [:index]
  end

  resources :videos, only: [:index, :show]
  namespace :admin do
    resources :videos, only: [:new, :create, :edit, :update]
    resources :locations, only: [:new, :create, :edit, :update]
  end

  # namespace :administrator do
  #   resources :clients
  #   resources :users
  #   resources :items
  #   resources :videos
  #   resources :locations
  #   resources :cities
  #   resources :global_settings
  #   resources :physical_items
  #   resources :physical_videos
  #   resources :loans
  # end

  resources :locations, only: [:index]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
