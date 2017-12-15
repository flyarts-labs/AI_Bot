require 'net/http'
require 'uri'
require 'json'
require '../src/parser'

class Weather
  def weather_info(citycode)
    endpoint_url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city='
    uri = URI.parse(endpoint_url + citycode.to_s)
    json = Net::HTTP.get(uri)
    response = JSON.parse(json)
    Parser.parse_json(response)
  end
end



