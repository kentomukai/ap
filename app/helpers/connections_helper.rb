module ConnectionsHelper
    def simpleSearch(query)

        #ベンチマーク
        require 'benchmark'
        result = Benchmark.realtime do

            #検索結果の初期化
            ApplicationHelper::output_init()

            #データベースへ接続
            db = ApplicationHelper::connect_database

            #データベースを検索
            db.query("call searching('#{query}');")
            db.close

            #検索結果を調整
            targetFiles = ApplicationHelper::arrange_data(query)

            #CSVファイルがなければ、Zip処理はやらない
            require "date"
            if targetFiles.length != 0

                # Zip処理の実行
                zipFileName = "#{Time.now.strftime("%Y%m%d_")}#{query}.zip"
                Zip::File.open("#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}", Zip::File::CREATE) do |zipfile|
                    targetFiles.each do |file|
                        zipfile.add(file, "#{$WORKPATH}/lib/opendata/search/output/#{file}")
                    end
                end
                #ファイルを送信する(Zipにすること)
                send_file "#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}"
            else
                flash[:info] = "該当するデータが見つかりませんでした。別のキーワードで検索してください。"
                redirect_to root_path
            end
        end

        #ログ収集
        File.open("#{$WORKPATH}/lib/opendata/search/log/log.txt", "a") do |f|
            f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒, SearchingWord: #{query}")
        end
    end

    def detailSearch(query, attribute)

        #データベースへ接続
        db = ApplicationHelper::connect_database

        #検索結果の初期化
        ApplicationHelper::output_init()

        #データベースを検索
        statement = ApplicationHelper::detais_sql(query, attribute)
        db.query(statement)
        db.close

        #検索結果を調整
        targetFiles = ApplicationHelper::arrange_data(query)

        #CSVファイルがなければ、Zip処理はやらない
        require "date"
        if targetFiles.length != 0

            # Zip処理の実行
            zipFileName = "#{Time.now.strftime("%Y%m%d_")}#{query}.zip"
            Zip::File.open("#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}", Zip::File::CREATE) do |zipfile|
                targetFiles.each do |file|
                    zipfile.add(file, "#{$WORKPATH}/lib/opendata/search/output/#{file}")
                end
            end

            #ファイルを送信する(Zipにすること)
            send_file "#{$WORKPATH}/lib/opendata/search/output/#{zipFileName}"
        else
            flash[:info] = "該当するデータが見つかりませんでした。別のキーワードで検索してください。"
            redirect_to detail_path
        end
    end
    
    def apiHelper(siteName)

        #ベンチマーク
        require 'benchmark'
        result = Benchmark.realtime do

            #データベースに接続
            db = ApplicationHelper::connect_database

            #最新データを登録する
            case siteName

                #データカタログサイト
                when "data" 
                
                    #最新データを取得
                    load "#{$WORKPATH}/lib/opendata/update/API/get_dataSet.rb"
                    
                    #データベースの初期化
                    db.query("delete from dataCatalogue;")

                    #最新データをインポート
                    Dir.chdir("#{$WORKPATH}/lib/opendata/update/API/output")
                    nameArray = Dir.glob("dataSet*")
                    nameArray.each do |fileName|
                        db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/#{fileName}' into table dataCatalogue fields terminated by ',';")
                    end
                
                #IT DASHBOARD
                when "itdb" then
                    
                    #最新データを取得
                    load "#{$WORKPATH}/lib/opendata/update/API/get_itdb.rb"

                    #データベースの初期化
                    db.query("delete from investmentPlan;")
                    db.query("delete from investmentByExpense;")
                    db.query("delete from businessInformation;")
                    db.query("delete from businessSpending;")
                    db.query("delete from businessBudget;")

                    #最新データをインポート
                    db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/investmentPlan.csv' into table investmentPlan fields terminated by ',';")
                    db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/investmentByExpense.csv' into table investmentByExpense fields terminated by ',';")
                    db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/businessInformation.csv' into table businessInformation fields terminated by ',';")
                    db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/businessSpending.csv' into table businessSpending fields terminated by ',';")
                    db.query("load data local infile '#{$WORKPATH}/lib/opendata/update/API/output/businessBudget.csv' into table businessBudget fields terminated by ',';")

                when "info" then
                else
            end

            #データベースの接続を閉じる
            db.close
        end

        #ログ収集
        require "date"
        File.open("#{$WORKPATH}/lib/opendata/update/API/log/log.txt", "a") do |f|
            f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒")
        end
    end

    def noapiHelper(siteName)
        #注意：平成27年度（平成28年3月31日現在）のデータ。保管前にUTF-8に変換する必要あり

        #ベンチマーク
        require 'benchmark'
        result = Benchmark.realtime do

            #データベースに接続
            db = ApplicationHelper::connect_database

            #最新データを登録する
            case siteName

                #行例事業レビュー
                when "review"
                
                #国有財産情報公開システム
                when "property"

                    #CSVファイルの正規化
                    load "#{$WORKPATH}/lib/opendata/update/noAPI/convert.rb"

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
                else
            end

            #データベースの接続を閉じる
            db.close
        end

        #ログ収集
        require "date"
        File.open("#{$WORKPATH}/lib/opendata/update/noAPI/log/log.txt", "a") do |f|
            f.puts("Date: #{Date.today}, ProccessingTime: #{result.floor}秒")
        end
    end
end