class City < ActiveRecord::Base
  has_many :markers
  has_many :stats
  has_many :samples, :through => :markers
end
