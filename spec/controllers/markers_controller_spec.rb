require 'spec_helper'

describe MarkersController, :type => :controller do

  let(:marker) { create :marker }
  before do
    subject
  end

  context 'when a stat has requested date' do
    subject { get :sample, id: marker.id, date: (Time.now).to_s, format: :json }

    specify { expect(response).to be_success }
    specify { expect(JSON.parse(response.body)).to have_key('load') }
  end

  context 'when there is no stat with requested date' do
    subject { get :sample, id: marker.id, date: (Time.now - 1.day).to_s, format: :json }

    specify { expect(response.status).to  eql(404) }
    specify { expect(response.message).to eql('Not Found') }
  end

  context 'when the marker id is wrong' do
    subject { get :sample, id: 1000, format: :json }

    specify { expect(response.status).to  eql(404) }
    specify { expect(response.message).to eql('Not Found') }
  end
end
