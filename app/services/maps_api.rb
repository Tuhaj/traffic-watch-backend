class MapsAPI
  require 'open-uri'

  MAPS_KEY = ''

  def initialize(start, target)
    @start = start
    @target = target
  end

  protected

  def url_query
    uri = URI(api_url)
    uri.query = URI.encode_www_form(map_params)
    uri
  end

  def get_data_json
    @get_data_json ||= open(url_query) do |f|
      JSON.load(f)
    end
  end
end
