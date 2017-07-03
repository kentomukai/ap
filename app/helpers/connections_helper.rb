module ConnectionsHelper
    def simpleSearch(query)

        #ベンチマーク
        require 'benchmark'
        result = Benchmark.realtime do

            #検索結果の初期化
            require 'FileUtils'
            FileUtils.rm_rf("#{$WORKPATH}/lib/opendata/search/output")
            FileUtils.mkdir("#{$WORKPATH}/lib/opendata/search/output")

            #データベースへ接続
            db = Mysql::init
            db.connect("#{$HOST}", "#{$USER}", "#{$PASS}", "#{$NAME}")

            #データベースを検索
            statement = "call searching('#{query}');"
            db.query(statement)
            db.close

            #空のCSVファイルを削除
            Dir.chdir("#{$WORKPATH}/lib/opendata/search/output")
            nameArray = Dir.glob("*.csv")
            nameArray.each do |fileName|
                File.delete("#{$WORKPATH}/lib/opendata/search/output/#{fileName}") if ! File.size? ("#{$WORKPATH}/lib/opendata/search/output/#{fileName}")
            end

            #検索結果のファイル名を取得
            Dir.chdir("#{$WORKPATH}/lib/opendata/search/output")
            outputArray = Dir.glob("*.csv")
            targetFiles = []
            outputArray.each do |fileName|
                targetFiles.push(fileName)
            end

            #CSVファイルがなければ、Zip処理はやらない（うまく動作しない）
            require "date"
            if targetFiles.length != 0

                # Zip処理の実行
                zipFileName = "#{Time.now.strftime("%Y_%m%d_%H%M")}#{query}.zip"
                Zip::File.open("#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}", Zip::File::CREATE) do |zipfile|
                    targetFiles.each do |file|
                        zipfile.add(file, "#{$WORKPATH}/lib/opendata/search/output/#{file}")
                    end
                end

                #ファイルを送信する(Zipにすること)
                send_file "#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}"
            end
        end

        #ログ収集
        File.open("#{$WORKPATH}/lib/opendata/search/log/log.txt", "a") do |f|
            f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒, SearchingWord: #{query}")
        end
    end
end