require 'spec_helper'

describe DataDepositor do
  let(:city) { create :city }

  describe 'DataDepositor#save_samples_for_city' do

    subject { DataDepositor.save_samples_for_city(city) }

    before { City.destroy_all; Stat.destroy_all }

    context 'with vcr', :vcr => { :cassette_name => "bing_api_response" } do

      it 'calls report logger' do
        logger = double(log_report: '')
        expect(ReportLogger).to receive(:new).and_return(logger); subject
      end

      it 'calls BingMapsAPI' do
        time = double(time: 1)
        expect(BingMapsAPI).to receive(:new).and_return(time); subject
      end

      it 'creates new stat' do
        expect{subject}.to change{city.stats.count}.by(1)
      end

      it 'creates new sample' do
        expect{subject}.to change{city.markers.first.samples.count}.by(1)
      end
    end
  end

  describe 'DataDepositor#weighted_arithmetic_mean' do
    let(:weighted_sum) { 1000 }

    subject do
      DataDepositor.weighted_arithmetic_mean(weighted_sum, total_weight)
    end

    context 'makes division and returns float' do
      let(:total_weight) { 100 }
      specify { expect(subject).to eql 10.0 }
    end

    context 'rounds to 2 places after point' do
      let(:total_weight) { 3 }
      specify { expect(subject).to eql 333.33}
    end
  end
end
