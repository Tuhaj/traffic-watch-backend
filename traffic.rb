class Traffic
  require 'open-uri'

  def initialize
  end

  def save_samples_for_city(city_name)
    city= City.find_by_name(city_name)
    center = city.center
    raport = {}
    sum = 0

    city.markers.each do |marker|
      marker_position = latlng_to_s(marker)
      data = get_data_json(marker_position, center)
      time = time(data)
      marker.samples.create(time: time)

      raport[marker_position] = time
      sum += time
    end
    raport.each do |key, value|
      puts "#{key}.............#{value}"
    end
    average_min = ( time / city.markers ) / 60
    puts "average time to get the center for #{ city_name } is #{ average_min } minutes"
  end

  private

  def get_data_json(marker_coordinates, center)
    url = set_url(marker_coordinates, center)
    open(url) do |f|
      JSON.load(f)
    end
  end

  def latlng_to_s(marker)
    "#{marker.lat},#{marker.lng}"
  end

  def set_url(origin, destination)
    "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}"
  end

  def time(data)
    data["routes"][0]["legs"][0]["duration"]["value"]
  end

  def time_in_minutes(data)
    data["routes"][0]["legs"][0]["duration"]["value"] / 60
  end

  def time_text(data)
    data["routes"][0]["legs"][0]["duration"]["text"]
  end
end
# open("http://maps.googleapis.com/maps/api/directions/json?origin=52.2220515,21.2504114&destination=52.1490187,21.1888543") {|f| JSON.load(f)}