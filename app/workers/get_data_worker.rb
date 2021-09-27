class GetDataWorker
  include Sidekiq::Worker

  def perform(full_url, id)
    SaveContentService.call(full_url: full_url, id: id)
  end
end
