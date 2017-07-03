#正規化処理の初期化
require 'FileUtils'
FileUtils.rm_rf("#{$WORKPATH}/lib/opendata/update/noAPI/convertedFile")
FileUtils.mkdir("#{$WORKPATH}/lib/opendata/update/noAPI/convertedFile")

#CSVファイルの正規化処理
require 'csv'
Dir.chdir("#{$WORKPATH}/lib/opendata/update/noAPI/sourceFile")
fileNameArray = Dir.glob("*.csv")
fileNameArray.each do |fileName|
    CSV.foreach("#{$WORKPATH}/lib/opendata/update/noAPI/sourceFile/#{fileName}") do |array|
        array.each_with_index do |element,index|
            File.open("#{$WORKPATH}/lib/opendata/update/noAPI/convertedFile/#{fileName}", "a") do |converted|
                if index == (array.size - 1)
                    if element.nil?
                        converted.puts "-"
                    else
                        converted.puts "#{element.gsub(/,|"/,"")}"
                    end
                else
                    if element.nil?
                        converted.print "-,"
                    else
                        converted.print "#{element.gsub(/,|"/,"")},"
                    end
                end
            end
        end
    end
end