class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :samples
end
