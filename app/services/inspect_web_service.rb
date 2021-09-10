class InspectWebService
  include Interactor

  delegate :full_url, to: :context

  def call
    get_title
  end

  private

  def perform_request
    @perform_request ||= begin
      response = Faraday.get(full_url)
      context.fail! message: 'there was an error with the url' unless response.success?
      response
    end
  end

  def parse_request
    @parse_request ||= begin
      context.fail! message: 'there was a problem trying to parse the website' unless perform_request
      Nokogiri::HTML(perform_request.body)
    end
  end

  def get_title
    return unless parse_request
    parse_request.title
  end
end