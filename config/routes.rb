Rails.application.routes.draw do
  root 'users#input'
  get '/input' => 'users#input'
  post '/login' => 'users#login'
  get '/select' => 'users#select'
  post '/result' => 'users#result'
  get '/update' => 'users#update'
end

