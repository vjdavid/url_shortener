Rails.application.routes.draw do
  draw(:web)
  draw(:api)
  draw(:sidekiq_routes)
end
