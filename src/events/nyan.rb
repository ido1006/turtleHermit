module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      poyo=["う","ふ","に","ゃ","あ","ぁ","っ","ー","ん","！","？","〜","\n"]
      message=event.message.content
      if event.channel.id == 985606413042733162 then
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
