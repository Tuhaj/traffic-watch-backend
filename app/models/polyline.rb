class Polyline < ActiveRecord::Base
  belongs_to :marker
  has_many :points
end
