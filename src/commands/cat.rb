module Bot::DiscordCommands
    module Cat
        extend Discordrb::Commands::CommandContainer

        attrs = {
            description: 'ランダムに猫の画像を投下します',
            usage: 'cat'
        }

        command :cat, attrs do |event|
            uri = URI.parse('https://aws.random.cat/meow')
            json = Net::HTTP.get(uri)
            catdata = JSON.parse(json)
            p catdata["file"]
        end
    end
end