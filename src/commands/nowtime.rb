module Bot::DiscordCommands
  module NowTime
    extend Discordrb::Commands::CommandContainer

    date_attrs = {
      description: '今日の日付を返しますよ',
      usage: 'date'
    }

    time_attrs = {
      description: '現在の時刻を返しますよ',
      usage: 'time'
    }

    command :date, date_attrs do |event|
      dn = DateTime.now
      dn = dn.new_offset(Rational(9,24))
      event.respond("今日は#{dn.year}年 #{dn.month}月 #{dn.day}日です。")
    end

    command :time, time_attrs do |event|
      dn = DateTime.now
      dn = dn.new_offset(Rational(9,24))
      event.respond("今は#{dn.hour}時 #{dn.min}分 #{dn.sec}秒です。")
    end

  end
end
