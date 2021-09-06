Rails.application.routes.draw do
  get '/home', to: 'home#index'
  post '/parse_url', to: 'parser#parse_url'
end
