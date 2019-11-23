module Bot::DiscordEvents
  module Messages
    extend Discordrb::EventContainer

    message(contains: /^(いまなんじ)/) do |event|
      event.respond("#{event.timestamp}")
    end
  end
end
