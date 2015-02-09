class Stat < ActiveRecord::Base
  belongs_to :city

  def average_time_to_center_min
    average_time_to_center.to_i / 60
  end

  def to_raport
    "#{ created_at }.............#{ average_time_to_center }"
  end

  def to_raport_min
    "#{ created_at }.............#{ average_time_to_center_min }"
  end
end
