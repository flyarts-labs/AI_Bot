require 'slack-ruby-client'
require '../src/numa_time'
require '../src/weather'

# TOKENをセット
TOKEN = 'xoxb-286197969077-ftz9mq6P2V56G1Oirqc4Y416'
TOKYO_CODE = 130010
SAITAMA_CODE = 110010
KUMAGAYA = 110020


Slack.configure do |conf|
  conf.token = TOKEN
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
  case data.text
    when 'こんにちは'
      client.message channel: data.channel, text: "こんにちは！<@#{data.user}>さん。"
    when client.self.name
      client.message channel: data.channel, text: "<@#{data.user}>さん。何か用？"
    when '今の時間'
      numa_time_reply = NumaTime.new
      client.message channel: data.channel, text: "<@#{data.user}>#{numa_time_reply.say_now_time}"
    when '東京の天気予報'
      weather = Weather.new
      client.message channel: data.channel, text: weather.weather_info(TOKYO_CODE)
    when 'さいたまの天気予報'
      weather = Weather.new
      client.message channel: data.channel, text: weather.weather_info(SAITAMA_CODE)
    when '熊谷の天気予報'
      weather = Weather.new
      client.message channel: data.channel, text: weather.weather_info(KUMAGAYA)
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

