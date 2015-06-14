module DataDepositor

  def save_samples_for_all_cities
    City.all.each do |city|
      save_samples_for_city(city)
    end
  end

  module_function :save_samples_for_all_cities

  def save_samples_for_city(city)
    report = {}
    total_weight = 0
    weighted_sum = 0

    city.markers.each do |marker|
      current_time = BingMapsAPI.new(marker.to_location, city.center).time

      load = 0
      time_without_traffic = marker.time_without_traffic
      load = current_time / time_without_traffic if time_without_traffic.zero?
      load = (load * 100).round()

      marker.samples.create(time: current_time, traffic_load: load)

      report[marker] = current_time
      time_without_traffic = marker.time_without_traffic
      total_weight += time_without_traffic
      weighted_sum += time_without_traffic * current_time
    end

    weighted_mean = weighted_arithmetic_mean(weighted_sum, total_weight)
    city.stats.create(weighted_mean: weighted_mean)
    report['weighted_mean'] = weighted_mean
    raport = RaportLogger.new(city.name, report).log_report
  end

  module_function :save_samples_for_city

  def weighted_arithmetic_mean(weighted_sum, total_weight)
    ( weighted_sum.to_f / total_weight ).round(2)
  end

  module_function :weighted_arithmetic_mean

end
