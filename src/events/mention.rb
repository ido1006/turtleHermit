module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    mention do |event|
      event.respond(DiscordCommands::Dice.dice_message(6))
    end
  end
end
