/*テーブル作成*/

CREATE TABLE marketValueLoanProperty (
	name varchar(50),
	divison varchar(50),
	divisonDetail varchar(50),
	accounting varchar(50),
	category varchar(50),
	facilityName varchar(100),
	location varchar(250),
	loanPartner varchar(100),
	totalPriceByAccount bigint,
	landTotalAmount bigint,
	landTotalPrice bigint,
	buildingTotalAmount_amount DOUBLE,
	buildingTotalAmount_area DOUBLE,
	buildingTotalPrice bigint,
	treeAndBambooPrice bigint,
	loanPrice bigint,
	cityPlanningArea varchar(50),
	areaUsage varchar(100),
	buildingCoverageRatio varchar(50),
	floorAreaRate varchar(50)
	)
;