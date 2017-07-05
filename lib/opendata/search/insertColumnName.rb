#データカタログサイトの属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/dataCatalogue.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("データセット_件名,データセット_公表組織名,データセット_連絡先,データセット_作成者,データセット_説明,データセット_作成頻度,リソース_リソース名,リソース_データ型,リソース_説明,リソース_URL\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#政府情報システム投資計画の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/investmentPlan.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("投資事項ID,年（西暦）,組織名,投資事項番号,投資事項名,投資内容,新規／継続,政策概要,業務・機能概要,投資開始年度,投資終了年度,本年度投資額,総投資額\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#政府情報システム投資計画（投資内訳）の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/investmentByExpense.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("投資事項ID,組織名,投資事項名,投資内訳_年（西暦）,投資内訳_費目,投資内訳_投資額\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#事業情報の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/businessInformation.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("事業ID,年（西暦）,組織名,事業番号,事業名,事業開始・終了(予定）年度,担当部局庁名,担当課室名,会計区分,政策・施策名,根拠法令,関係する計画、通知等,主要施策,事業の目的,事業概要,実施方法,行政事業URL\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#事業支出の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/businessSpending.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("事業ID,支出概要,支出額,支出先名,支出先法人番号,入札数,落札率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#事業予算の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/businessBudget.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("事業ID,年（西暦）,当初予算,補正予算,前年度から繰越し,翌年度へ繰越し,予備費等,予算計,執行額\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#行政財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/administrativeProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,会計名,分類種類名,部局名,口座名,登記上の表示,住居表示,口座別合計価格（円）,土地用途,土地合計数量,土地合計価格（円）,土地取得年月日,土地取得事由,都市計画区域,用途地域,建ぺい率,容積率,法定容積率に対する利用率,建物用途,棟数,建物合計数量（建）,建物合計数量（延）,建物合計価格（円）,宿舎戸数,主要建物用途,構造,階数,主要建物数量（建）,主要建物数量（延）,主要建物価格（円）,主要建物取得年月日,主要建物取得事由,立木竹価格（円）,工作物価格（円）,船舶数量,船舶価格（円）,航空機数量,航空機価格（円）,地上権等数量,地上権等価格（円）,特許権等数量,特許権等価格（円）\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#各省各庁普通財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/ordinaryProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,会計名,分類種類名,口座名,所在地,口座別合計価格（円）,土地合計数量,土地合計価格（円）,建物合計数量（建）,建物合計数量（延）,建物合計価格（円）,立木竹価格（円）,工作物価格（円）,船舶数量,船舶価格（円）,航空機数量,航空機価格（円）,地上権等数量,地上権等価格（円）,特許権等数量,特許権等価格（円）,政府出資等価格（円）,不動産の信託の受益権価格（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#政府出資の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/investProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局所名,会計名,分類種類名,法人名,所在地,勘定名１,政府出資現在額１（円）,勘定名２,政府出資現在額２（円）,勘定名３,政府出資現在額３（円）,勘定名４,政府出資現在額４（円）,勘定名５,政府出資現在額５（円）,勘定名６,政府出資現在額６（円）,合計額（円）,注釈\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#米軍へ提供中の財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/offerToUSmilitaryProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,用途施設名称,所在地,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,立木竹価格（円）,工作物価格（円）,機械器具価格（円）,船舶数量,船舶価格（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#財務省が他省庁に使用させている財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/MOFofferToOtherProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,用途施設名称,所在地,貸付相手方,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,立木竹価格（円）,工作物価格（円）,機械器具価格（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#時価貸付財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/marketValueLoanProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,用途施設名称,所在地,貸付相手方,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,工作物価格（円）,貸付料（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#減額貸付財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/reducedLoanProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,根拠法令,用途施設名称,所在地,貸付相手方,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,工作物価格（円）,貸付料（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#無償貸付財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/freeLendingProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,根拠法令,用途施設名称,所在地,貸付相手方,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,立木竹価格（円）,工作物価格（円）,機械器具価格（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#未利用国有地の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/unusedProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類,所在地,口座別合計価格（円）,土地数量,土地価格（円）,都市計画区域,用途地域,建ぺい率,容積率,処理方法\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#特別会計所属普通財産の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/specialAccountProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,部局所名,会計名,分類種類名,用途施設名称,所在地,口座別合計価格（円）,土地数量,土地価格（円）,建物数量（建）,建物数量（延）,建物価格（円）,立木竹価格（円）,工作物価格（円）,不動産の信託受益権価格（円）,地上権等数量,地上権等価格（円）,都市計画区域,用途地域,建ぺい率,容積率\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end

#その他（山林原野等）の属性名を追加
begin
  File.open("#{$WORKPATH}/lib/opendata/search/output/othersProperty.csv", "r+"){|f|
    lines = f.readlines
    lines.unshift("省庁名,部局名,局部所名,会計名,分類種類名,合計価格（円）,土地数量計,土地価格計（円）,建物数量（建）,建物数量（延）,建物価格計（円）,立木竹価格計（円）,工作物価格計（円）,政府出資等価格計（円）,不動産信託受益権価格計（円）,機械器具価格計（円）,地上権等数量計,地上権等価格計（円）\n")
    f.rewind
    lines.each do |line|
      f.write line
    end
  }  
rescue
end