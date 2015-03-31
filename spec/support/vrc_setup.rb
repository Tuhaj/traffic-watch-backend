require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = '../cassettes'
  c.filter_sensitive_data('<YOUR_BING_KEY>') { ENV['bing_map_api_key'] }
end

uri = URI('http://dev.virtualearth.net/REST/V1/Routes/Driving')
marker_location =  '52.2220515,21.2504114'
city_center =      '52.2301036,21.0116003'
params = { "wp.0" => marker_location,
           "wp.1" => city_center,
           "key"  => ENV['bing_map_api_key'] }
uri.query = URI.encode_www_form(params)


VCR.use_cassette('bing_api_response', :record => :once) do
  response = Net::HTTP.get_response(uri)
  puts "Response: #{response.body}"
end
