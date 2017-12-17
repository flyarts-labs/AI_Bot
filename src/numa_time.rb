require 'date'


class NumaTime
  def initialize
    time = DateTime.now
    @year = time.year.to_s
    @month = time.month.to_s
    @day = time.day.to_s
    @hours = time.hour.to_s
    @min = time.minute.to_s
    @sec = time.sec.to_s
   end

  def say_now_time
    bot_reply = @year + '/' + @month + '/' + @day + "\n" + @hours + ':' + @min + ':' + @sec
    bot_reply.to_s
  end
end
