Rails.application.routes.draw do
  root 'home#homepage'
  post '/login', to: 'authentication#create'
  get '/send_invite', to: 'invites#send_invite'
  post '/users', to: 'users#create'
end
