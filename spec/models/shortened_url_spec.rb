require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_url) }
    it { should validate_uniqueness_of(:full_url) }
  end
end
