module Bot::DiscordEvents
  module Heartbeat
    extend Discordrb::EventContainer

    heartbeat do |event|
      dn = DateTime.now
      dn = new_offset(Rational(9,24))
      if dn.hour == 15
        event.send_message("おやつの時間！うおお！")
      end
    end
  end
end

