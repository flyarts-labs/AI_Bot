require 'slack-ruby-client'
require './numa_time'
require './weather'

# OpenWeatherAPI key
API_KEY = ENV['W_API_KEY']


# TOKENをセット
Slack.configure do |conf|
  conf.token = ENV['API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts 'Successfully connected.'
  puts "Welcome #{client.self.name} to the #{client.team.name}"
  puts "Slack team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
  case data.text
    when 'bot usage'
      usage_str = "　
      キズナアイbotの使い方だよ　```
      呼び出すだけ
      「アイちゃん」

      使いかたを聞く
      「Bot usage」

      慰めてもらう
      「アイちゃん、なぐさめて」

      告白してみる
      「アイちゃんすき」

      時間を聞く
      「今の時間」

      現在の天気をを聞く
      「〜の天気」
      天気の情報取得はOpenWeatherMapのAPIを使っています。
      今の所天気が取れる場所は仙台、東京、さいたま、熊谷です。
      ```
      "
      client.message channel: data.channel, text: usage_str
    when 'アイちゃん'
      client.message channel: data.channel, text: "<@#{data.user}>さん。何か用？"
    when '今の時間'
      numa_time_reply = NumaTime.new
      client.message channel: data.channel, text: "<@#{data.user}>#{numa_time_reply.say_now_time}だよ"
    when 'キズナアイのおしりでイキます'
      client.message channel: data.channel, text: "その話はダメだよ！"
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
      client.message channel: data.channel, text: '現在の熊谷の' + weather.weather_info(data.text)
    when 'アイちゃんすき'
      client.message channel: data.channel, text: "私も<@#{data.user}>さんが好きだよ！"
    when 'アイちゃん、なぐさめて'
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


