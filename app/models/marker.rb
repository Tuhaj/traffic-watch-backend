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

  def create_sample(time)
    samples.create(time: time, traffic_load: count_load(time))
  end

  def count_load(time)
    load = 0
    load = time / time_without_traffic if time_without_traffic.zero?
    (load * 100).round()
  end
end
