# Parse json of livedoor API response
class Parser
  def self.parse_json(json)
    city_name = json['location']['city']
    weather_status = json['forecasts'][0]['telop']
    '今日の' + city_name + 'の天気は' + weather_status + 'の予報が出ているよ！'
  end
end