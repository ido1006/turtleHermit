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

        for i in 0..25 do
            j = i + num
            if j < 0 then
                j += 26 * (-j / 26 + 1)
            end
            if j >= 26 then
                j -= 26 * (j / 26)
            end

            args = args.gsub(alphabet_small[i], alphabet_small[j])
            args = args.gsub(alphabet_big[i], alphabet_big[j])
        end

        message = "#{args}"
        message # 戻り値としてmessageを返します
      end
    end
  end
