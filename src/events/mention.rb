module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond("!helpで使い方が見れるよ")
    end
  end
end
