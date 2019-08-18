module Bot::DiscordCommands
  module NowTime
    extend Discordrb::Commands::CommandContainer

    command (
      :date,
      description: "今日の日にちがわかりますよ"
    ) do |event|
      dn = DateTime.now
      dn = dn.new_offset(Rational(9,24))
      event.respond("今日は#{dn.year}年 #{dn.month}月 #{dn.day}日です。")
    end

    command (
      :time,
      description: "今の時間がわかりますよ"
    ) do |event|
      dn = DateTime.now
      dn = dn.new_offset(Rational(9,24))
      event.respond("今は#{dn.hour}時 #{dn.min}分 #{dn.sec}秒です。")
    end

  end
end
