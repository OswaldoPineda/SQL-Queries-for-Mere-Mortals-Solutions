-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Buildings (
	BuildingCode varchar (3) NOT NULL ,
	BuildingName varchar (25) NULL ,
	NumberOfFloors smallint NULL ,
	ElevatorAccess boolean NOT NULL DEFAULT false ,
	SiteParkingAvailable boolean NOT NULL DEFAULT false
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Categories (
	CategoryID varchar (10) NOT NULL ,
	CategoryDescription varchar (75) NULL ,
	DepartmentID int NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Class_Rooms (
	ClassRoomID int NOT NULL ,
	BuildingCode varchar (3) NULL ,
	PhoneAvailable boolean NOT NULL DEFAULT false ,
        Capacity smallint NOT NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Classes (
	ClassID int NOT NULL ,
	SubjectID int NULL DEFAULT 0 ,
	ClassRoomID int NULL DEFAULT 0 ,
	Credits smallint NULL DEFAULT 0 ,
        SemesterNumber smallint ,
        StartDate date NULL ,
	StartTime time(0) NULL ,
	Duration smallint NULL DEFAULT 0 ,
	MondaySchedule smallint NOT NULL DEFAULT 0 ,
	TuesdaySchedule smallint NOT NULL DEFAULT 0 ,
	WednesdaySchedule smallint NOT NULL DEFAULT 0 ,
	ThursdaySchedule smallint NOT NULL DEFAULT 0 ,
	FridaySchedule smallint NOT NULL DEFAULT 0 ,
	SaturdaySchedule smallint NOT NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Departments (
	DepartmentID int NOT NULL ,
	DeptName varchar (50) NULL ,
	DeptChair int NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Faculty (
	StaffID int NOT NULL ,
	Title varchar (50) NULL ,
	Status varchar (12) NULL ,
	Tenured boolean NOT NULL DEFAULT false
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Faculty_Categories (
	StaffID int NOT NULL ,
	CategoryID varchar (10) NOT NULL DEFAULT 'ACC'
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Faculty_Classes (
	ClassID int NOT NULL ,
	StaffID int NOT NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Faculty_Subjects (
	StaffID int NOT NULL DEFAULT 0 ,
	SubjectID int NOT NULL DEFAULT 0 ,
	ProficiencyRating real NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Majors (
        MajorID int NOT NULL ,
        Major varchar (20) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Staff (
	StaffID int NOT NULL ,
	StfFirstName varchar (25) NULL ,
	StfLastname varchar (25) NULL ,
	StfStreetAddress varchar (50) NULL ,
	StfCity varchar (30) NULL ,
	StfState varchar (2) NULL ,
	StfZipCode varchar (5) NULL ,
	StfAreaCode varchar (5) NULL ,
	StfPhoneNumber varchar (8) NULL ,
	Salary decimal(15,2) NULL ,
	DateHired date NULL ,
	Position varchar (50) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Student_Class_Status (
	ClassStatus int NOT NULL DEFAULT 0 ,
	ClassStatusDescription varchar (50) NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Student_Schedules (
	StudentID int NOT NULL ,
	ClassID int NOT NULL ,
	ClassStatus int NULL DEFAULT 0 ,
	Grade real NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Students (
	StudentID int NOT NULL ,
	StudFirstName varchar (25) NULL ,
	StudLastName varchar (25) NULL ,
	StudStreetAddress varchar (50) NULL ,
	StudCity varchar (30) NULL ,
	StudState varchar (2) NULL ,
	StudZipCode varchar (5) NULL ,
	StudAreaCode varchar (5) NULL ,
	StudPhoneNumber varchar (8) NULL ,
	StudBirthDate date NULL ,
	StudGender varchar (1) NULL,
	StudMaritalStatus varchar (1) NULL,
        StudMajor int NULL
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Subjects (
	SubjectID int NOT NULL DEFAULT 0 ,
	CategoryID varchar (10) NULL ,
	SubjectCode varchar (8) NULL ,
	SubjectName varchar (50) NULL ,
        SubjectPreReq varchar (8) NULL DEFAULT NULL ,
	SubjectDescription text NULL ,
        SubjectEstClassSize smallint NOT NULL DEFAULT 0
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblGenderMatrix (
	Gender varchar (1) NOT NULL ,
        Male smallint NULL ,
        Female smallint NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblLetterGrades (
	LetterGrade varchar (3) NOT NULL ,
        LowGradePoint real NULL ,
        HighGradePoint real NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblMaritalStatusMatrix (
	MaritalStatus varchar (1) NOT NULL ,
	Married smallint NULL ,
        Single smallint NULL ,
        Widowed smallint NULL ,
        Divorced smallint NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblProfRatings (
        ProfRatingDesc varchar (12) NULL ,
        ProfRatingLow double precision  NOT NULL ,
        ProfRatingHigh double precision  NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblSemesterDays (
        SemesterNo smallint NOT NULL ,
        SemDate date NOT NULL ,
        SemDayName varchar (10) NULL
) ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ztblSequenceNos (
        SequenceNo int NOT NULL DEFAULT 0
) ;


ALTER TABLE Buildings
        ADD CONSTRAINT Buildings_PK PRIMARY KEY
        (
                BuildingCode
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX NumberOfFloors ON Buildings(NumberOfFloors);

ALTER TABLE Categories
        ADD CONSTRAINT Categories2_PK PRIMARY KEY
        (
                CategoryID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX DepartmentID ON Categories(DepartmentID);

ALTER TABLE Class_Rooms
        ADD CONSTRAINT Class_Rooms_PK PRIMARY KEY
        (
                ClassRoomID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX BuildingNumber ON Class_Rooms(BuildingCode);

ALTER TABLE Classes
        ADD CONSTRAINT Classes_PK PRIMARY KEY
        (
                ClassID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX SubjectID ON Classes(SubjectID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX ClassRoomID ON Classes(ClassRoomID);

ALTER TABLE Departments
	ADD CONSTRAINT Departments_PK PRIMARY KEY
	(
		DepartmentID
	);

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 CREATE  INDEX StaffDepartments ON Departments(DeptChair);

ALTER TABLE Faculty
        ADD CONSTRAINT Faculty_PK PRIMARY KEY
        (
                StaffID
        );

ALTER TABLE Faculty_Categories
        ADD CONSTRAINT Faculty_Categories_PK PRIMARY KEY
        (
                StaffID,
                CategoryID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX CategoriesFaculty_Categories ON Faculty_Categories(CategoryID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX FacultyFaculty_Categories ON Faculty_Categories(StaffID);

ALTER TABLE Faculty_Classes
        ADD CONSTRAINT Faculty_Classes_PK PRIMARY KEY
        (
                ClassID,
                StaffID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX ClassesFacultyClasses ON Faculty_Classes(ClassID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StaffFacultyClasses ON Faculty_Classes(StaffID);

ALTER TABLE Faculty_Subjects
        ADD CONSTRAINT Faculty_Subjects_PK PRIMARY KEY
        (
                StaffID,
                SubjectID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX FacultyFacultySubjects ON Faculty_Subjects(StaffID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX SubjectsFacultySubjects ON Faculty_Subjects(SubjectID);

ALTER TABLE Majors
        ADD CONSTRAINT Majors_PK PRIMARY KEY
        (
               MajorID
        );

ALTER TABLE Staff
        ADD CONSTRAINT Staff_PK PRIMARY KEY
        (
                StaffID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StaffZipCode ON Staff(StfZipCode);


ALTER TABLE Student_Class_Status
        ADD CONSTRAINT Student_Class_Status_PK PRIMARY KEY
        (
                ClassStatus
        );

ALTER TABLE Student_Schedules
        ADD CONSTRAINT Student_Schedules_PK PRIMARY KEY
        (
                StudentID,
                ClassID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX ClassesStudent_Schedules ON Student_Schedules(ClassID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX Student_Class_StatusStudent_Schedules ON Student_Schedules(ClassStatus);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StudentsStudent_Schedules ON Student_Schedules(StudentID);

ALTER TABLE Students
        ADD CONSTRAINT Students_PK PRIMARY KEY
        (
                StudentID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StudAreaCode ON Students(StudAreaCode);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StudZipCode ON Students(StudZipCode);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX StudMajor ON Students(StudMajor);

ALTER TABLE Subjects
        ADD CONSTRAINT Subjects_PK PRIMARY KEY
        (
                SubjectID
        );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX CategoryID ON Subjects(CategoryID);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  UNIQUE  INDEX SubjectCode ON Subjects(SubjectCode);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE  INDEX SubjectPreReq ON Subjects(SubjectPreReq);

ALTER TABLE ztblGenderMatrix ADD
        CONSTRAINT ztblGenderMatrix_PK PRIMARY KEY
        (
               Gender
        );


ALTER TABLE ztblLetterGrades ADD
        CONSTRAINT ztblLetterGrades_PK PRIMARY KEY
        (
                LetterGrade
        );


ALTER TABLE ztblMaritalStatusMatrix ADD
        CONSTRAINT ztblMaritalStatusMatrix_PK PRIMARY KEY
        (
                MaritalStatus
        );


ALTER TABLE ztblProfRatings ADD
	CONSTRAINT ztblProfRatings_PK PRIMARY KEY
	(
		ProfRatingLow
	);


ALTER TABLE ztblSemesterDays ADD
	CONSTRAINT ztblSemesterDays_PK PRIMARY KEY
	(
		SemesterNo ,
                SemDate
	);


ALTER TABLE ztblSequenceNos ADD
	CONSTRAINT ztblSequenceNos_PK PRIMARY KEY
	(
		SequenceNo
	);


ALTER TABLE Categories ADD
	CONSTRAINT Categories_FK00 FOREIGN KEY
	(
		DepartmentID
	) REFERENCES Departments (
		DepartmentID
	);

ALTER TABLE Class_Rooms
        ADD CONSTRAINT Class_Rooms_FK00 FOREIGN KEY
        (
                BuildingCode
        ) REFERENCES Buildings (
                BuildingCode
        );

ALTER TABLE Classes
        ADD CONSTRAINT Classes_FK00 FOREIGN KEY
        (
                ClassRoomID
        ) REFERENCES Class_Rooms (
                ClassRoomID
        ),
        ADD CONSTRAINT Classes_FK01 FOREIGN KEY
        (
                SubjectID
        ) REFERENCES Subjects (
                SubjectID
        );

ALTER TABLE Departments ADD
	CONSTRAINT Departments_FK00 FOREIGN KEY
	(
		DeptChair
	) REFERENCES Staff (
		StaffID
	);

ALTER TABLE Faculty
	ADD CONSTRAINT Faculty_FK00 FOREIGN KEY
	(
		StaffID
	) REFERENCES Staff (
		StaffID
	);

ALTER TABLE Faculty_Categories
	ADD CONSTRAINT Faculty_Categories_FK00 FOREIGN KEY
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	),
	ADD CONSTRAINT Faculty_Categories_FK01 FOREIGN KEY
	(
		StaffID
	) REFERENCES Faculty (
		StaffID
	);

ALTER TABLE Faculty_Classes
	ADD CONSTRAINT Faculty_Classes_FK00 FOREIGN KEY
	(
		ClassID
	) REFERENCES Classes (
	ClassID
	),
	ADD CONSTRAINT Faculty_Classes_FK01 FOREIGN KEY
	(
		StaffID
	) REFERENCES Staff (
		StaffID
	),
	ADD CONSTRAINT Faculty_CLasses_FK02 FOREIGN KEY
	(
		StaffID
	) REFERENCES Faculty (
		StaffID
	);

ALTER TABLE Faculty_Subjects
	ADD CONSTRAINT Faculty_Subjects_FK00 FOREIGN KEY
	(
		StaffID
	) REFERENCES Faculty (
		StaffID
	),
	ADD CONSTRAINT Faculty_Subjects_FK01 FOREIGN KEY
	(
		SubjectID
	) REFERENCES Subjects (
		SubjectID
	);

ALTER TABLE Students
        ADD CONSTRAINT Students_FK00 FOREIGN KEY
        (
                StudMajor
        ) REFERENCES Majors (
                MajorID
        );

ALTER TABLE Student_Schedules
	ADD CONSTRAINT Student_Schedules_FK00 FOREIGN KEY
	(
		ClassID
	) REFERENCES Classes (
		ClassID
	),
	ADD CONSTRAINT Student_Schedules_FK01 FOREIGN KEY
	(
		ClassStatus
	) REFERENCES Student_Class_Status (
		ClassStatus
	),
	ADD CONSTRAINT Student_Schedules_FK02 FOREIGN KEY
	(
		StudentID
	) REFERENCES Students (
		StudentID
	);

ALTER TABLE Subjects
	ADD CONSTRAINT Subjects_FK00 FOREIGN KEY
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	),
	ADD CONSTRAINT Subjects_FK01 FOREIGN KEY
	(
		SubjectPreReq
	) REFERENCES Subjects (
		SubjectCode
	);
