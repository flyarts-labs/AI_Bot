# Parse json of OpenWeatherMap API response
class Parser
  def self.parse_json(json)
    weather_etoj_table = {"Clear" => "晴れ", "Clouds" => "くもり", "Snow" =>"雪", "Rain" =>"雨"}
    temp = json['main']['temp']
    # convert to celsius
    celsius = temp - 273.15
    celsius_round = celsius.round(3)
    weather_status = json['weather'][0]['main']
    '天気は' + (weather_etoj_table.key?(weather_status) ? weather_etoj_table[weather_status] : weather_status) + "\n" + '気温は' + celsius_round.to_s + '℃だよ！'
  end
end