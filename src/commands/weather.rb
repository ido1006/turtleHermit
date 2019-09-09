module Bot::DiscordCommands
  module Weather
    extend Discordrb::Commands::CommandContainer

    LIVEDOOR_WEATHER_API_HOST = "http://weather.livedoor.com/forecast/webservice/json/v1".freeze
    MISHIMA_CITY_ID = 220030

    attrs = {
      description: '三島のお天気をお知らせします'
      usage: 'weather'
    }

    command :weather, attrs do |event|
      event.respond(weather_message)
    end

    def self.weather_message
      uri = URI.parse("#{LIVEDOOR_WEATHER_API_HOST}?city=#{MISHIMA_CITY_ID}")
      response = Net::HTTP.get_response(uri)
      res_json = JSON.parse(response.body)

      city = res_json.dig("location","city")
      forecasts = res_json["forecasts"]

      message = ""
      forecasts.each { |f|
        max_temp = f.dig("temperature","max","celsius")
        message += "#{f["dateLabel"]}（#{f["date"]}）の#{city}の天気は「#{f["telop"]}」"
        message += "、最高気温は#{max_temp}℃" unless max_temp.nil?
        message += "\n"
      }
    message
    end
  end
end
