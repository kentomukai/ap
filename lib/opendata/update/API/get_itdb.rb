#APIとファイル名の集合
set = {'http://www.itdashboard.go.jp/PublicApi/getData.json?dataset=InvestmentPlan'=>"investmentPlan.csv",
       'http://www.itdashboard.go.jp/PublicApi/getData.json?dataset=InvestmentByExpense'=>"investmentByExpense.csv",
       'http://www.itdashboard.go.jp/PublicApi/getData.json?dataset=BusinessInformation'=>"businessInformation.csv",
       'http://www.itdashboard.go.jp/PublicApi/getData.json?dataset=BusinessSpending'=>"businessSpending.csv",
       'http://www.itdashboard.go.jp/PublicApi/getData.json?dataset=BusinessBudget'=>"businessBudget.csv"}

#APIとファイル名の組み合わせで繰り返し処理
set.each do |api,fileName|

    #IT　DASHBOARDからデータを取得
    require 'net/http'
    url = URI.parse("#{api}")
    res = Net::HTTP.get_response(url)

    #JSONをハッシュに変換
    require 'json'
    json = res.body
    hash = JSON.parse json

    #ヘッダデータを削除して、配列に変換
    array = hash["raw_data"]
    rehash = {}

    #書き出し用ファイルを初期化
    begin
        File.delete "#{$WORKPATH}/lib/opendata/update/API/output/#{fileName}"
    rescue
    end

    #CSVデータの作成
    array.each do |i|
        rehash = i
        rehash.each_with_index do |(key,value),index|
            File.open("#{$WORKPATH}/lib/opendata/update/API/output/#{fileName}", "a") do |f|
                if index == (rehash.size - 1) then
                    if "#{value}" == '' then
                        f.puts "-"
                    else
                        f.puts "#{value}"
                    end
                else
                    if value.instance_of?(String) then
                        f.print "#{value.gsub(/(\R)|,|\t|\s|　/,"")},"
                    else
                        f.print "#{value},"
                    end
                end
            end
        end
    end
end