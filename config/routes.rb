# config/routes.rb
Rails.application.routes.draw do
  post '/api/user/host', to: 'users#host'
  post '/api/user/invite', to: 'users#invite'
  put '/api/user/update', to: 'users#update'
end
