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

  def self.save_points_for_polylines_google(city_name)
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

  def self.save_points_for_polylines(city_name)
    city = City.find_by_name(city_name)
    city.markers.each do |marker|
      data = BingMapDataApi.new(marker.to_location, city.center)
      polyline = marker.polylines.create()
      first_point = { lat: marker.lat, lng: marker.lng }
      polyline.points.create(first_point)
      data.all_points_coordinates.each do |point|
        polyline.points.create( lat: point[0], lng: point[1] )
      end
      center_coordinates = city.center.split(',')
      last_point = { lat: center_coordinates[0], lng: center_coordinates[1] }
      polyline.points.create(last_point)
    end
  end

  def self.set_true_time_without_traffic(city_name)
    city = City.find_by_name(city_name)
    city.markers.each do |marker|
      minimal_traffic = marker.samples.map{|s| s.time.to_i}.min
      marker.update(time_without_traffic: minimal_traffic)
    end
  end

end
