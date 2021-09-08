class ShortenedUrl < ApplicationRecord
  HOST_URL = "#{ENV['DEFAULT_URL']}".freeze

  acts_as_punchable
  validates_presence_of :full_url
  validates :full_url, url: true

  before_create :set_code_url, :build_shortened_url

  def self.short_or_create_from_url(full_url)
    shortened_url = self.find_by(full_url: full_url)
    shortened_url ||= self.create(full_url: full_url)
  end

  private

  def set_code_url
    self.code_url = SecureRandom.hex(3)
  end

  def build_shortened_url
    self.shortened_url = "#{HOST_URL}/#{code_url}"
  end
end
