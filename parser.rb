# Parse json of OpenWeatherMap API response
class Parser
  def self.parse_json(json)
    temp = json['main']['temp']
    # convert to celsius
    celsius = temp - 273.15
    celsius_round = celsius.round(3)
    weather_status = json['weather'][0]['main']
    '天気は' + weather_status + "\n" + '気温は' + celsius_round.to_s + '℃だよ！'
  end
end