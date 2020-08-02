module Bot::DiscordCommands
  module Weather
    extend Discordrb::Commands::CommandContainer

    LIVEDOOR_WEATHER_API_HOST = "http://weather.livedoor.com/forecast/webservice/json/v1".freeze
    MISHIMA_CITY_ID = 220030

    attrs = {
      description: '三島のお天気をお知らせします',
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
