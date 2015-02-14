class DataFetcher

  def self.save_samples_for_all_cities
    City.all.each do |city|
      save_samples_for_city(city.name)
    end
    'samples saved with no errors'
  end

  def self.save_samples_for_city(city_name)
    city = City.find_by_name(city_name)
    center = city.center
    raport_hash = {}
    sum = 0

    city.markers.each do |marker|
      current_time = BingMapDataApi.new(marker.to_location, center).time
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

  def self.get_report(city_name, raport_hash, average_min)
    puts "Now at #{Time.now}"
    raport_hash.each do |key, value|
      puts "#{key}.............#{value}"
    end
    puts "The average time to get now the center of #{city_name} is #{ average_min } minutes"
  end
end