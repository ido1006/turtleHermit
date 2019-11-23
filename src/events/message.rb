module Bot::DiscordEvents
  module Messages
    extend Discord::EventContainer

    message(contains: /^(bomb|BOMB|ばくだん|バクダン|爆弾)/) do |event|
      event.respond("今誰か爆弾って言った！？")
    end
  end
end

