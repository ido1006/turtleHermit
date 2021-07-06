module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      if event.user.server.name == "ぽよ"
        str = event.message.content
        if str.match(/[^ぽよー〜ぅん]/)
          event.message.delete
        end
      end
    end
  end
end
