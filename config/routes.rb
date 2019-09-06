Rails.application.routes.draw do
  root 'home#homepage'
  post 'login', to: 'authentication#create'
end
