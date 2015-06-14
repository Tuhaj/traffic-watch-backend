require 'spec_helper'

describe DataDepositor do
  let(:city)      { create :city }

  subject { DataDepositor.save_samples_for_city(city) }

  before :each do
    City.destroy_all
    Stat.destroy_all
  end

  context 'with vcr', :vcr => { :cassette_name => "bing_api_response" } do

    it 'creates new stat' do
      expect{subject}.to change{city.stats.count}.by(1)
    end

    it 'creates new sample' do
      expect{subject}.to change{city.markers.first.samples.count}.by(1)
    end

  end

end
