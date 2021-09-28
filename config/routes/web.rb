root 'home#index'

get ':code_url', to: 'shortened_urls#show', constraints: {
  code_url: /\d{6}/
}

resources :shortened_urls do
  get 'home', on: :collection
end
