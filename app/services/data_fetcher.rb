class DataFetcher

  def self.save_samples_for_all_cities
    City.all.each do |city|
      save_samples_for_city(city.name)
    end
    'samples saved with no errors'
  end

  def self.save_samples_for_city(city_name)
    city = City.find_by_name(city_name)
    raport_hash = {}
    weighted_mean = {}
    total_weight = 0
    weighted_sum = 0
    sum = 0

    city.markers.each do |marker|
      current_time = BingMapDataApi.new(marker.to_location, city.center).time
      marker.samples.create(time: current_time)

      raport_hash[marker] = current_time

      time_without_traffic = marker.time_without_traffic.to_i
      total_weight += time_without_traffic
      weighted_sum += time_without_traffic * current_time
      sum += current_time.to_i
    end

    average_sec = sum / city.markers.count
    average_min = ( average_sec ) / 60

    weighted_mean = weighted_arithmetic_mean(weighted_sum, total_weight)

    city.stats.create(average_time_to_center: average_sec, weighted_mean: weighted_mean )
    raport = get_report(city_name, raport_hash, average_min, weighted_mean)
    Rails.logger.info(raport)
  end

  def self.weighted_arithmetic_mean(weighted_sum, total_weight)
    ( weighted_sum.to_f / total_weight ).round(2)
  end

  def self.get_report(city_name, raport_hash, average_min, total_weight)
    puts "Now at #{Time.now}"
    raport_hash.each do |key, value|
      puts '-----'
      puts "Location: #{key.to_location}"
      puts "Time: #{value}"
      puts "Traffic load percentage: #{ (value.to_f / key.time_without_traffic.to_i * 100 ).round()  }%"
    end

    puts "The average time to get now the center of #{city_name} is #{ average_min } minutes"
    puts "Weight mean is #{ total_weight } seconds"
  end
end