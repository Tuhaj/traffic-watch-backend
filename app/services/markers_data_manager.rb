class MarkersDataManager

  # save traffic duration for each marker in each city
  def self.save_travel_duration_without_traffic_for_all_cities
    City.all.each do |city|
      save_travel_duration_without_traffic(city.name)
    end
  end

  def self.save_travel_duration_without_traffic(city_name)
    city = City.find_by_name(city_name)
    center = city.center

    city.markers.each do |marker|
      data = BingMapDataApi.new(marker.to_location, center)
      marker.update(time_without_traffic: data.travel_duration_without_traffic)
    end
  end
end