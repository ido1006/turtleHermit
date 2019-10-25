module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond("==mention機能工事中==")
    end
  end
end
