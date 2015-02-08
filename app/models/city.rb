class City < ActiveRecord::Base
  has_many :markers
  has_many :stats
end
