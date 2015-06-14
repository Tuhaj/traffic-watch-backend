class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :samples
  has_many :polylines

  MARGIN = 8.minutes

  def to_location
    [ lat, lng ].join(',')
  end

  def load(time)
    samples.where(created_at: (time - MARGIN)..(time + MARGIN)).last
      .traffic_load
  end
end
