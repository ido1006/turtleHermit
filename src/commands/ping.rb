module Bot::DiscordCommands
  module Ping
    extend Discordrb::Commands::CommandContainer

    command (:ping, description: "速度チェックしますよ") do |event|
      m = event.respond("pong")
      m.edit "pong 応答時間 : #{Time.now - event.timestamp}[sec]。"
    end

  end
end
