require 'spec_helper'

describe DataFetcher do
  subject { DataFetcher }
  let!(:city)          { create :city }
  let(:received_data)  { double('received_data') }

  before do
    expect(received_data).to receive(:time).and_return('1000')
    expect(BingMapDataApi).to receive(:new).with('2,3', '1,1').and_return(received_data)
  end

  it 'calls BingMapDataApi' do
    byebug
    expect(subject.save_samples_for_all_cities).to eql("samples saved with no errors")
  end
end
