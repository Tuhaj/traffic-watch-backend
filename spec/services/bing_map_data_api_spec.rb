require 'spec_helper'

describe BingMapDataApi do

  let(:marker_location) { '1,1' }
  let(:city_center) { "2,2" }

  before do
    stub_const("BingMapDataApi::BING_MAP_API_KEY", '1234')
    expect(OpenURI).to receive(:open_uri).with(uri).and_return({})
  end

  context 'OpenURI' do
    let(:url) {"http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=1,1&wp.1=2,2&key=1234"}
    let(:uri) { URI.parse(url) }

    subject { BingMapDataApi.new(marker_location, city_center) }

    it 'calls OpenURI with correct url with bing map key' do
      subject
    end
  end
end
