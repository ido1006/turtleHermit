module Bot::DiscordCommands
  module Dice
    extend Discordrb::Commands::CommandContainer

    command(
      :dice,
      description: "サイコロ振りますよ",
      usage: "dice [max]"
    ) do |event, max|
      event.respond(dice_message(max: max))
    end

    def dice_message(max: nil) 
      max ||= 6
      max = max.to_i.abs
      val = rand(1..max)
      "d#{max} = #{val}"
    end

  end
end
