module Bot::DiscordCommands
  module Serizawa
    extend Discordrb::Commands::CommandContainer

    command(
      :seri,
      description: "S先生っぽいこと言いますよ",
      usage: "seri [first] [second]"
    ) do |event, first, second|
      event.respond(serizawa_message(first: first, second: second))
    end

    def serizawa_message(first: nil, second: nil)
      first ||= "勉強"
      second ||= "ゲーム"
      message  = "みんな大丈夫かなぁ〜？\n"
      message += "ちゃんと#{first}やってる？\n"
      message += "#{second}なんかにハマってないよね？\n"

      message
    end

  end
end
