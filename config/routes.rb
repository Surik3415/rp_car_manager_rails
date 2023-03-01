# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :cars, only: %i[index]
  resources :search_requests, only: %i[index new create]

  get '/help', to: 'cars#help'
  root 'pages#index'
end
