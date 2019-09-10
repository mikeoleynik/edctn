Rails.application.routes.draw do
  devise_for :users
  root 'home#homepage'

  resources :users, only: :create
  resources :themes
end
