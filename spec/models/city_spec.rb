require 'spec_helper'

describe City, :type => :model do

  let(:city) {create :city}

  it 'city has stats' do
    expect(city.stats.any?).to be(true)
  end

  describe '#scope' do
    let(:second_stat) {create :stat}
    before do
      second_stat.update(created_at: 2.weeks.ago)
      city.stats << second_stat
    end
    specify { expect(city.stats.size).to eql 2 }
    specify { expect(city.last_week_stats.size).to eql 1 }
  end
end
