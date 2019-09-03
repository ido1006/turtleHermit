module Bot::DiscordCommands
  module Serizawa
    extend Discordrb::Commands::CommandContainer

    attrs = {
      description: '芹沢構文を返しますよ',
      usage: 'seri <first> <second>'
    }

    command :seri, attrs do |event, first, second|
      event.respond(serizawa_message(first: first, second: second))
    end

    def self.serizawa_message(first: nil, second: nil)
      first ||= "勉強"
      second ||= "ゲーム"
      message  = "みんな大丈夫かなぁ〜？\n"
      message += "ちゃんと#{first}やってる？\n"
      message += "#{second}なんかにハマってないよね？\n"

      message
    end

  end
end
