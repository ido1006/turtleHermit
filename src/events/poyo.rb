module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      poyo=["ぽ","よ","ぅ","ん","ー","！","？","〜","\n"]
      message=event.message.content
      if (event.channel.id == 861905463871668244 || event.channel.id == 985606379538612244) then
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
