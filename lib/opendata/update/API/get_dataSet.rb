require '../../config.rb'

#書き出し用ファイルを初期化
Dir.chdir("#{$WORKPATH}/update/API/output")
fileNameArray = Dir.glob("dataSet*")
fileNameArray.each do |file| 
    begin
        File.delete "#{$WORKPATH}/update/API/output/#{file}"
    rescue
    end
end

#ページ用配列の宣言
pages = 0
hash = {}

while true

    if hash.any? then
        pages += 1000
    end

    #データカタログサイトからデータを取得
    require 'net/http'
    url = URI.parse("http://www.data.go.jp/data/api/action/package_search?rows=1000&start=#{pages}")
    res = Net::HTTP.get_response(url)

    #JSONをハッシュに変換
    require "json"
    json = res.body
    hash = JSON.parse json

    #ページが空になったら終了
    if hash["result"]["results"].length == 0 then
        break
    end

    #ヘッダデータを削除して、配列に変換
    array = hash["result"]["results"]

    #CSVデータの作成
    array.each do |i|
        rehash = i
        preData = ""
        rehash.reverse_each do |key,value|
            File.open("#{$WORKPATH}/update/API/output/dataSet_#{pages}.csv", "a") do |f|
                if "#{key}" == 'title' then
                    preData << ("#{value.gsub(/(\R)|,|\t|\s|　/," ")},")
                elsif "#{key}" == 'organization' then
                    value.each do |reKey,reValue|
                        if "#{reKey}" == 'title' then
                            preData << ("#{reValue.gsub(/(\R)|,|\t|\s|　/," ")},")
                        end 
                    end
                elsif "#{key}" == 'extras' then
                    value.each do |reKey,reValue|
                        reKey.each do |rereKey,rereValue|
                            case reKey["#{rereKey}"]
                                when "contactPoint" then
                                    preData << ("#{reKey["value"].gsub(/(\R)|,|\t|\s|　/," ")},")
                                when "creator" then
                                    preData << ("#{reKey["value"].gsub(/(\R)|,|\t|\s|　/," ")},")
                                when "description" then
                                    preData << ("#{reKey["value"].gsub(/(\R)|,|\t|\s|　/," ")},")
                                when "frequency_of_update" then
                                    preData << ("#{reKey["value"].gsub(/(\R)|,|\t|\s|　/," ")},")
                            end
                        end
                    end	
                elsif "#{key}" == 'resources' then
                    value.each do |reKey,reValue|
                        f.print("#{preData}")
                        f.print("#{reKey["description"].gsub(/(\R)|,|\t|\s|　/," ")},")
                        f.print("#{reKey["format"].gsub(/(\R)|,|\t|\s|　/," ")},")
                        f.print("#{reKey["name"].gsub(/(\R)|,|\t|\s|　/," ")},")
                        f.puts("#{reKey["url"].gsub(/(\R)|,|\t|\s|　/," ")}")
                    end
                end
            end
        end
    end
end