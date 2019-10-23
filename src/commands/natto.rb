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
      nm = Natto::MeCab.new
      nm.parse(words) do |n|
        message += "#{n.surface}\t#{n.feature}\n"
      end
      message
    end
  end
end
