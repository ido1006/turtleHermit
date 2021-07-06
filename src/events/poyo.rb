module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      if event.channel.id == 861905463871668244
        str = event.message.content
        for s in str do:
          if (s == 'ぽ') || (s == 'よ') || (s == 'ぅ') || (s == 'ょ') || (s == 'ー') || (s == '〜') || (s == '！') || (s == '？')
          else
            event.message.delete
          end
        end
      end
    end
  end
end
