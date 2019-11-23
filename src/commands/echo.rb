module Bot::DiscordCommands
  module Echo
    extend Discordrb::Commands::CommandContainer

    attrs = {
      description: 'オウム返しします。',
      usage: 'echo [args]' 
    }

    command :echo, attrs do |event, *args|
      args = args.join(' ').to_s
      event.respond(args)
    end
  end
end
