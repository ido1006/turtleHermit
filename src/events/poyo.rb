module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      if event.channel.id == 861905463871668244
        str = event.message.content
        if !(str.include?("ぽ") ||
            str.include?("よ") ||
            str.include?("ぅ") ||
            str.include?("〜") ||
            str.include?("ー") ||
            str.include?("ん") ||
            str.include?("！") ||
            str.include?("？") )
          event.message.delete
        end
      end
    end
  end
end
