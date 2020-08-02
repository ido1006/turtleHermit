module Bot::DiscordCommands
  module Weather
    extend Discordrb::Commands::CommandContainer

    attrs = {
      description: '三島のお天気をお知らせできません',
      usage: 'weather'
    }

    command :weather, attrs do |event|
      event.respond(weather_message)
    end

    def self.weather_message
      message = "livedoorのサービス終了につき、停止中です。\n"
      message += "気分がノったら直します。"
      message
    end
  end
end
