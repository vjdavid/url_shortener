class GetDataWorker
  include Sidekiq::Worker

  def perform(*args)
    InspectWebService.call(full_url: full_url, short_link: short_link)
  end
end
