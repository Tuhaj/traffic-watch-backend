class MarkersDataManager

  # save traffic duration for each marker in each city
  def self.save_travel_duration_without_traffic_for_all_cities
    City.all.each do |city|
      save_travel_duration_without_traffic(city.name)
    end
  end

  def self.save_travel_duration_without_traffic(city_name)
    city = City.find_by_name(city_name)

    city.markers.each do |marker|
      data = BingMapDataApi.new(marker.to_location, city.center)
      marker.update(time_without_traffic: data.travel_duration_without_traffic)
    end
  end

  def self.save_save_points_for_polylines_for_all_cities
    City.all.each do |city|
      save_points_for_polylines(city.name)
    end
  end

  def self.save_points_for_polylines(city_name)
    city = City.find_by_name(city_name)
    city.markers.each do |marker|
      data = GoogleMapDataApi.new(marker.to_location, city.center)
      polyline = marker.polylines.create()
      zero_step = { lat: marker.lat, lng: marker.lng }
      polyline.points.create(zero_step)
      data.all_steps_coordinates.each do |step|
        polyline.points.create(step)
      end
    end
  end
end
