namespace :api do
  namespace :v1 do
    jsonapi_resources :shortened_urls, only: %i[index create]
  end
end
