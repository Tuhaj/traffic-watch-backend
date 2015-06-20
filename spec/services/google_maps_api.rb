require 'spec_helper'

describe GoogleMapsAPI do

  let(:marker_location) { '52.2220515,21.2504114' }
  let(:city_center) { "52.2301036,21.0116003" }

  subject { GoogleMapsAPI.new(marker_location, city_center) }

  context 'with vcr', :vcr => { :cassette_name => "google_api_response" } do

    it 'gets response with correct steps' do
      all_steps = [
                    {"lat"=>52.2223793, "lng"=>21.2501137},
                    {"lat"=>52.2209807, "lng"=>21.1026308},
                    {"lat"=>52.2181651, "lng"=>21.0960956},
                    {"lat"=>52.23695859999999, "lng"=>21.0442842},
                    {"lat"=>52.2301183, "lng"=>21.0119796},
                    {"lat"=>52.2301036, "lng"=>21.0116003}
                  ]
      expect(subject.all_steps_coordinates).to eql(all_steps)
    end

  end

end
