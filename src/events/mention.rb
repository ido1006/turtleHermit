module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond(dice_message(6))
    end
  end
end
