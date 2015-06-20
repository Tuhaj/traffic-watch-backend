class BingMapsAPI < MapsAPI
  MAPS_KEY = ENV['bing_map_api_key']
  API_URL  = 'http://dev.virtualearth.net/REST/V1/Routes/Driving'

  def time
    api_results["travelDurationTraffic"].to_f
  end

  def travel_duration_without_traffic
    api_results["travelDuration"]
  end

  def all_points_coordinates
    points.map{|point| point['maneuverPoint']['coordinates']}
  end

  private

  def api_url
    API_URL
  end

  def map_params
    {
      "wp.0" => @start,
      "wp.1" => @target,
      "key"  => MAPS_KEY
    }
  end

  def points
    api_results['routeLegs'][0]['itineraryItems']
  end

  def api_results
    get_data_json["resourceSets"][0]["resources"][0]
  end
end
