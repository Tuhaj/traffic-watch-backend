require 'spec_helper'

describe GoogleMapDataApi do

  let(:marker) { Marker.create( lat: 1, lng: 1 ) }
  let(:center) { "2,2" }
  let(:city)   { City.create( name: 'Warsaw', center: center ) }

  before do
    allow(GoogleMapDataApi).to receive( :get_data_json ).and_return({})
  end

  context 'with BING_MAP_API_KEY stub' do
    before do
      stub_const("GoogleMapDataApi::BING_MAP_API_KEY", '1234')
    end

    it 'builds correct query' do
      expect(GoogleMapDataApi.url_query(marker,'1')).to eql(
        "http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=1,1&wp.1=1&key=1234")
    end

    it 'gets data from bing api' do
      expect(GoogleMapDataApi.save_samples_for_all_cities).to eql 'samples saved with no errors'
    end


  end
  context 'with GoogleMapDataApi.save_samples_for_all_cities as subject' do
    subject { GoogleMapDataApi.save_samples_for_all_cities }

    it '#save_samples_for_city is called' do
      allow( GoogleMapDataApi ).to receive( :save_samples_for_city )
      subject
    end

    it '#get_report is called' do
      allow( GoogleMapDataApi ).to receive( :get_report )
      subject
    end

    it '#get_raport answers with time' do
      allow( STDOUT ).to receive(:puts).with"Now at #{Time.now}"
      allow( STDOUT ).to receive(:puts).with"The average time to get now the center of Warsaw is 0 minutes"
      GoogleMapDataApi.get_report('Warsaw', {}, 0)
    end
  end

end