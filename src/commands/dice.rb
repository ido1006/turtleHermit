module Bot::DiscordCommands
  module Dice
    extend Discordrb::Commands::CommandContainer

    attrs = {
      description: 'サイコロ転がしますよ',
      usage: 'dice <maxNum>'
    }

    command :dice, attrs do |event, max|
      event.respond(dice_message(max: max))
    end

    def self.dice_message(max: nil)
      max ||= 6
      max = max.to_i.abs
      val = rand(1..max)
      "d#{max} = #{val}"
    end

  end
end
