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
    "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{marker.to_location}&destinations=#{center}&key=AIzaSyCgjEq8IOYmdK0hOKmBjVyPY9QY2aJErP4"
    # bad: "http://maps.googleapis.com/maps/api/directions/json?origin=#{marker.to_location}&destination=#{center}"
  end

  def self.time(data)
    data["rows"][0]["elements"][0]["duration"]["value"]
  end

  def self.time_in_minutes(data)
    data["rows"][0]["elements"][0]["duration"]["value"] / 60
  end

  def self.time_text(data)
    data["rows"][0]["elements"][0]["duration"]["text"]
  end

  def self.get_report(city_name, raport_hash, average_min)
    raport_hash.each do |key, value|
      puts "#{key}.............#{value}"
    end
    puts "The average time to get now the center of #{city_name} is #{ average_min } minutes"
  end
end
# bad: open("http://maps.googleapis.com/maps/api/directions/json?origin=52.2220515,21.2504114&destination=52.1490187,21.1888543") {|f| JSON.load(f)}
# working: https://maps.googleapis.com/maps/api/distancematrix/output?

# test City.first.markers[0].samples.pluck(:time)
