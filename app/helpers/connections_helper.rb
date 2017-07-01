module ConnectionsHelper
    def search(query)
        
        load '/Users/kentomukai/ap/lib/opendata/config.rb'

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

        # Zip処理の実行
        Zip::File.open("#{$WORKPATH}/lib/opendata/search/output/result.zip", Zip::File::CREATE) do |zipfile|
            targetFiles.each do |file|
                zipfile.add(file, "#{$WORKPATH}/lib/opendata/search/output/#{file}")
            end
        end

        #ファイルを送信する(Zipにすること)
        send_file "#{$WORKPATH}/lib/opendata/search/output/result.zip"
    end
end