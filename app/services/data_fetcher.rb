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
    total_weight = 0
    weighted_sum = 0

    city.markers.each do |marker|
      current_time = BingMapDataApi.new(marker.to_location, city.center).time

      load = 0
      time_without_traffic = marker.time_without_traffic.to_i
      load = current_time.to_f / time_without_traffic if time_without_traffic != 0
      load = (load * 100).round()

      marker.samples.create(time: current_time, traffic_load: load)

      raport_hash[marker] = current_time

      time_without_traffic = marker.time_without_traffic.to_i
      total_weight += time_without_traffic.to_i
      weighted_sum += time_without_traffic.to_i * current_time.to_i
    end

    weighted_mean = weighted_arithmetic_mean(weighted_sum, total_weight)

    city.stats.create(weighted_mean: weighted_mean )
    raport = get_report(city_name, raport_hash, weighted_mean)
    Rails.logger.info(raport)
  end

  def self.weighted_arithmetic_mean(weighted_sum, total_weight)
    ( weighted_sum.to_f / total_weight ).round(2)
  end

  def self.get_report(city_name, raport_hash, weighted_mean)
    Rails.logger.info("Now at #{Time.now}")
    raport_hash.each do |key, value|
      Rails.logger.info('-----')
      Rails.logger.info("Location: #{key.to_location}")
      Rails.logger.info("Time: #{value}")
      Rails.logger.info("Traffic load percentage: #{ count_percentage(value, key) }%")
    end

    Rails.logger.info("The average time to get now the center of #{city_name} is #{ to_minutes(weighted_mean) } minutes (#{ weighted_mean } seconds)")
  end

  private

  def self.to_minutes(seconds)
    ( seconds.to_f / 60 ).round
  end

  def self.count_percentage(numerator, denominator)
    (numerator.to_f / denominator.time_without_traffic.to_i * 100 ).round()
  end
end
