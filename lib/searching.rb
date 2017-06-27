#検索結果の初期化
require 'FileUtils'
FileUtils.rm_rf('/Users/kentomukai/db/db_search/output')
FileUtils.mkdir('/Users/kentomukai/db/db_search/output')

#データベースへ接続
require 'mysql'
db = Mysql::init
db.connect("127.0.0.1", "root", "ken0912e", "od")

#データベースを検索
statement = "call searching('労働');"
db.query(statement)
db.close

#空のCSVファイルを削除
Dir.chdir("/Users/kentomukai/db/db_search/output")
nameArray = Dir.glob("*.csv")
nameArray.each do |fileName|
    if ! File.size?("/Users/kentomukai/db/db_search/output/#{fileName}")
        File.delete "/Users/kentomukai/db/db_search/output/#{fileName}"
    end
end