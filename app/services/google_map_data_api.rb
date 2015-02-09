class GoogleMapDataApi
  require 'open-uri'

  BING_MAP_API_KEY = "AjawBlxww1VCH8MChGmqC4WAOm2ya5jHSTDy94IFFfchtY7-EEkpzPJAtrJ4Nuja"

  def self.save_samples_for_all_cities
    City.all.each do |city|
      save_samples_for_city(city.name)
    end
    'samples saved with no errors'
  end

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

    average_sec = sum / city.markers.count
    average_min = ( average_sec ) / 60

    city.stats.create(average_time_to_center: average_sec )
    raport = get_report(city_name, raport_hash, average_min)
    Rails.logger.info(raport)
  end

  private

  def self.get_data_json(marker, center)
    open(url_query(marker, center)) do |f|
      JSON.load(f)
    end
  end

  def self.url_query(marker, center)
    "http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=#{ marker.to_location }&wp.1=#{ center }&key=#{ BING_MAP_API_KEY }"
  end

  def self.data_base(data)
    data["resourceSets"][0]["resources"][0]
  end

  def self.time(data)
    data_base(data)["travelDurationTraffic"]
  end

### not used now
  def self.time_in_minutes(data)
    data_base(data)["travelDurationTraffic"] / 60
  end

  def self.traffic_congestion(data)
    data_base(data)["trafficCongestion"]
  end
###

  def self.get_report(city_name, raport_hash, average_min)
    puts "Now at #{Time.now}"
    raport_hash.each do |key, value|
      puts "#{key}.............#{value}"
    end
    puts "The average time to get now the center of #{city_name} is #{ average_min } minutes"
  end
end
