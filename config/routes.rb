# config/routes.rb
Rails.application.routes.draw do
  post '/api/user/host', to: 'users#host'
  post '/api/user/invite', to: 'users#invite'
  post '/api/user/updateGPS', to: 'users#updateGPS'
end
