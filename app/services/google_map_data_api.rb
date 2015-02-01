class GoogleMapDataApi
  require 'open-uri'

  def self.save_samples_for_city(city_name)
    city= City.find_by_name(city_name)
    center = city.center
    raport_hash = {}
    sum = 0

    city.markers.each do |marker|
      data = get_data_json(marker, center)
      current_time = time(data)
      marker.samples.create(time: current_time)

      raport_hash[marker.to_location] = current_time
      sum += current_time.to_i
    end

    average_min = ( sum / city.markers.count ) / 60
    get_report(city_name, raport_hash, average_min)
  end

  private

  def self.get_data_json(marker, center)
    open(url_query(marker, center)) do |f|
      JSON.load(f)
    end
  end

  def self.url_query(marker, center)
    puts "http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=#{marker.to_location}&wp.1=#{center}&key=AjawBlxww1VCH8MChGmqC4WAOm2ya5jHSTDy94IFFfchtY7-EEkpzPJAtrJ4Nuja"
    "http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=#{marker.to_location}&wp.1=#{center}&key=AjawBlxww1VCH8MChGmqC4WAOm2ya5jHSTDy94IFFfchtY7-EEkpzPJAtrJ4Nuja"
  end

  def self.time(data)
    data["resourceSets"][0]["resources"][0]["travelDurationTraffic"]
  end

  def self.time_in_minutes(data)
    data["resourceSets"][0]["resources"][0]["travelDurationTraffic"] / 60
  end

  def self.traffic_congestion(data)
    data["resourceSets"][0]["resources"][0]["trafficCongestion"]
  end

  def self.get_report(city_name, raport_hash, average_min)
    raport_hash.each do |key, value|
      puts "#{key}.............#{value}"
    end
    puts "The average time to get now the center of #{city_name} is #{ average_min } minutes"
  end
end


# http://dev.virtualearth.net/REST/v1/Locations?q=seattle&output=xml&key=BingMapsKey
# 52.22205,21.25041

# 52.14901,21.18885

# http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=redmond%2Cwa&wp.1=Issaquah%2Cwa&avoid=minimizeTolls&key=
# bad: open("http://maps.googleapis.com/maps/api/directions/json?origin=52.2220515,21.2504114&destination=52.1490187,21.1888543") {|f| JSON.load(f)}
# working: https://maps.googleapis.com/maps/api/distancematrix/output?

# test City.first.markers[0].samples.pluck(:time)
