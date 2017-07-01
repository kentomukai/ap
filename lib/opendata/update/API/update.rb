require '../../config.rb'

#ベンチマーク
require 'benchmark'
result = Benchmark.realtime do

  #APIから最新データを取得する
  require "#{$WORKPATH}/update/API/get_itdb.rb"
  require "#{$WORKPATH}/update/API/get_dataSet.rb"

  #データベースに接続
  require 'mysql'
  db = Mysql::init
  db.options(Mysql::OPT_LOCAL_INFILE, true)
  db.connect("#{$HOST}", "#{$USER}", "#{$PASS}", "#{$NAME}")

  #データベースの初期化
  db.query("delete from investmentPlan;")
  db.query("delete from investmentByExpense;")
  db.query("delete from businessInformation;")
  db.query("delete from businessSpending;")
  db.query("delete from businessBudget;")
  db.query("delete from dataCatalogue;")

  #データベースに最新データをインポート（IT DASHBOARD）
  db.query("load data local infile '#{$WORKPATH}/update/API/output/investmentPlan.csv' into table investmentPlan fields terminated by ',';")
  db.query("load data local infile '#{$WORKPATH}/update/API/output/investmentByExpense.csv' into table investmentByExpense fields terminated by ',';")
  db.query("load data local infile '#{$WORKPATH}/update/API/output/businessInformation.csv' into table businessInformation fields terminated by ',';")
  db.query("load data local infile '#{$WORKPATH}/update/API/output/businessSpending.csv' into table businessSpending fields terminated by ',';")
  db.query("load data local infile '#{$WORKPATH}/update/API/output/businessBudget.csv' into table businessBudget fields terminated by ',';")
  
  #データベースに最新データをインポート（データカタログサイト）
  Dir.chdir("#{$WORKPATH}/update/API/output")
  nameArray = Dir.glob("dataSet*")
  nameArray.each do |fileName|
    db.query("load data local infile '#{$WORKPATH}/update/API/output/#{fileName}' into table dataCatalogue fields terminated by ',';")
  end
  db.close
end

#ログ収集
require "date"
File.open("#{$WORKPATH}/update/API/log/log.txt", "a") do |f|
  f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒")
end