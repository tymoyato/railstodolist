Rails.application.routes.draw do
  root to: 'pages#home'
  get '/archived', to: 'pages#archived'
  get '/shared', to: 'pages#shared'

  resources :categories
  resources :lists
  resources :items
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  # devise_for :users, skip: [:registrations]

  # as :user do
  #   get 'users/cancel', to: 'users/registrations#cancel', as: 'cancel_user_registration'
  #   get 'users/edit', to: 'users/registrations#edit', as: 'edit_user_registration'
  #   put 'users', to: 'users/registrations#update', as: 'update_user_registration'
  #   post 'users', to: 'users/registrations#create', as: 'user_registration'
  # end
end
