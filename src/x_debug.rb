require 'slack-ruby-client'
require 'slack'
require '../src/numa_time'
require '../src/weather'
require '../src/parser'
require 'json'
require 'open-uri'


API_KEY = '61816105fcfda6e6f29e0b2f0fa37374'


BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
response = Net::HTTP.get(URI.parse BASE_URL + "?q=saitama,jp&APPID=#{API_KEY}")
res = JSON.parse(response)
p Parser.parse_json(res)