drop procedure if exists searching ;
delimiter //

create procedure searching(in var varchar(100))

begin

/*投資計画の検索*/
select
	*
from
	investmentPlan
where
	description like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/investmentPlan.csv"
FIELDS TERMINATED BY ','
;

/*投資計画の詳細検索*/
select
	investmentPlan.investment_id,
	investmentByExpense.organization,
	investmentByExpense.investment_name,
	investmentByExpense.expense_year,
	investmentByExpense.expense_item,
	investmentByExpense.expense_amount
from
	investmentPlan
left join
	investmentByExpense
on
	investmentPlan.investment_id = investmentByExpense.investment_id
where
	investmentPlan.description like concat('%', var, '%')
and
	investmentByExpense.expense_amount > 0

INTO OUTFILE
	"~/ap/lib/opendata/search/output/investmentByExpense.csv"
FIELDS TERMINATED BY ','
;

/*事業情報の検索*/
select
	*
from
	businessInformation
where
	summary like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/businessInformation.csv"
FIELDS TERMINATED BY ','
;

/*事業支出の検索*/
select
	businessInformation.business_id,
	businessSpending.business_overview,
	businessSpending.expenditure,
	businessSpending.spending_destination,
	businessSpending.spending_corp_no,
	businessSpending.number_of_bidders,
	businessSpending.successful_bid_rate
from
	businessInformation
left join
	businessSpending
on
	businessInformation.business_id = businessSpending.business_id
where
	businessInformation.summary like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/businessSpending.csv"
FIELDS TERMINATED BY ','
;

/*事業予算の検索*/
select
	businessInformation.business_id,
	businessBudget.year,
	businessBudget.initial_budget,
	businessBudget.supplementary_budget,
	businessBudget.carryover_budget_from,
	businessBudget.carryover_budget_to,
	businessBudget.reserve_fund,
	businessBudget.total,
	businessBudget.enforcement_budget
from
	businessInformation
left join
	businessBudget
on
	businessInformation.business_id = businessBudget.business_id
where
	businessInformation.summary like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/businessBudget.csv"
FIELDS TERMINATED BY ','
;

/*データカタログサイトの検索*/
select
	*
from
	dataCatalogue
where
	dataSet_description like concat('%', var, '%')
or
	resource_description like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/dataCatalogue.csv"
FIELDS TERMINATED BY ','
;

/*行政財産の検索*/
select
	*
from
	administrativeProperty
where
	administrativeProperty.divison like concat('%', var, '%')
or
	administrativeProperty.homeDisplay like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/administrativeProperty.csv"
FIELDS TERMINATED BY ','

;

/*各省各庁所管普通財産の検索*/
select
	*
from
	ordinaryProperty
where
	ordinaryProperty.divison like concat('%', var, '%')
or
	ordinaryProperty.location like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/ordinaryProperty.csv"
FIELDS TERMINATED BY ','
;

/*米軍へ提供中の財産の検索*/
select
	*
from
	offerToUSmilitaryProperty
where
	offerToUSmilitaryProperty.divison like concat('%', var, '%')
or
	offerToUSmilitaryProperty.divisonDetail like concat('%', var, '%')
							  
or
	offerToUSmilitaryProperty.facilityName like concat('%', var, '%')
or
	offerToUSmilitaryProperty.location like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/offerToUSmilitaryProperty.csv"
FIELDS TERMINATED BY ','
;

/*他省庁に使用させている財産の検索*/
select
	*
from
	MOFofferToOtherProperty
where
	MOFofferToOtherProperty.divison like concat('%', var, '%')
or
	MOFofferToOtherProperty.divisonDetail like concat('%', var, '%')
or
	MOFofferToOtherProperty.facilityName like concat('%', var, '%')
or
	MOFofferToOtherProperty.location like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/MOFofferToOtherProperty.csv"
FIELDS TERMINATED BY ','
;

/*時価貸付財産の検索*/
select
	*
from
	marketValueLoanProperty	
where
	marketValueLoanProperty.divison like concat('%', var, '%')
or
	marketValueLoanProperty.divisonDetail like concat('%', var, '%')
or
	marketValueLoanProperty.facilityName like concat('%', var, '%')
or
	marketValueLoanProperty.location like concat('%', var, '%')
or
	marketValueLoanProperty.loanPartner like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/marketValueLoanProperty.csv"
FIELDS TERMINATED BY ','
;

/*無償貸付財産の検索*/
select
	*
from
	freeLendingProperty
where
	freeLendingProperty.divison like concat('%', var, '%')
or
	freeLendingProperty.divisonDetail like concat('%', var, '%')
or
	freeLendingProperty.facilityName like concat('%', var, '%')
or
	freeLendingProperty.location like concat('%', var, '%')
or
	freeLendingProperty.loanPartner like concat('%', var, '%')	

INTO OUTFILE
	"~/ap/lib/opendata/search/output/freeLendingProperty.csv"
FIELDS TERMINATED BY ','
;

/*未利用国有地の検索*/
select
	*
from
	unusedProperty	
where
	unusedProperty.divison like concat('%', var, '%')
or
	unusedProperty.divisonDetail like concat('%', var, '%')
or
	unusedProperty.location like concat('%', var, '%')
or
	unusedProperty.correspondence like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/unusedProperty.csv"
FIELDS TERMINATED BY ','
;

/*特別会計所属普通財産の検索*/
select
	*
from
	specialAccountProperty
where
	specialAccountProperty.divison like concat('%', var, '%')
or
	specialAccountProperty.divisonDetail like concat('%', var, '%')
or
	specialAccountProperty.facilityName like concat('%', var, '%')
or
	specialAccountProperty.location like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/specialAccountProperty.csv"
FIELDS TERMINATED BY ','
;

/*その他（山林原野等）の検索*/
select
	*
from
	othersProperty
where
	othersProperty.divison like concat('%', var, '%')
or
	othersProperty.divisonDetail like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/othersProperty.csv"
FIELDS TERMINATED BY ','
;

/*政府出資の検索*/
select
	*
from
	investProperty	
where
	investProperty.divison like concat('%', var, '%')
or
	investProperty.investmentObject like concat('%', var, '%')
or
	investProperty.location like concat('%', var, '%')

INTO OUTFILE
	"~/ap/lib/opendata/search/output/investProperty.csv"
FIELDS TERMINATED BY ','
;

end
//

delimiter ;