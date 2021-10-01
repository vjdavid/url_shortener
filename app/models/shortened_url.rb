class ShortenedUrl < ApplicationRecord
  HOST_URL = "#{ENV['DEFAULT_URL']}".freeze

  acts_as_punchable
  validates_presence_of :full_url
  validates_uniqueness_of :full_url
  validates :full_url, url: true

  before_create :set_code_url, :build_shortened_url
  after_create :update_content_for_link

  private

  def set_code_url
    self.code_url = SecureRandom.hex(3)
  end

  def build_shortened_url
    self.shortened_url = "#{HOST_URL}/#{code_url}"
  end

  def update_content_for_link
    GetDataWorker.perform_async(full_url, id)
  end
end
