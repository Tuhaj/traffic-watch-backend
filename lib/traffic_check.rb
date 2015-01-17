class TrafficCheck

  open() {|f| JSON.load(f)}

  # attr_reader :params

  def initialize
    # @params = params
  end

  def get_data_json
    url = set_url("52.2220515,21.2504114", "52.1490187,21.1888543")
    open(url) {|f| JSON.load(f)}
  end

  def set_url(origin, destination)
    "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}"
  end
end
