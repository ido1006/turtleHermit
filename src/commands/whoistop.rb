module Bot::DiscordCommands
    module Whoistop
        extend Discordrb::Commands::CommandContainer

        attrs = {
            description: 'かめせんにんがランダムに部長を決めます。引数にmentionをつけるとメンションが飛びます。',
            usage: 'whoistop (mention)'
        }

        command :whoistop, attrs do |event, args|
            if args=="mention" then
                members = event.server.members.map(&:id)
                result = members.sample(3)
                event.send_message("​　部長:\t<@#{result[0]}>\n副部長:\t<@#{result[1]}>\n　会計:\t<@#{result[2]}>");
            else
                members = event.server.members.map(&:display_name)
                result = members.sample(3)
                event.send_message("​　部長:\t#{result[0]}\n副部長:\t#{result[1]}\n　会計:\t#{result[2]}");
            end
        end
    end
end
