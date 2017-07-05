#データカタログサイトのファイル名の変換
begin
    File.rename('dataCatalogue.csv', 'データカタログサイト.csv')
rescue
end

#IT DASHBOARDのファイル名の変換
begin
    File.rename('investmentPlan.csv', '政府情報システム投資計画.csv')
rescue
end

begin
    File.rename('investmentByExpense.csv', '政府情報システム投資計画（投資内訳）.csv')
rescue
end

begin
    File.rename('businessInformation.csv', '事業情報.csv')
rescue
end

begin
    File.rename('businessSpending.csv', '事業支出.csv')
rescue
end

begin
    File.rename('businessBudget.csv', '事業予算.csv')
rescue
end

#国有財産情報公開システムのファイル名の変換
begin
    File.rename('administrativeProperty.csv', '行政財産.csv')
rescue
end

begin
    File.rename('ordinaryProperty.csv', '各省各庁普通財産.csv')
rescue
end

begin
    File.rename('investProperty.csv', '政府出資.csv')
rescue
end

begin
    File.rename('offerToUSmilitaryProperty.csv', '米軍へ提供中の財産.csv')
rescue
end

begin
    File.rename('MOFofferToOtherProperty.csv', '財務省が他省庁に使用させている財産.csv')
rescue
end

begin
    File.rename('marketValueLoanProperty.csv', '時価貸付財産.csv')
rescue
end

begin
    File.rename('reducedLoanProperty.csv', '減額貸付財産.csv')
rescue
end

begin
    File.rename('freeLendingProperty.csv', '無償貸付財産.csv')
rescue
end

begin
    File.rename('unusedProperty.csv', '未利用国有地.csv')
rescue
end

begin
    File.rename('specialAccountProperty.csv', '特別会計所属普通財産.csv')
rescue
end

begin
    File.rename('othersProperty.csv', 'その他（山林原野等）.csv')
rescue
end