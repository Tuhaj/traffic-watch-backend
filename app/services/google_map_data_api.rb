class GoogleMapDataApi
  require 'open-uri'

  def initialize(start, target)
    @start = start
    @target = target
    @data = get_data_json
  end

  def all_steps_coordinates
    steps.map{|step| step['end_location']}
  end

###
  private

  def get_data_json
    open(url_query) do |f|
      JSON.load(f)
    end
  end

  def url_query
    "http://maps.googleapis.com/maps/api/directions/json?origin=#{ @start }&destination=#{ @target }"
  end

  def steps
    @data["routes"][0]["legs"][0]["steps"]
  end
end

