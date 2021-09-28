module Api
  module V1
    class ShortenedUrlResource < JSONAPI::Resource
      attributes :full_url, :shortened_url, :page_title
    end
  end
end
