class Traffic
  require 'open-uri'

  attr_accessor :data

  def initialize
    # @data = hashie
    # puts get_data_json
    # get_data_json
    # @params = params
  end

  DATA = {
    warsaw: {
      point_1: {
        lat: "52.2220515",
        lng: "21.2504114"
      },
      target: {
        lat: "52.1490187",
        lng: "21.1888543"
      }
    }
  }

  def get_data_json
    url = set_url("52.2220515,21.2504114", "52.1490187,21.1888543")
    open(url) do |f|
      JSON.load(f)
    end
  end

  def set_url(origin, destination)
    "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}"
  end

  def legs
    get_data_json["routes"][0]["legs"]
  end

  def time
    legs[0]["duration"]["value"] / 60
  end

  def time_text
    legs[0]["duration"]["text"]
  end
end
# open("http://maps.googleapis.com/maps/api/directions/json?origin=52.2220515,21.2504114&destination=52.1490187,21.1888543") {|f| JSON.load(f)}