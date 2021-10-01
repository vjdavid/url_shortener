RSpec.describe SaveContentService do

  describe '.call' do
    let(:full_url) { 'https://www.betterspecs.org/#expect' }
    let(:id) { FactoryBot.create(:shortened_url).id }
    subject(:context) { described_class.call(full_url: full_url, id: id) }

    context 'with a valid data' do
      it 'updates the title of the url' do
        context
        shortened_url = ShortenedUrl.find(id)
        expect(shortened_url.page_title).to be_present
      end
    end

    context 'with invalid data' do
      context 'without full url' do
        let(:full_url) { nil }

        it { expect(context).to be_a_failure }
      end

      context 'without an id' do
        let(:id) { nil }

        it { expect(context).to be_a_failure }
      end
    end
  end
end
