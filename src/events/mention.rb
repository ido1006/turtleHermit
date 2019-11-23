module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond("#{event.user.name}、何の用だ？")
    end
  end
end
