require 'date'


class NumaTime
  def initialize
    time = DateTime.now
    @month = time.month.to_s
    @day = time.day.to_s
    @hours = time.hour.to_s
    @min = time.minute.to_s
    @sec = time.sec.to_s
   end

  def say_now_time
    bot_reply = '今の時間は' + @month + '月' + @day + '日' +
        @hours + '時' + @min + '分' + @sec + '秒だよ!'
    bot_reply.to_s
  end
end
