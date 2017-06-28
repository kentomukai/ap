module ConnectionsHelper
    def search(query)

        $WORKPATH = "/Users/kentomukai/db"
        $HOST = "127.0.0.1"
        $USER = "root"
        $PASS = "ken0912e"
        $NAME = "od"
        
        #検索結果の初期化
        require 'FileUtils'
        FileUtils.rm_rf("#{$WORKPATH}/search/output")
        FileUtils.mkdir("#{$WORKPATH}/search/output")

        #データベースへ接続
        require 'rubygems'
        require 'mysql'
        db = Mysql::init
        db.connect("#{$HOST}", "#{$USER}", "#{$PASS}", "#{$NAME}")

        #データベースを検索
        statement = "call searching('うんこ');"
        db.query(statement)
        db.close

        #空のCSVファイルを削除
        Dir.chdir("#{$WORKPATH}/search/output")
        nameArray = Dir.glob("*.csv")
        nameArray.each do |fileName|
            File.delete("#{$WORKPATH}/search/output/#{fileName}") if ! File.size? ("#{$WORKPATH}/search/output/#{fileName}")
        end
    end
end