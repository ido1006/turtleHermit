module Bot::DiscordCommands
  module Mishimada
    extend Discordrb::Commands::CommandContainer
    # おまじないです module名はこのソースのコマンド名でおkだと思います。
    # module名の1文字目は大文字にしてください。エラー吐いた！(2020/4/7追記)

    attrs = {
      description: '三島-島田(静岡)間の発車時刻,到着時刻をお伝えします。土日対応は気が向いたらします。多分向かない。', # プログラムの説明を書きます ,を忘れないで(2敗)
      usage: '&mishimada [m2s or s2m] [hhmm]' # コードの使い方を書きます
    }

    command :mishimada, attrs do |event, direction, searchTime| # event はコマンド自身、args は引数
      # 中身を書きます
      # よく ~~_message として
      # 内容を関数に投げます
      event.respond(mishimada_message(direction: direction, searchTime: searchTime)) #respondの中身のmessageをsample_message から受け取りますよってこと
    end

    def self.mishimada_message(direction: nil, searchTime: nil) # self. を忘れずに！
      direction ||= "NON-DIRECTION" # 引数が空っぽの時の処理
      time = DateTime.now
      time = time.new_offset(Rational(9,24))
      searchTime ||= time.strftime('%H%M')
      searchTime = searchTime[1,2].to_i * 60 + searchTime[3,4].to_i
      if direction == "NON-DIRECTION" then
        message = "Put direction (m2s or s2m)."
      elsif direction == "m2s" then
        message = m2s_message(searchTime: searchTime)
      elsif direction == "s2m" then
        message = s2m_message(searchTime: searchTime)
      end
      message += searchTime
      message # 戻り値としてmessageを返します
    end

    def self.m2s_message(searchTime: nil)
      message = ""
      if searchTime <= 5*60+32 then
        message = "0532三島発\n"
        message += "静岡で乗り換え -> 0701島田着\n"
        message += "静岡で乗り換えない -> 0716島田着"
      elsif searchTime <= 5*60+45 then
        message = "0545三島発\n"
        message += "0726島田着"
      elsif searchTime <= 6*60+19 then
        message = "0619三島発\n"
        message += "沼津で乗り換え -> 0756島田着"
      elsif searchTime <= 6*60+32 then
        message = "0632三島発\n"
        message += "0808島田着"
      elsif searchTime <= 7*60+02 then
        message = "0702三島発\n"
        message += "0833島田着"
      elsif searchTime <= 7*60+11 then
        message = "0711三島発\n"
        message += "0845島田着"
      elsif searchTime <= 7*60+29 then
        message = "0729三島発\n"
        message += "静岡で乗り換え -> 0856島田着"
      elsif searchTime <= 7*60+35 then
        message = "0735三島発\n"
        message += "0910島田着"
      elsif searchTime <= 7*60+48 then
        message = "0748三島発\n"
        message += "静岡で乗り換え -> 0924島田着\n"
        message += "静岡で乗り換えない -> 0932島田着"
      elsif searchTime <= 8*60+15 then
        message = "0815三島発\n"
        message += "静岡で乗り換え -> 0947島田着"
      elsif searchTime <= 8*60+36 then
        message = "0836三島発\n"
        message += "沼津で乗り換え -> 1008島田着"
      elsif searchTime <= 9*60+1 then
        message = "0901三島発\n"
        message += "沼津で乗り換え -> 1037島田着"
      elsif searchTime <= 9*60+25 then
        message = "0925三島発\n"
        message += "1055島田着"
      elsif searchTime <= 9*60+51 then
        message = "0951三島発\n"
        message += "1119島田着"
      elsif searchTime <= 10*60+13 then
        message = "1013三島発\n"
        message += "清水で乗り換え -> 1147島田着"
      elsif searchTime <= 10*60+29 then
        message = "1029三島発\n"
        message += "静岡で乗り換え -> 1158島田着"
      elsif searchTime <= 10*60+46 then
        message = "1046三島発\n"
        message += "1219島田着"
      elsif searchTime <= 11*60+4 then
        message = "1104三島発\n"
        message += "沼津で乗り換え -> 1238島田着"
      elsif searchTime <= 11*60+27 then
        message = "1127三島発\n"
        message += "静岡で乗り換え -> 1259島田着"
      elsif searchTime <= 11*60+50 then
        message = "1150三島発\n"
        message += "静岡で乗り換え -> 1319島田着"
      elsif searchTime <= 12*60+8 then
        message = "1208三島発\n"
        message += "1339島田着"
      elsif searchTime <= 12*60+29 then
        message = "1229三島発\n"
        message += "1359島田着"
      elsif searchTime <= 12*60+48 then
        message = "1248三島発\n"
        message += "1417島田着"
      elsif searchTime <= 13*60+9 then
        message = "1309三島発\n"
        message += "沼津,静岡で乗り換え -> 1439島田着\n"
        message += "静岡で乗り換えない -> 1448島田着"
      elsif searchTime <= 13*60+28 then
        message = "1328三島発\n"
        message += "沼津,静岡で乗り換え -> 1458島田着"
      elsif searchTime <= 13*60+46 then
        message = "1346三島発\n"
        message += "1518島田着"
      elsif searchTime <= 14*60+8 then
        message = "1408三島発\n"
        message += "1538島田着"
      elsif searchTime <= 14*60+28 then
        message = "1428三島発\n"
        message += "1608島田着"
      elsif searchTime <= 14*60+51 then
        message = "1451三島発\n"
        message += "1630島田着"
      elsif searchTime <= 15*60+7 then
        message = "1507三島発\n"
        message += "1641島田着"
      elsif searchTime <= 15*60+25 then
        message = "1525三島発\n"
        message += "静岡で乗り換え -> 1655島田着"
      elsif searchTime <= 15*60+32 then
        message = "1532三島発\n"
        message += "1709島田着"
      elsif searchTime <= 15*60+52 then
        message = "1552三島発\n"
        message += "1728島田着"
      elsif searchTime <= 16*60+11 then
        message = "1611三島発\n"
        message += "1738島田着"
      elsif searchTime <= 16*60+30 then
        message = "1630三島発\n"
        message += "1804島田着"
      elsif searchTime <= 16*60+38 then
        message = "1638三島発\n"
        message += "1813島田着"
      elsif searchTime <= 16*60+50 then
        message = "1650三島発\n"
        message += "1828島田着"
      elsif searchTime <= 17*60+11 then
        message = "1711三島発\n"
        message += "1846島田着"
      elsif searchTime <= 17*60+25 then
        message = "1725三島発\n"
        message += "1858島田着"
      elsif searchTime <= 17*60+36 then
        message = "1736三島発\n"
        message += "沼津,静岡で乗り換え -> 1909島田着\n"
        message += "静岡で乗り換えない -> 1916島田着"
      elsif searchTime <= 17*60+51 then
        message = "1751三島発\n"
        message += "1927島田着"
      elsif searchTime <= 18*60+4 then
        message = "1804三島発\n"
        message += "1938島田着"
      elsif searchTime <= 18*60+34 then
        message = "1834三島発\n"
        message += "沼津で乗り換え -> 2003島田着"
      elsif searchTime <= 18*60+52 then
        message = "1852三島発\n"
        message += "2036島田着"
      elsif searchTime <= 17*60+51 then
        message = "1908三島発\n"
        message += "2045島田着"
      elsif searchTime <= 19*60+27 then
        message = "1927三島発\n"
        message += "静岡で乗り換え -> 2101島田着"
      elsif searchTime <= 19*60+39 then
        message = "1939三島発\n"
        message += "2129島田着"
      elsif searchTime <= 20*60+2 then
        message = "2002三島発\n"
        message += "2143島田着"
      elsif searchTime <= 20*60+23 then
        message = "2023三島発\n"
        message += "2157島田着"
      elsif searchTime <= 20*60+40 then
        message = "2040三島発\n"
        message += "2207島田着"
      elsif searchTime <= 21*60+2 then
        message = "2102三島発\n"
        message += "静岡で乗り換え -> 2241島田着"
      elsif searchTime <= 21*60+27 then
        message = "2127三島発\n"
        message += "沼津,静岡で乗り換え -> 2307島田着"
      elsif searchTime <= 21*60+49 then
        message = "2149三島発\n"
        message += "静岡で乗り換え -> 2331島田着"
      elsif searchTime <= 22*60+16 then
        message = "2216三島発\n"
        message += "沼津,静岡で乗り換え -> 2343島田着"
      else
        message = "終電で〜す！"
      end
      message
    end
    
    def self.s2m_message(searchTime: nil)
      message = "現時点で島田から三島の情報なんざ要らんことに気づいたので,やる気が出たら書く"

      message
    end

  end
end
