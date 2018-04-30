# AI_bot
![bandicam-2017-11-23-21-17-25-838](https://user-images.githubusercontent.com/24353841/39361490-ab7cbc66-4a5d-11e8-84b7-e861f118a498.jpg)

The bot of FlyArts

身内botなので使うならslack_client.rbのメッセージ部分を書き換えて使うと良いと思います。
# Set up
Ruby環境前提
```
bundle install
```
起動
```
bundle exec ruby slack_client.rb
```
# Usage
使いかたを聞く
```
bot usage 
```
### 現在の天気をを聞く
天気の情報取得はOpenWeatherMapのAPIを使っています。
今の所天気が取れる場所は仙台、東京、さいたま、熊谷、つくばです。
#### ※例
```東京の天気```
# 要望、意見など
何かあればSlackかGitHubにissue立てて欲しいです。
# 著作権に関して
これはキズナアイの二次創作物に当たります。キズナアイの権利は

Project A.I.に帰属するものであり、このossもそれに従います。

なおソースコードはMITライセンスの元で公開されてるものとします。
