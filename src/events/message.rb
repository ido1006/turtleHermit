module Bot::DiscordEvents
  module Messages
    extend Discord::EventContainer

    bomb_attrs = {
      contains: 'bomb'
    }

    message, bomb_attrs do |event|
      event.respond("今誰か爆弾って言った！？")
    end
  end
end

