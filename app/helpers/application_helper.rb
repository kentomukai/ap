module ApplicationHelper
    def full_title(page_title = '')
        base_title = 'Ruby on Rails Tutorial Sample App'
        if page_title.empty?
            base_title
        else
            page_title + ' | ' + base_title
        end
    end
    
    class << self
        def output_init
            require 'FileUtils'
            FileUtils.rm_rf("#{$WORKPATH}/lib/opendata/search/output")
            FileUtils.mkdir("#{$WORKPATH}/lib/opendata/search/output")
        end

        def arrange_data(query)
            #検索結果をカレントディレクトリにする
            Dir.chdir("#{$WORKPATH}/lib/opendata/search/output")

            #空のCSVファイルを削除
            nameArray = Dir.glob("*.csv")
            nameArray.each do |fileName|
                File.delete("#{$WORKPATH}/lib/opendata/search/output/#{fileName}") if ! File.size? ("#{$WORKPATH}/lib/opendata/search/output/#{fileName}")
            end
            
            #検索結果に属性名を追加する
            load "#{$WORKPATH}/lib/opendata/search/insertColumnName.rb"

            #検索結果のファイル名を日本語にする
            load "#{$WORKPATH}/lib/opendata/search/fileNameConvert.rb"
        end
    end
end
