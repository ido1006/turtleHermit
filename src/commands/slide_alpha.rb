module Bot::DiscordCommands
    module Slide
        extend Discordrb::Commands::CommandContainer
      
        attrs = {
            description: 'アルファベットを指定した分ずらします', # プログラムの説明を書きます ,を忘れないで(2敗)
            usage: 'slide <text> <num>' # コードの使い方を書きます
        }
  
        command :slide, attrs do |event, args, num| # event はコマンド自身、args は引数
            event.respond(slide_message(args: args, num: num)) #respondの中身のmessageをsample_message から受け取りますよってこと
        end
  
        def self.slide_message(args: nil, num: nil) # self. を忘れずに！
            num ||= "0"
            num = num.to_i
            args ||= "abc" # 引数が空っぽの時の処理
            alphabet_small = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
            alphabet_big = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

            for i in 0..args.size-1 do
                x = args[i].ord
                a_s = "a".ord
                z_s = "z".ord
                a_l = "A".ord
                z_l = "Z".ord
    
                if a_s <= x && x <= z_s then
                    x += num
                    if x < a_s then
                        x = a_s + 26 - ((a_s - x) % 26)
                    end
                    if x >= z_s then
                        x = a_s + ((x - a_s) % 26)
                    end
                    args[i] = x.chr
                end
    
                if a_l <= x && x <= z_l then
                    x += num
                    if x < a_l then
                        x = a_l + 26 - ((a_l - x) % 26)
                    end
                    if x >= z_l then
                        x = a_l + ((x - a_l) % 26)
                    end
                    args[i] = x.chr
                end

                if n_0 <= x && x <= n_9 then
                    x += num
                    if x < n_0 then
                        x = n_0 + 10 - ((n_0 - x) % 10)
                    end
                    if x > n_9 then
                        x = n_0 + ((x - n_0) % 10)
                    end
                    args[i] = x.chr
                end
            end

            message = "#{args}"
            message # 戻り値としてmessageを返します
        end
    end
end

