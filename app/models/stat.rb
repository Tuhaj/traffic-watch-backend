class Stat < ActiveRecord::Base
  belongs_to :city

  def average_time_to_center_min
    average_time_to_center.to_i / 60
  end
end
