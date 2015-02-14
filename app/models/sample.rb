class Sample < ActiveRecord::Base
  belongs_to :marker

  def current_time_over_no_traffic
    time.to_f / marker.time_without_traffic.to_i
  end

  def traffic_load_percentage
    "#{ (current_time_over_no_traffic * 100).round() }%"
  end
end
