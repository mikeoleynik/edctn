Rails.application.routes.draw do
  devise_for :users
  root 'home#homepage'
  get '/invite', to: 'invites#invite'
end
