class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :samples

  def to_location
    [
      lat,
      lng
    ].join(',')
  end
end
