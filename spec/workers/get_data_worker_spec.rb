require 'spec_helper'

RSpec.describe GetDataWorker do
  let(:full_url) { 'https://google.com/123' }
  let(:id) { 3 }
  subject(:context) { described_class }

  it { is_expected.to be_processed_in :default }

  it 'should enqueue' do
    expect(context).to have_enqueued_a_sidekiq_job(full_url, id)
  end
end
