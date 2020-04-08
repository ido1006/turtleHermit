module Bot::DiscordCommands
    module Color
      extend Discordrb::Commands::CommandContainer
      # おまじないです module名はこのソースのコマンド名でおkだと思います。
      # module名の1文字目は大文字にしてください。エラー吐いた！(2020/4/7追記)
  
      attrs = {
        description: '入力された色を生成します。引数なしの場合はランダム生成されます。( https://twitter.com/0faa0f のDiscord版)', # プログラムの説明を書きます ,を忘れないで(2敗)
        usage: 'color <HTMLcolorcode(hex)>' # コードの使い方を書きます
      }
  
      command :color, attrs do |event, args| # event はコマンド自身、args は引数
        # 中身を書きます
        # よく ~~_message として
        # 内容を関数に投げます
        event.respond(makecolor(args: args)) #respondの中身のmessageをsample_message から受け取りますよってこと
        event.send_file(File.open('src/commands/colorpicture/image.png', 'r'))
      end
  
      def self.makecolor(args: nil) # self. を忘れずに！
        args ||= "NOCOLOR"
        if args=="NOCOLOR" then
            r = rand(0xff)
	        g = rand(0xff)
            b = rand(0xff)
        else
            args = "abcdefg".delete("#")
            color = args.scan(/.{1,#{2}}/)
            r = color[0]
            g = color[1]
            b = color[2]
        end


        File.open("src/commands/colorpicture/ccg.txt","w") do |text|
        	text.puts(r)
        	text.puts(g)
            text.puts(b)
        end

        Open3.capture3("ruby src/commands/colorpicture/genim.rb > colorpicture/image.png")

    	if r==0 then
	        rs = "00"
        elsif r==1 then
            rs = "01"
        elsif r==2 then
	        rs = "02"
        elsif r==3 then
	        rs = "03"
        elsif r==4 then
	        rs = "04"
        elsif r==5 then
        	rs = "05"
        elsif r==6
	    	rs = "06"
      	elsif r==7
    		rs = "07"
    	elsif r==8
    		rs = "08"
    	elsif r==9
   		    rs = "09"
        elsif r==10
    	    rs = "0a"
    	elsif r==11
    		rs = "0b"
        elsif r==12
        	rs = "0c"
        elsif r==13
        	rs = "0d"
        elsif r==14
        	rs = "0e"
        elsif r==15
        	rs = "0f"
        else
		    rs = r.to_s(16)
	    end
	
        if g==0 then
	        gs = "00"
	    elsif g==1 then
	        gs = "01"
        elsif g==2 then
	        gs = "02"
	    elsif g==3 then
		    gs = "03"
        elsif g==4 then
	    	gs = "04"
	    elsif g==5 then
	        gs = "05"
        elsif g==6
	    	gs = "06"
	    elsif g==7
	        gs = "07"
        elsif g==8
	    	gs = "08"
	    elsif g==9
		    gs = "09"
        elsif g==10
	        gs = "0a"
	    elsif g==11
		    gs = "0b"
        elsif g==12
	        gs = "0c"
	    elsif g==13
		    gs = "0d"
        elsif g==14
	        gs = "0e"
	    elsif g==15
		    gs = "0f"
        else
	        gs = g.to_s(16)
	    end

        if b==0 then
	        bs = "00"
	    elsif b==1 then
		    bs = "01"
        elsif b==2 then
	    	bs = "02"
	    elsif b==3 then
	        bs = "03"
        elsif b==4 then
	    	bs = "04"
	    elsif b==5 then
	        bs = "05"
        elsif b==6
	    	bs = "06"
	    elsif b==7
	        bs = "07"
        elsif b==8
	    	bs = "08"
	    elsif b==9
	        bs = "09"
        elsif b==10
	    	bs = "0a"
	    elsif b==11
	        bs = "0b"
        elsif b==12
	    	bs = "0c"
	    elsif b==13
	        bs = "0d"
	    elsif b==14
        	bs = "0e"
	    elsif b==15
	    	bs = "0f"
        else
	    	bs = b.to_s(16)
	    end
        colorcode="#" + rs + gs + bs
        colorcode
        end
    end
end