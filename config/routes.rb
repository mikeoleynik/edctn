Rails.application.routes.draw do
  devise_for :users
  root 'home#homepage'

  resources :users, only: :create
  resources :themes
  resources :tasks
  resources :user_tasks, only: [:create, :destroy]
end
