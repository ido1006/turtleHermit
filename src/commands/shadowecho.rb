module Bot::DiscordCommands
    module Shadowecho
      extend Discordrb::Commands::CommandContainer
  
      attrs = {
        description: 'echoコマンドと基本同じですが、実行コマンドが消えます',
        usage: 'shadowecho [args]' 
      }
  
      command :shadowecho, attrs do |event, *args|
        args = args.join(' ').to_s
        event.send_message(args)
        event.message.delete
      end
    end
  end
  