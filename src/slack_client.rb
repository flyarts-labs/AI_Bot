require 'slack-ruby-client'
require '../src/numa_time'
require '../src/weather'

# OpenWeatherAPI key
API_KEY = '61816105fcfda6e6f29e0b2f0fa37374'

# TOKENをセット
Slack.configure do |conf|
  conf.token = 'API_TOKEN'
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
  case data.text
    when 'Hello numa_bot'
      client.message channel: data.channel, text: "こんにちは！<@#{data.user}>さん。"
    when 'numa_bot'
      client.message channel: data.channel, text: "<@#{data.user}>さん。何か用？"
    when '今の時間'
      numa_time_reply = NumaTime.new
      client.message channel: data.channel, text: "<@#{data.user}>#{numa_time_reply.say_now_time}だよ"
    when '仙台の天気'
      weather = Weather.new(API_KEY)
      numa_time_reply = NumaTime.new
      client.message channel: data.channel, text: numa_time_reply.say_now_time + 'の仙台の' + weather.weather_info("Sendai-shi")
    when '東京の天気'
      weather = Weather.new(API_KEY)
      client.message channel: data.channel, text: '現在の東京の' + weather.weather_info("Tokyo")
    when 'さいたまの天気'
      weather = Weather.new(API_KEY)
      client.message channel: data.channel, text: '現在のさいたまの' + weather.weather_info("saitama")
    when '熊谷の天気'
      weather = Weather.new(API_KEY)
      client.message channel: data.channel, text: '現在の熊谷の' + weather.weather_info("kumagaya")
    when 'ぬまきゅんすき'
      client.message channel: data.channel, text: "私も<@#{data.user}>さんが好きだよ！"
    when 'ぬまきゅん、なぐさめて'
      client.message channel: data.channel, text: "<@#{data.user}>辛い時は体を休めてね"
  end
end

client.on :close do |_data|
  puts "Client is about to disconnect"
end

client.on :closed do |_data|
  puts "Client has disconnected successfully!"
end
# Bot start
client.start!

