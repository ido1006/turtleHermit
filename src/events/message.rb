module Bot::DiscordEvents
  module Messages
    extend Discord::EventContainer

    message(:contains "bomb") do |event|
      event.respond("今誰か爆弾って言った！？")
    end
  end
end

