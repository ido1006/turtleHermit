module Bot::DiscordCommands
    module Eho
      extend Discordrb::Commands::CommandContainer
  
      attrs = {
        description: '今年の恵方を教えてくれます。',
        usage: 'eho' 
      }
  
      command :eho, attrs do |event|
        thisyear = Time.now.year
        calceho = thisyear%5
        if calceho==0||calceho==5 then
            event.send_message("今年(#{thisyear})の恵方は\n西南西\n255°")
        elsif calceho==1||calceho==3 then
            event.send_message("今年(#{thisyear})の恵方は\n南南東\n165°")
        elsif calceho==2 then
            event.send_message("今年(#{thisyear})の恵方は\n北北西\n345°")
        elsif calceho==4
            event.send_message("今年(#{thisyear}の恵方は\n東北東\n75°")
        end
      end
    end
  end
  