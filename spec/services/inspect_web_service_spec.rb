RSpec.describe InspectWebService do
  describe '.call' do
    let(:full_url) { 'https://www.betterspecs.org/#expect' }
    subject(:context) { described_class.call(full_url: full_url) }

    context 'with a given full url' do
      it { expect(context).to be_success }
    end

    context 'with an invalid full url' do
      let(:full_url) { 'https://google.com/12345' }

      it { expect(context).to be_a_failure }
    end

    context 'without given full url' do
      let(:full_url) { nil }

      it { expect(context).to be_a_failure }
    end
  end
end
