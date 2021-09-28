namespace :api do
  namespace :v1 do
    jsonapi_resources :shortened_urls, only: [:index]
  end
end
