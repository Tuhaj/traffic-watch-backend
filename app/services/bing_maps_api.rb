class BingMapsAPI
  require 'open-uri'

  BING_MAP_API_KEY = ENV['bing_map_api_key']

  def initialize(start, target)
    @start = start
    @target = target
    @data = get_data_json
  end

  def time
    data_base["travelDurationTraffic"]
  end

  def travel_duration_without_traffic
    data_base["travelDuration"]
  end

  def all_points_coordinates
    points.map{|point| point['maneuverPoint']['coordinates']}
  end

  private

  def points
    data_base['routeLegs'][0]['itineraryItems']
  end

  def get_data_json
    open(url_query) do |f|
      JSON.load(f)
    end
  end

  def url_query
    uri = URI('http://dev.virtualearth.net/REST/V1/Routes/Driving')
    params = {
      "wp.0" => @start,
      "wp.1" => @target,
      "key"  => BING_MAP_API_KEY
    }
    uri.query = URI.encode_www_form(params)
    uri
  end

  def data_base
    @data["resourceSets"][0]["resources"][0]
  end
end
