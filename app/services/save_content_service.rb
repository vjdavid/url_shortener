class SaveContentService
  include Interactor

  delegate :full_url, :id, to: :context

  def call
    update_title_tag if get_title_tag.success?
  end

  private

  def get_title_tag
    @get_title_tag ||= InspectWebService.call(full_url: full_url)
  end

  def update_title_tag
    short_link ||= ShortenedUrl.find(id)
    short_link.page_title = get_title_tag.title
    short_link.save
  end
end
