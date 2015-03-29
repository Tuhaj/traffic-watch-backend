class Sample < ActiveRecord::Base
  belongs_to :marker
  has_one :city, :through => :marker

  def current_time_over_no_traffic
    if marker.time_without_traffic.to_i != 0
      time.to_f / marker.time_without_traffic.to_i
    end
  end

  def traffic_load_percentage
    "#{ (current_time_over_no_traffic * 100).round() }%"
  end
end
