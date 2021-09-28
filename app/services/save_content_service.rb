class SaveContentService
  include Interactor

  delegate :full_url, :id, to: :context

  def call
    context.fail! message: get_title_tag.message unless get_title_tag.success?

    save_title_webpage
  end

  private

  def get_title_tag
    @get_title_tag ||= InspectWebService.call(full_url: full_url)
  end

  def save_title_webpage
    shortened_url.page_title = get_title_tag.title
    context.fail! message: "#{shortened_url.errors.messages}" unless shortened_url.save
  end

  def shortened_url
    @shortened_url ||= ShortenedUrl.find_by(id: id)
    context.fail! message: 'We cannot find the provided url' unless @shortened_url
    @shortened_url
  end
end
