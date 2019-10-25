module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond("なんだようるさいな")
    end
  end
end
