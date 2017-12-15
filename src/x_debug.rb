require 'slack-ruby-client'
require 'slack'
require '../src/numa_time'
require '../src/weather'
require '../src/parser'

now_time = NumaTime.new

p now_time.say_now_time


weather = Weather.new

response = weather.weather_info(SAITAMA_CODE)

p response
