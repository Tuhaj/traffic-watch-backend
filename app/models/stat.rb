class Stat < ActiveRecord::Base
  belongs_to :city

  def average_time_to_center_min
    weighted_mean.to_i / 60
  end

  def to_raport
    "#{ created_at }.............#{ weighted_mean }"
  end

  def to_raport_min
    "#{ created_at }.............#{ average_time_to_center_min }"
  end
end
