module Bot::DiscordEvents
  module Mentions
    extend Discordrb::EventContainer

    message do |event|
      if event.channel.id == 861905463871668244
        str = event.message.content
        for s in str do:
          if !( (s == 'ぽ') ||
              (s == 'よ') ||
              (s == 'ょ') ||
              (s == 'ぅ') ||
              (s == 'ー') ||
              (s == '〜') ||
              (s == 'ん') ||
              (s == '！') ||
              (s == '？') )
            event.message.delete
          end
        end
      end
    end
  end
end
