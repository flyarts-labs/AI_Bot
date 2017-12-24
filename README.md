# numa_bot
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
# How to use
### 呼び出すだけ
```numa_bot```
### 挨拶をする
```Hello numa_bot```
### 慰めてもらう
```ぬまきゅん、なぐさめて```
### 告白してみる
```ぬまきゅんすき```
### 時間を聞く
```今の時間```
### 現在の天気をを聞く
天気の情報取得はOpenWeatherMapのAPIを使っています。
今の所天気が取れる場所は仙台、東京、さいたま、熊谷です。
#### ※例
```東京の天気```
# 要望、意見など
何かあればSlackかGitHubにissue立てて欲しいです。
現状、@numa_botで呼び出せないので誰か実装ミスか方法を指摘もらえると幸いです。

