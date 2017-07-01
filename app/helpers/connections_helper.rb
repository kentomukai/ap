module ConnectionsHelper
    def search(query)

        #config.rbのデータ
        $WORKPATH = "/Users/kentomukai/db"
        $HOST = "127.0.0.1"
        $USER = "root"
        $PASS = "ken0912e"
        $NAME = "od"
        require 'rubygems'
        
        #検索結果の初期化
        require 'FileUtils'
        FileUtils.rm_rf("#{$WORKPATH}/search/output")
        FileUtils.mkdir("#{$WORKPATH}/search/output")

        #データベースへ接続
        db = Mysql::init
        db.connect("#{$HOST}", "#{$USER}", "#{$PASS}", "#{$NAME}")

        #データベースを検索
        statement = "call searching('#{query}');"
        db.query(statement)
        db.close

        #空のCSVファイルを削除
        Dir.chdir("#{$WORKPATH}/search/output")
        nameArray = Dir.glob("*.csv")
        nameArray.each do |fileName|
            File.delete("#{$WORKPATH}/search/output/#{fileName}") if ! File.size? ("#{$WORKPATH}/search/output/#{fileName}")
        end

        #検索結果のファイル名を取得
        Dir.chdir("#{$WORKPATH}/search/output")
        outputArray = Dir.glob("*.csv")
        targetFiles = []

        outputArray.each do |fileName|
            targetFiles.push(fileName)
        end

        # Zip処理の実行
        Zip::File.open("#{$WORKPATH}/search/output/result.zip", Zip::File::CREATE) do |zipfile|
            targetFiles.each do |file|
                zipfile.add(file, "#{$WORKPATH}/search/output/#{file}")
            end
        end

        #ファイルを送信する(Zipにすること)
        send_file "#{$WORKPATH}/search/output/result.zip"
    end
end