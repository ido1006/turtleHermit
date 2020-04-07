module Bot::DiscordCommands
  module Jalphabet
    extend Discordrb::Commands::CommandContainer
    # おまじないです module名はこのソースのコマンド名でおkだと思います

    attrs = {
      description: 'アルファべットを近い形の平仮名,片仮名,漢字に変換するよ。アルファベット以外は変換されないよ。(大文字小文字区別なし、一部機種依存文字あり)', # プログラムの説明を書きます ,を忘れないで(2敗)
      usage: 'jalphabet <text>' # コードの使い方を書きます
    }

    command :jalphabet, attrs do |event, args| # event はコマンド自身、args は引数
      # 中身を書きます
      # よく ~~_message として
      # 内容を関数に投げます
      event.respond(jalphabet_message(args: args)) #respondの中身のmessageをsample_message から受け取りますよってこと
    end

    def self.jalphabet_message(args: nil) # self. を忘れずに！
      args ||= "引数が空っぽやで。" # 引数が空っぽの時の処理
      args = args.gsub('a','ム')
      args = args.gsub('b','阝')
      args = args.gsub('c','て')
      args = args.gsub('d','ワ')
      args = args.gsub('e','モ')
      args = args.gsub('f','テ')
      args = args.gsub('g','巴')
      args = args.gsub('h','カ')
      args = args.gsub('i','エ')
      args = args.gsub('j','チ')
      args = args.gsub('k','片')
      args = args.gsub('l','よ')
      args = args.gsub('m','巾')
      args = args.gsub('n','卩')
      args = args.gsub('o','ロ')
      args = args.gsub('p','尸')
      args = args.gsub('q','曰')
      args = args.gsub('r','尺')
      args = args.gsub('s','丂')
      args = args.gsub('t','ナ')
      args = args.gsub('u','凵')
      args = args.gsub('v','レ')
      args = args.gsub('w','山')
      args = args.gsub('x','メ')
      args = args.gsub('y','ソ')
      args = args.gsub('z','之')
      args = args.gsub('A','ム')
      args = args.gsub('B','阝')
      args = args.gsub('C','て')
      args = args.gsub('D','ワ')
      args = args.gsub('E','モ')
      args = args.gsub('F','テ')
      args = args.gsub('G','巴')
      args = args.gsub('H','カ')
      args = args.gsub('I','エ')
      args = args.gsub('J','チ')
      args = args.gsub('K','片')
      args = args.gsub('L','よ')
      args = args.gsub('M','巾')
      args = args.gsub('N','卩')
      args = args.gsub('O','ロ')
      args = args.gsub('P','尸')
      args = args.gsub('Q','曰')
      args = args.gsub('R','尺')
      args = args.gsub('S','丂')
      args = args.gsub('T','ナ')
      args = args.gsub('U','凵')
      args = args.gsub('V','レ')
      args = args.gsub('W','山')
      args = args.gsub('X','メ')
      args = args.gsub('Y','ソ')
      args = args.gsub('Z','之')
      message = "#{args}"
      message # 戻り値としてmessageを返します
    end
  end
end
