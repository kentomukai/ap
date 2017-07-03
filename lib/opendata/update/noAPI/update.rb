#注意：平成27年度（平成28年3月31日現在）のデータ。保管前にUTF-8に変換する必要あり
#ベンチマーク
require 'benchmark'
result = Benchmark.realtime do

    #CSVファイルの正規化
    load "#{$WORKPATH}/lib/opendata/update/noAPI/convert.rb"

    #データベースに接続
    require 'mysql'
    db = Mysql::init
    db.options(Mysql::OPT_LOCAL_INFILE, true)
    db.connect("#{$HOST}", "#{$USER}", "#{$PASS}", "#{$NAME}")

    #データベースの初期化（行政財産）
    db.query("delete from kokudokotusyoProperty;")
    db.query("delete from keizaisangyosyoProperty;")
    db.query("delete from keisatutyoProperty;")
    db.query("delete from kankyosyoProperty;")
    db.query("delete from kaikeikensainProperty;")
    db.query("delete from jinjiinProperty;")
    db.query("delete from houmusyoProperty;")
    db.query("delete from gaimusyoProperty;")
    db.query("delete from boueisyoProperty;")
    db.query("delete from zaimusyoProperty;")
    db.query("delete from syugiinProperty;")
    db.query("delete from soumusyoProperty;")
    db.query("delete from sangiinProperty;")
    db.query("delete from saikousaiProperty;")
    db.query("delete from nosuisyoProperty;")
    db.query("delete from naikakuhuProperty;")
    db.query("delete from naikakuProperty;")
    db.query("delete from monbukagakusyoProperty;")
    db.query("delete from kunaityoProperty;")
    db.query("delete from koseirodosyoProperty;")

    #データベースの初期化（普通財産）
    db.query("delete from ordinaryProperty;")
    db.query("delete from MOFofferToOtherProperty;")
    db.query("delete from offerToUSmilitaryProperty;")
    db.query("delete from marketValueLoanProperty;")
    db.query("delete from reducedLoanProperty;")
    db.query("delete from freeLendingProperty;")
    db.query("delete from unusedProperty;")
    db.query("delete from specialAccountProperty;")
    db.query("delete from othersProperty;")
    db.query("delete from investGeneralProperty;")
    db.query("delete from investSpecialProperty;")

    #データベースにインポート
    Dir.chdir("#{$WORKPATH}/lib/opendata/update/noAPI/convertedFile")
    nameArray = Dir.glob("*.csv")
    nameArray.each do |fileName|
        tableName = fileName.gsub(".csv", "")
        db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/noAPI/convertedFile/#{fileName}' into table #{tableName} FIELDS TERMINATED BY ',' IGNORE 1 LINES;")
    end
    db.close

#ログ収集
require "date"
File.open("#{$WORKPATH}/lib/opendata/update/noAPI/log/log.txt", "a") do |f|
  f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒")
end