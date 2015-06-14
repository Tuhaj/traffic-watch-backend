require 'spec_helper'

describe BingMapsAPI do

  let(:marker_location) { '52.2220515,21.2504114' }
  let(:city_center) { "52.2301036,21.0116003" }

  subject { BingMapsAPI.new(marker_location, city_center) }

  context 'with vcr', :vcr => { :cassette_name => "bing_api_response" } do

    it 'gets response with correct time' do
      expect(subject.time).to eql(1637)
    end

    it 'gets correct coordinates for points' do
      expect(subject.all_points_coordinates).to eql([
        [52.222052, 21.250412],
        [52.222829, 21.249688],
        [52.233821, 21.127782],
        [52.224471, 21.044542],
        [52.234781, 21.038319],
        [52.235173, 21.036823],
        [52.230082, 21.01161]
        ])
    end

    it 'gets travel duration without traffic' do
      expect(subject.travel_duration_without_traffic).to eql(1442)
    end

  end

end
