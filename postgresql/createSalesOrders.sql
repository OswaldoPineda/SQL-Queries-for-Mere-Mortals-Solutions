
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Categories (
	CategoryID int NOT NULL DEFAULT 0 ,
	CategoryDescription varchar (75) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Customers (
	CustomerID int NOT NULL ,
	CustFirstName varchar (25) NULL ,
	CustLastName varchar (25) NULL ,
	CustStreetAddress varchar (50) NULL ,
	CustCity varchar (30) NULL ,
	CustState varchar (2) NULL ,
	CustZipCode varchar (10) NULL ,
	CustAreaCode smallint NULL DEFAULT 0 ,
	CustPhoneNumber varchar (8) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Employees (
	EmployeeID int NOT NULL ,
	EmpFirstName varchar (25) NULL ,
	EmpLastName varchar (25) NULL ,
	EmpStreetAddress varchar (50) NULL ,
	EmpCity varchar (30) NULL ,
	EmpState varchar (2) NULL ,
	EmpZipCode varchar (10) NULL ,
	EmpAreaCode smallint NULL DEFAULT 0 ,
	EmpPhoneNumber varchar (8) NULL ,
        EmpBirthDate date NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Order_Details (
	OrderNumber int NOT NULL DEFAULT 0 ,
	ProductNumber int NOT NULL DEFAULT 0 ,
	QuotedPrice decimal (15, 2) NULL DEFAULT 0 ,
	QuantityOrdered smallint NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Orders (
	OrderNumber int NOT NULL DEFAULT 0 ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL DEFAULT 0,
	EmployeeID int NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Product_Vendors (
	ProductNumber int NOT NULL DEFAULT 0 ,
	VendorID int NOT NULL DEFAULT 0 ,
	WholesalePrice decimal (15, 2) NULL DEFAULT 0 ,
	DaysToDeliver smallint NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Products (
	ProductNumber int NOT NULL DEFAULT 0,
	ProductName varchar (50) NULL ,
	ProductDescription varchar (100) NULL ,
	RetailPrice decimal (15, 2) NULL DEFAULT 0 ,
	QuantityOnHand smallint NULL DEFAULT 0 ,
	CategoryID int NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Vendors (
	VendorID int NOT NULL ,
	VendName varchar (25) NULL ,
	VendStreetAddress varchar (50) NULL ,
	VendCity varchar (30) NULL ,
	VendState varchar (2) NULL ,
	VendZipCode varchar (10) NULL ,
	VendPhoneNumber varchar (15) NULL ,
	VendFaxNumber varchar (15) NULL ,
	VendWebPage text NULL ,
	VendEMailAddress varchar (50) NULL
) ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblMonths (
	MonthYear varchar (15) NOT NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NOT NULL ,
        MonthEnd date NOT NULL ,
        January smallint NOT NULL DEFAULT 0 ,
        February smallint NOT NULL DEFAULT 0 ,
        March smallint NOT NULL DEFAULT 0 ,
        April smallint NOT NULL DEFAULT 0 ,
        May smallint NOT NULL DEFAULT 0 ,
        June smallint NOT NULL DEFAULT 0 ,
        July smallint NOT NULL DEFAULT 0 ,
        August smallint NOT NULL DEFAULT 0 ,
        September smallint NOT NULL DEFAULT 0 ,
        October smallint NOT NULL DEFAULT 0 ,
        November smallint NOT NULL DEFAULT 0 ,
        December smallint NOT NULL DEFAULT 0
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblPriceRanges (
        PriceCategory varchar (20) NOT NULL ,
        LowPrice decimal (15,2) NULL ,
        HighPrice decimal (15,2) NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblPurchaseCoupons (
        LowSpend decimal (15,2) NOT NULL ,
        HighSpend decimal (15,2) NULL ,
        NumCoupons smallint NULL DEFAULT 0
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblSeqNumbers (
        Sequence int NOT NULL DEFAULT 0
) ;


ALTER TABLE Categories ADD
	CONSTRAINT Categories_PK PRIMARY KEY
	(
		CategoryID
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX CategoryID ON Categories(CategoryID);

ALTER TABLE Customers ADD
	CONSTRAINT Customers_PK PRIMARY KEY
	(
		CustomerID
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX CustAreaCode ON Customers(CustAreaCode);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX CustZipCode ON Customers(CustZipCode);

ALTER TABLE Employees ADD
	CONSTRAINT Employees_PK PRIMARY KEY
	(
		EmployeeID
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX EmpAreaCode ON Employees(EmpAreaCode);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX EmpZipCode ON Employees(EmpZipCode);

ALTER TABLE Order_Details ADD
	CONSTRAINT Order_Details_PK PRIMARY KEY
	(
		OrderNumber,
		ProductNumber
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX OrdersOrderDetails ON Order_Details(OrderNumber);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX ProductsOrderDetails ON Order_Details(ProductNumber);

ALTER TABLE Orders ADD
	CONSTRAINT Orders_PK PRIMARY KEY
	(
		OrderNumber
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX CustomerID ON Orders(CustomerID);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX EmployeeID ON Orders(EmployeeID);

ALTER TABLE Product_Vendors ADD
	CONSTRAINT Product_Vendors_PK PRIMARY KEY
	(
		ProductNumber,
		VendorID
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX ProductsProductVendors ON Product_Vendors(ProductNumber);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX VendorID ON Product_Vendors(VendorID);

ALTER TABLE Products ADD
	CONSTRAINT roducts_PK PRIMARY KEY
	(
		ProductNumber
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX CategoriesProducts ON Products(CategoryID);

ALTER TABLE Vendors ADD
	CONSTRAINT Vendors_PK PRIMARY KEY
	(
		VendorID
	)  ;

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX VendZipCode ON Vendors(VendZipCode);

ALTER TABLE ztblMonths ADD
 	CONSTRAINT ztblMonths_PK PRIMARY KEY
	(
		YearNumber,
                MonthNumber
	) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  UNIQUE INDEX Month_End ON ztblMonths(MonthEnd) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  UNIQUE INDEX Month_Start ON ztblMonths(MonthStart) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  UNIQUE INDEX Month_Year ON ztblMonths(MonthYear) ;


ALTER TABLE ztblPriceRanges ADD
	CONSTRAINT ztblPriceRanges_PK PRIMARY KEY
	(
		PriceCategory
	) ;


ALTER TABLE ztblPurchaseCoupons ADD
	CONSTRAINT ztblPurchaseCoupons_PK PRIMARY KEY
	(
		LowSpend
	) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX Num_Coupons ON ztblPurchaseCoupons(NumCoupons) ;


ALTER TABLE ztblSeqNumbers ADD
        CONSTRAINT ztblSeqNumbers_PK PRIMARY KEY
        (
                Sequence
        ) ;


ALTER TABLE Order_Details ADD
	CONSTRAINT Order_Details_FK00 FOREIGN KEY
	(
		OrderNumber
	) REFERENCES Orders (
		OrderNumber
	),
	ADD CONSTRAINT Order_Details_FK01 FOREIGN KEY
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	);

ALTER TABLE Orders ADD
	CONSTRAINT Orders_FK00 FOREIGN KEY
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	ADD CONSTRAINT Orders_FK01 FOREIGN KEY
	(
		EmployeeID
	) REFERENCES Employees (
		EmployeeID
	);

ALTER TABLE Product_Vendors ADD
	CONSTRAINT Product_Vendors_FK00 FOREIGN KEY
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	),
	ADD CONSTRAINT Product_Vendors_FK01 FOREIGN KEY
	(
		VendorID
	) REFERENCES Vendors (
		VendorID
	);

ALTER TABLE Products ADD
	CONSTRAINT Products_FK00 FOREIGN KEY
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	);


