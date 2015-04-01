require 'spec_helper'

describe CitiesController, :type => :controller do

  before :each do
    City.destroy_all
    Stat.destroy_all
  end

  describe '#GET index' do
    let(:city) { create :city }
    subject    { get :index, format: :json }

    before  { subject }

    specify { expect(response).to be_success }
    specify { expect(JSON.parse(response.body)).to have_key("cities") }
  end

  describe '#GET stats' do
    let(:city) { create :city }
    let(:stat) { city.stats.first }
    subject    { get :stats, name: city.name, format: :json }

    it 'finds actual record' do
      subject
      expect(response.body)
      expect(JSON.parse(response.body)).to have_key("stats")
      expect(JSON.parse(response.body)['stats'][0]['id']).to eql(stat.id)
    end

    context 'with stat older than 7 days' do
      before do
        stat.update(created_at: Time.now - 8.days)
      end

      it 'does not find stats' do
        subject
        expect(JSON.parse(response.body)['stats'].count).to eql(0)
      end

    end

    context 'with wrong city name' do
      subject  { get :stats, name: 'Barsab', format: :json }

      specify do
        subject
        expect(response.status).to  eql(404)
        expect(response.message).to eql('Not Found')
      end
    end
  end

end
