class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :samples
  has_many :polylines

  def to_location
    [
      lat,
      lng
    ].join(',')
  end
end
