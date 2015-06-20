class GoogleMapsAPI < MapsAPI
  MAPS_KEY = ''
  API_URL  = 'http://maps.googleapis.com/maps/api/directions/json'

  def all_steps_coordinates
    steps.map{|step| step['end_location']}
  end

  private

  def api_url
    API_URL
  end

  def map_params
    {
      "origin"      => @start,
      "destination" => @target,
      "key"         => MAPS_KEY
    }
  end

  def steps
    get_data_json["routes"][0]["legs"][0]["steps"]
  end
end
