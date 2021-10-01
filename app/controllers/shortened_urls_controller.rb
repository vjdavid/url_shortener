class ShortenedUrlsController < ApplicationController
  before_action :find_shortened_url, only: [:show]

  def home
  end

  def index
    @shortened_urls = ShortenedUrl.all
  end

  def show
    if @url
      @url.punch(request)
      redirect_to @url.full_url
    else
      redirect_to root_path, alert: 'The url provided was not found'
    end
  end

  def create
    @url = ShortenedUrl.new(params[:full_url])

    if @url.save
      redirect_to shortened_urls_path, notice: "Your new URL is #{@url.shortened_url}"
    else
      redirect_to shortened_urls_path, error: "#{@url.errors}"
    end
  end

  private

  def find_shortened_url
    @url = ShortenedUrl.find_by(code_url: params[:code_url])
  end
end
