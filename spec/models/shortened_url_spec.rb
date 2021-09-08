require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_url) }
  end

  describe '.short_or_create_from_url' do
    let(:full_url) { 'https://example.com/123' }
    subject { described_class.short_or_create_from_url(full_url) }

    context 'with given full_url' do
      it 'should have a code url present' do
        expect(subject).to be_valid
      end

      it 'should have the shortened url' do
        expect(subject).to be_valid
      end
    end

    context 'with an invalid format of the url' do
      let(:full_url) { 'http://' }
      it 'should have the shortened url' do
        expect(subject).to be_invalid
      end
    end

    context 'with an invalid url' do
      let(:full_url) { nil }
      it 'should have the shortened url' do
        expect(subject).to be_invalid
      end
    end
  end
end
