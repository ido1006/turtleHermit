module Bot::DiscordEvents
  module Messages
    extend Discordrb::EventContainer

    message(contains: "いまなんじ") do |event|
    end
  end
end
