module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      poyo=["ぽ","よ","ぅ","ん","ー","！","？","〜"]
      message=event.message.content
      if event.channel.id == 861905463871668244 then
        if poyo.any? { |i| message.include?(i) } then
          for i in poyo do
            message.delete!(i)
          end
          if message=="" then
          else
            event.message.delete
          end
        else
          event.message.delete
        end
      end
    end
  end
end
