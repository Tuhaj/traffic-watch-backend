class Traffic
  require 'open-uri'

  attr_accessor :data

  def initialize
    # @data = hashie
    # puts get_data_json
    # get_data_json
    # @params = params
  end


  def get_data_json(marker_coordinates, center)
    url = set_url(marker_coordinates, center)
    open(url) do |f|
      JSON.load(f)
    end
  end

  def save_samples_for_city(city_name)
    city= City.find_by_name(city_name)
    puts city.name
    puts city.created_at
  end

  def set_url(origin, destination)
    "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}"
  end

  def legs
    get_data_json["routes"][0]["legs"]
  end

  def time
    legs[0]["duration"]["value"]
  end

  def time_minutes
    time / 60
  end

  def time_text
    legs[0]["duration"]["text"]
  end
end
# open("http://maps.googleapis.com/maps/api/directions/json?origin=52.2220515,21.2504114&destination=52.1490187,21.1888543") {|f| JSON.load(f)}