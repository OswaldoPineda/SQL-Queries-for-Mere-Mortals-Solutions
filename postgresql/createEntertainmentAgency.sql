-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Agents (
        AgentID int NOT NULL ,
        AgtFirstName varchar (25) NULL ,
        AgtLastName varchar (25) NULL ,
        AgtStreetAddress varchar (50) NULL ,
        AgtCity varchar (30) NULL ,
        AgtState varchar (2) NULL ,
        AgtZipCode varchar (10) NULL ,
        AgtPhoneNumber varchar (15) NULL ,
        DateHired date NULL ,
        Salary decimal(15, 2) NULL DEFAULT 0 ,
        CommissionRate double precision NULL DEFAULT 0
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
        CustPhoneNumber varchar (15) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Engagements (
        EngagementNumber int NOT NULL DEFAULT 0 ,
        StartDate date NULL ,
        EndDate date NULL ,
        StartTime time(0) NULL ,
        StopTime time(0) NULL ,
        ContractPrice decimal(15,2) NULL DEFAULT 0 ,
        CustomerID int NULL DEFAULT 0 ,
        AgentID int NULL DEFAULT 0 ,
        EntertainerID int NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Entertainer_Members (
        EntertainerID int NOT NULL ,
        MemberID int NOT NULL DEFAULT 0 ,
        Status smallint NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Entertainer_Styles (
        EntertainerID int NOT NULL ,
        StyleID smallint NOT NULL DEFAULT 0 ,
        StyleStrength smallint NOT NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Entertainers (
        EntertainerID int NOT NULL ,
        EntStageName varchar (50) NULL ,
        EntSSN varchar (12) NULL ,
        EntStreetAddress varchar (50) NULL ,
        EntCity varchar (30) NULL ,
        EntState varchar (2) NULL ,
        EntZipCode varchar (10) NULL ,
        EntPhoneNumber varchar (15) NULL ,
        EntWebPage varchar (50) NULL ,
        EntEMailAddress varchar (50) NULL ,
        DateEntered date NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Members (
        MemberID int NOT NULL DEFAULT 0 ,
        MbrFirstName varchar (25) NULL ,
        MbrLastName varchar (25) NULL ,
        MbrPhoneNumber varchar (15) NULL ,
        Gender varchar (2) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Musical_Preferences (
        CustomerID int NOT NULL DEFAULT 0 ,
        StyleID smallint NOT NULL DEFAULT 0 ,
        PreferenceSeq smallint NOT NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Musical_Styles (
        StyleID smallint NOT NULL DEFAULT 0 ,
        StyleName varchar (75) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblDays (
        DateField date NOT NULL
);


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblMonths (
        MonthYear varchar (15) NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NULL ,
        MonthEnd date NULL ,
        January smallint NULL DEFAULT 0 ,
        February smallint NULL DEFAULT 0 ,
        March smallint NULL DEFAULT 0 ,
        April smallint NULL DEFAULT 0 ,
        May smallint NULL DEFAULT 0 ,
        June smallint NULL DEFAULT 0 ,
        July smallint NULL DEFAULT 0 ,
        August smallint NULL DEFAULT 0 ,
        September smallint NULL DEFAULT 0 ,
        October smallint NULL DEFAULT 0 ,
        November smallint NULL DEFAULT 0 ,
        December smallint NULL DEFAULT 0
);


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblSkipLabels (
        LabelCount int NOT NULL
);


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblWeeks (
        WeekStart date NOT NULL ,
        WeekEnd date NULL
);


ALTER TABLE Agents
        ADD CONSTRAINT Agents_PK PRIMARY KEY
        (
                AgentID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX AgtZipCode ON Agents(AgtZipCode);

ALTER TABLE Customers
        ADD CONSTRAINT Customers_PK PRIMARY KEY
        (
                CustomerID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX CustZipCode ON Customers(CustZipCode);

ALTER TABLE Engagements
        ADD CONSTRAINT Engagements_PK PRIMARY KEY         (
                EngagementNumber
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX AgentsEngagements ON Engagements(AgentID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX CustomersEngagements ON Engagements(CustomerID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX EntertainersEngagements ON Engagements(EntertainerID);

ALTER TABLE Entertainer_Members
        ADD CONSTRAINT Entertainer_Members_PK PRIMARY KEY
        (
                EntertainerID,
                MemberID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX EntertainersEntertainerMembers ON Entertainer_Members(EntertainerID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX MembersEntertainerMembers ON Entertainer_Members(MemberID);

ALTER TABLE Entertainer_Styles
        ADD CONSTRAINT Entertainer_Styles_PK PRIMARY KEY
        (
                EntertainerID,
                StyleID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX EntertainersEntertainerStyles ON Entertainer_Styles(EntertainerID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX MusicalStylesEntStyles ON Entertainer_Styles(StyleID);

ALTER TABLE Entertainers
        ADD CONSTRAINT Entertainers_PK PRIMARY KEY
        (
                EntertainerID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  UNIQUE  INDEX EntertainerID ON Entertainers(EntertainerID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX EntZipCode ON Entertainers(EntZipCode);

ALTER TABLE Members
        ADD CONSTRAINT Members_PK PRIMARY KEY
        (
                MemberID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX MemberID ON Members(MemberID);

ALTER TABLE Musical_Preferences
        ADD CONSTRAINT Musical_Preferences_PK PRIMARY KEY
        (
                CustomerID,
                StyleID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX CustomersMusicalPreferences ON Musical_Preferences(CustomerID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StyleID ON Musical_Preferences(StyleID);

ALTER TABLE Musical_Styles
        ADD CONSTRAINT Musical_Styles_PK PRIMARY KEY
        (
                StyleID
        );

ALTER TABLE ztblDays ADD
        CONSTRAINT ztblDays_PK PRIMARY KEY
        (
                DateField
        );


ALTER TABLE ztblMonths ADD
        CONSTRAINT ztblMonths_PK PRIMARY KEY
        (
                YearNumber,
                MonthNumber
        );


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE UNIQUE INDEX ztblMontths_MonthEnd ON ztblMonths(MonthEnd) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE UNIQUE INDEX ztblMonths_MonthStart ON ztblMonths(MonthStart) ;


 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE UNIQUE INDEX ztblMonths_MonthYear ON ztblMonths(MonthYear) ;


ALTER TABLE ztblSkipLabels ADD
        CONSTRAINT ztblSkipLabels_PK PRIMARY KEY
        (
                LabelCount
        ) ;


ALTER TABLE ztblWeeks ADD
        CONSTRAINT ztblWeeks_PK PRIMARY KEY
        (
                WeekStart
        ) ;


ALTER TABLE Engagements
        ADD CONSTRAINT Engagements_FK00 FOREIGN KEY
        (
                AgentID
        ) REFERENCES Agents (
                AgentID
        ),
        ADD CONSTRAINT Engagements_FK01 FOREIGN KEY
        (
                CustomerID
        ) REFERENCES Customers (
                CustomerID
        ),
        ADD CONSTRAINT Engagements_FK02 FOREIGN KEY
        (
                EntertainerID
        ) REFERENCES Entertainers (
                EntertainerID
        );

ALTER TABLE Entertainer_Members
        ADD CONSTRAINT Entertainer_Members_FK00 FOREIGN KEY
        (
                EntertainerID
        ) REFERENCES Entertainers (
                EntertainerID
        ),
        ADD CONSTRAINT Entertainer_Members_FK01 FOREIGN KEY
        (
                MemberID
        ) REFERENCES Members (
                MemberID
        );

ALTER TABLE Entertainer_Styles
        ADD CONSTRAINT Entertainer_Styles_FK00 FOREIGN KEY
        (
                EntertainerID
        ) REFERENCES Entertainers (
                EntertainerID
        ),
        ADD CONSTRAINT Entertainer_Styles_FK01 FOREIGN KEY
        (
                StyleID
        ) REFERENCES Musical_Styles (
                StyleID
        );

ALTER TABLE Musical_Preferences
        ADD CONSTRAINT Musical_Preferences_FK00 FOREIGN KEY
        (
                CustomerID
        ) REFERENCES Customers (
                CustomerID
        ),
        ADD CONSTRAINT Musical_Preferences_FK01 FOREIGN KEY
        (
                StyleID
        ) REFERENCES Musical_Styles (
                StyleID
        );
