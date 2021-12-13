
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Bowler_Scores (

	MatchID int NOT NULL DEFAULT 0 ,

	GameNumber smallint NOT NULL DEFAULT 0 ,

	BowlerID int NOT NULL DEFAULT 0 ,

	RawScore smallint NULL DEFAULT 0 ,

	HandiCapScore smallint NULL DEFAULT 0 ,

	WonGame smallint NOT NULL DEFAULT 0
) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Bowlers (

	BowlerID int NOT NULL DEFAULT 0 ,

	BowlerLastName varchar (50) NULL ,

	BowlerFirstName varchar (50) NULL ,

	BowlerMiddleInit varchar (1) NULL ,

	BowlerAddress varchar (50) NULL ,

	BowlerCity varchar (50) NULL ,

	BowlerState varchar (2) NULL ,

	BowlerZip varchar (10) NULL ,

	BowlerPhoneNumber varchar (14) NULL ,

	TeamID int NULL
) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Match_Games (

	MatchID int NOT NULL DEFAULT 0 ,

	GameNumber smallint NOT NULL DEFAULT 0 ,

	WinningTeamID int NULL DEFAULT 0
) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Teams (

	TeamID int NOT NULL DEFAULT 0 ,

	TeamName varchar (50) NOT NULL ,

	CaptainID int NULL
) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Tournaments (

	TourneyID int NOT NULL DEFAULT 0 ,

	TourneyDate date NULL ,

	TourneyLocation varchar (50) NULL
) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Tourney_Matches (

	MatchID int NOT NULL DEFAULT 0 ,

	TourneyID int NULL DEFAULT 0 ,

	Lanes varchar (5) NULL ,

	OddLaneTeamID int NULL DEFAULT 0 ,

	EvenLaneTeamID int NULL DEFAULT 0
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblBowlerRatings (
        BowlerRating varchar (15) NOT NULL ,
        BowlerLowAvg smallint NULL ,
        BowlerHighAvg smallint NULL ) ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblSkipLabels (
        LabelCount int NOT NULL ) ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblWeeks (
        WeekStart date NOT NULL ,
        WeekEnd date NULL ) ;


ALTER TABLE Bowler_Scores ADD

	CONSTRAINT Bowler_Scores_PK PRIMARY KEY

	(

		MatchID,

		GameNumber,

		BowlerID

	) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX BowlerID ON Bowler_Scores(BowlerID) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX MatchGamesBowlerScores ON Bowler_Scores(MatchID, GameNumber) ;



ALTER TABLE Bowlers ADD

	CONSTRAINT Bowlers_PK PRIMARY KEY

	(

		BowlerID

	) ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX BowlerLastName ON Bowlers(BowlerLastName) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX BowlersTeamID ON Bowlers(TeamID) ;



ALTER TABLE Match_Games ADD

	CONSTRAINT Match_Games_PK PRIMARY KEY

	(

		MatchID,

		GameNumber

	) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX Team1ID ON Match_Games(WinningTeamID) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX TourneyMatchesMatchGames ON Match_Games(MatchID) ;



ALTER TABLE Teams ADD
	CONSTRAINT Teams_PK PRIMARY KEY

	(

		TeamID

	) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  UNIQUE  INDEX TeamID ON Teams(TeamID) ;



ALTER TABLE Tournaments ADD

	CONSTRAINT Tournaments_PK PRIMARY KEY

	(

		TourneyID

	) ;



ALTER TABLE Tourney_Matches ADD

	CONSTRAINT Tourney_Matches_PK PRIMARY KEY

	(

		MatchID

	) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX Tourney_MatchesEven ON Tourney_Matches(EvenLaneTeamID) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX TourneyMatchesOdd ON Tourney_Matches(OddLaneTeamID) ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX TourneyMatchesTourneyID ON Tourney_Matches(TourneyID) ;



ALTER TABLE ztblBowlerRatings ADD
        CONSTRAINT ztblBowlerRatings_PK PRIMARY KEY
        (
                BowlerRating
        ) ;

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

ALTER TABLE Bowler_Scores ADD

	CONSTRAINT Bowler_Scores_FK00 FOREIGN KEY

	(

		BowlerID

	) REFERENCES Bowlers (

		BowlerID

	),

	ADD CONSTRAINT Bowler_Scores_FK01 FOREIGN KEY

	(

		MatchID,

		GameNumber

	) REFERENCES Match_Games (

		MatchID,

		GameNumber

	);



ALTER TABLE Bowlers ADD

	CONSTRAINT Bowlers_FK00 FOREIGN KEY

	(

		TeamID

	) REFERENCES Teams (

		TeamID

	);



ALTER TABLE Match_Games ADD

	CONSTRAINT Match_Games_FK00 FOREIGN KEY

	(

		MatchID

	) REFERENCES Tourney_Matches (

		MatchID

	);



ALTER TABLE Tourney_Matches ADD

	CONSTRAINT Tourney_Matches_FK00 FOREIGN KEY

	(

		EvenLaneTeamID

	) REFERENCES Teams (

		TeamID

	),

	ADD CONSTRAINT Tourney_Matches_FK01 FOREIGN KEY

	(

		OddLaneTeamID

	) REFERENCES Teams (

		TeamID

	),

	ADD CONSTRAINT Tourney_Matches_FK02 FOREIGN KEY

	(

		TourneyID

	) REFERENCES Tournaments (

		TourneyID

	);

