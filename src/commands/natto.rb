module Bot::DiscordCommands
  module Nattotext
    extend Discordrb::Commands::CommandContainer

    attrs = {
      description: '形態素解析するマン',
      usage: 'natto <words>'
    }

    command :natto, attrs do |event, *words|
      words = words.join(' ').to_s
      event.respond(natto_message(words: words))
    end

    def self.natto_message(words: nil)
      message = ""
      if words == nil then
        message = "解析したい文字列を入力してくだしあ\n"
      else
        nm = Natto::MeCab.new
        nm.parse(words) do |n|
          message += "#{n.surface}\t#{n.feature}\n"
        end
      end
      message
    end
  end
end
