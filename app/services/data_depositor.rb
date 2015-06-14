class DataDepositor

  def self.save_samples_for_all_cities
    City.all.each do |city|
      save_samples_for_city(city.name)
    end
  end

  def self.save_samples_for_city(city_name)
    city = City.find_by_name(city_name)
    raport_hash = {}
    total_weight = 0
    weighted_sum = 0

    city.markers.each do |marker|
      current_time = BingMapsAPI.new(marker.to_location, city.center).time

      load = 0
      time_without_traffic = marker.time_without_traffic.to_i
      load = current_time.to_f / time_without_traffic if time_without_traffic != 0
      load = (load * 100).round()

      marker.samples.create(time: current_time, traffic_load: load)

      raport_hash[marker] = current_time
      time_without_traffic = marker.time_without_traffic.to_i
      total_weight += time_without_traffic
      weighted_sum += time_without_traffic * current_time.to_i
    end

    weighted_mean = weighted_arithmetic_mean(weighted_sum, total_weight)
    city.stats.create(weighted_mean: weighted_mean )
    raport_hash['weighted_mean'] = weighted_mean
    raport = RaportLogger.new(city_name, raport_hash).log_report
  end

  def self.weighted_arithmetic_mean(weighted_sum, total_weight)
    ( weighted_sum.to_f / total_weight ).round(2)
  end
end
