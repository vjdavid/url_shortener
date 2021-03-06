class InspectWebService
  include Interactor

  delegate :full_url, to: :context

  def call
    context.fail!(message: 'There was an error with the given url') unless perform_request.status == 200
    context.title = get_title_tag_content
  end

  private

  def perform_request
    @perform_request ||= begin
        Faraday.get(full_url)
      rescue Faraday::Error => e
        context.fail!(message: e)
    end
    @perform_request
  end

  def parse_request
    @parse_request ||= begin
      context.fail! message: 'There was a problem trying to parse the DOM content' unless perform_request
      Nokogiri::HTML(perform_request.body)
    end
  end

  def get_title_tag_content
    unless parse_request.instance_of?(Nokogiri::HTML4::Document)
      context.fail! message: 'There was an error trying to get the data from the html title tag'
    end

    parse_request.title
  end
end
