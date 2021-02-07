# config/routes.rb
Rails.application.routes.draw do
  post '/api/user/register', to: 'users#register'
  post '/api/user/connect', to: 'users#connect'
  post '/api/user/updateGPS', to: 'users#updateGPS'
  post '/api/user/receiveGPS', to: 'users#receiveGPS'
end
