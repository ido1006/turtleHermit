module Bot::DiscordCommands
  module Sample
    extend Discordrb::Commands::CommandContainer
    # おまじないです module名はこのソースのコマンド名でおkだと思います。
    # module名の1文字目は大文字にしてください。エラー吐いた！(2020/4/7追記)

    attrs = {
      description: 'module追加用のサンプルです。', # プログラムの説明を書きます ,を忘れないで(2敗)
      usage: 'url: https://github.com/ido1006/turtleHermit' # コードの使い方を書きます
    }

    command :sample, attrs do |event, args| # event はコマンド自身、args は引数
      # 中身を書きます
      # よく ~~_message として
      # 内容を関数に投げます
      event.respond(sample_message(args: args)) #respondの中身のmessageをsample_message から受け取りますよってこと
    end

    def self.sample_message(args: nil) # self. を忘れずに！
      args ||= "world" # 引数が空っぽの時の処理
      message = "hello, #{args}!"
      message # 戻り値としてmessageを返します
    end
  end
end
