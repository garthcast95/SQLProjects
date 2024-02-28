use master;
go
CREATE DATABASE Exam212;
go
use Exam212;

DROP TABLE Adult;
DROP TABLE AdultGuardian;
DROP TABLE ClassEnrolled;
DROP TABLE Coach;
DROP TABLE EnrollmentC;
DROP TABLE Guardian;
DROP TABLE GuardianPlayer;
DROP TABLE Instructor;
DROP TABLE Parent;
DROP TABLE Player;
DROP TABLE PlayerEnrolled;
DROP TABLE Sport;
DROP TABLE SportBeingEnrolled;
DROP TABLE Team;
DROP TABLE TeamClass;
DROP TABLE TeamInstructor;

CREATE TABLE Sport
(
  SportID INT NOT NULL,
  SportName VARCHAR(20) NOT NULL,
  SportFees INT NOT NULL,
  PRIMARY KEY (SportID)
);

CREATE TABLE EnrollmentC
(
  TotalFees INT NOT NULL,
  EnrollmentID INT NOT NULL,
  PRIMARY KEY (EnrollmentID)
);

CREATE TABLE Player
(
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PlayerID INT NOT NULL,
  Birthday DATE NOT NULL,
  PRIMARY KEY (PlayerID)
);

CREATE TABLE TeamClass
(
  ClassID INT NOT NULL,
  PRIMARY KEY (ClassID)
);

CREATE TABLE Adult
(
  AdultID INT NOT NULL,
  AdultName VARCHAR(20) NOT NULL,
  PRIMARY KEY (AdultID)
);

CREATE TABLE Coach
(
  DateHired DATE NOT NULL,
  AdultID INT NOT NULL,
  PRIMARY KEY (AdultID),
  FOREIGN KEY (AdultID) REFERENCES Adult(AdultID)
);

CREATE TABLE Parent
(
  ChildrenNo INT NOT NULL,
  AdultID INT NOT NULL,
  PRIMARY KEY (AdultID),
  FOREIGN KEY (AdultID) REFERENCES Adult(AdultID)
);

CREATE TABLE Guardian
(
  ContactNo VARCHAR(20) NOT NULL,
  GuradianID INT NOT NULL,
  PRIMARY KEY (GuradianID)
);

CREATE TABLE SportBeingEnrolled
(
  SportID INT NOT NULL,
  EnrollmentID INT NOT NULL,
  PRIMARY KEY (SportID, EnrollmentID),
  FOREIGN KEY (SportID) REFERENCES Sport(SportID),
  FOREIGN KEY (EnrollmentID) REFERENCES EnrollmentC(EnrollmentID)
);

CREATE TABLE PlayerEnrolled
(
  EnrollmentID INT NOT NULL,
  PlayerID INT NOT NULL,
  PRIMARY KEY (EnrollmentID, PlayerID),
  FOREIGN KEY (EnrollmentID) REFERENCES EnrollmentC(EnrollmentID),
  FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

CREATE TABLE ClassEnrolled
(
  ClassID INT NOT NULL,
  EnrollmentID INT NOT NULL,
  PRIMARY KEY (ClassID, EnrollmentID),
  FOREIGN KEY (ClassID) REFERENCES TeamClass(ClassID),
  FOREIGN KEY (EnrollmentID) REFERENCES EnrollmentC(EnrollmentID)
);

CREATE TABLE GuardianPlayer
(
  PlayerID INT NOT NULL,
  GuradianID INT NOT NULL,
  PRIMARY KEY (PlayerID, GuradianID),
  FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
  FOREIGN KEY (GuradianID) REFERENCES Guardian(GuradianID)
);

CREATE TABLE AdultGuradian
(
  AdultID INT NOT NULL,
  GuradianID INT NOT NULL,
  PRIMARY KEY (AdultID, GuradianID),
  FOREIGN KEY (AdultID) REFERENCES Adult(AdultID),
  FOREIGN KEY (GuradianID) REFERENCES Guardian(GuradianID)
);

CREATE TABLE Team
(
  TeamID INT NOT NULL,
  TeamName VARCHAR(20) NOT NULL,
  SportID INT NOT NULL,
  PRIMARY KEY (TeamID),
  FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

CREATE TABLE Instructor
(
  InstructorID INT NOT NULL,
  Role VARCHAR(20) NOT NULL,
  AdultID INT NOT NULL,
  PRIMARY KEY (InstructorID),
  FOREIGN KEY (AdultID) REFERENCES Adult(AdultID)
);

CREATE TABLE TeamInstructor
(
  InstructorID INT NOT NULL,
  ClassID INT NOT NULL,
  PRIMARY KEY (InstructorID, ClassID),
  FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
  FOREIGN KEY (ClassID) REFERENCES TeamClass(ClassID)
);

TRUNCATE TABLE PLAYER;

INSERT INTO PLAYER (PlayerID, FirstName, LastName, Birthday)
VALUES (001, 'JOHN', 'SNNUY', '2002-05-10'),
(002, 'DAMION', 'WILSON', '2001-08-10'),
(003, 'ANAKIN', 'SKYWALKER', '2000-12-15'),
(004, 'BILLIE', 'ELLISH', '2008-11-20'),
(005, 'BILLY', 'GRIM', '2006-11-25'),
(006, 'HOWARD', 'STARK', '2007-10-06'),
(007, 'TONY', 'MORENO', '2005-07-02'),
(008, 'PETER', 'PARKER', '2004-01-04'),
(009, 'STEVE', 'GRANT', '2002-03-18'),
(010, 'REY', 'KENOBI', '2004-05-18');

INSERT INTO EnrollmentC (TotalFees, EnrollmentID)
VALUES (500,001),
(250, 002),
(100, 003),
(300,004),
(250, 005),
(400, 006),
(500,007),
(300, 008),
(400, 009),
(200, 010);

INSERT INTO TeamClass (ClassID)
VALUES (001),
(002),
(003),
(004),
(005),
(006),
(007),
(008),
(009),
(010);

INSERT INTO Adult (AdultID, AdultName)
VALUES (001, 'Joe Doe'),
(002, 'Taylor Swift'),
(003, 'William Kidd'),
(004, 'Allen Meyer'),
(005, 'Tyrell Young'),
(006, 'Matt Reeves'),
(007, 'English Jonny'),
(008, 'Ceasar Rome'),
(009, 'Alexander Great'),
(010, 'Tyson Mike');

INSERT INTO Instructor(InstructorID, Role, AdultID)
VALUES (001, 'Coach', 002),
(002, 'Assistant Coach', 003),
(003, 'Coach', 005),
(004, 'Assistant Coach', 008),
(005, 'Coach', 009);

INSERT INTO Instructor(InstructorID, Role, AdultID)
VALUES (006, 'Life Guard', 010);

INSERT INTO TeamInstructor(ClassID, InstructorID)
VALUES (001, 001),
(001, 002),
(002, 003),
(003, 004),
(004, 005);

INSERT INTO Sport (SportID, SportName, SportFees)
VALUES (001,'Volleyball', 200),
(002,'Basketball', 300),
(003,'Soccer', 250),
(004,'Tennis', 100),
(005,'Table Tennis', 150);

INSERT INTO TEAM (TeamID, TeamName, SportID)
VALUES (001, 'Red Jaguars', 001),
(002, 'Blue Lions', 001),
(003, 'Green Cubs', 002),
(004, 'Silver Hawks', 002),
(005, 'Sky Sharks', 003),
(006, 'Rolling Thunder', 003),
(007, 'Maroon Knights', 004),
(008, 'Trailblazers', 004),
(009, 'Sharp Archers', 005),
(010, 'Brown Bulls', 005),
(011, 'Aqua Fins', 004),
(012, 'Bronze Sword', 005);


INSERT INTO PlayerEnrolled (EnrollmentID, PlayerID)
VALUES (001, 001),
(002, 001),
(003, 002),
(004, 002),
(005, 003),
(006, 002),
(007, 004),
(008, 005),
(009, 007),
(010, 007);


DROP TABLE PLAYERSNEW;

CREATE TABLE PLAYERNEW (
  PLAYERNEWID INT NOT NULL,
  NAME VARCHAR(20),
  BIRTHDAY DATE,
  PRIMARY KEY (PLAYERNEWID)
);

CREATE TRIGGER PLAYERNEW
ON PLAYER
AFTER INSERT
AS 
BEGIN PRINT('SUCCESSFULLY ADDED NEW PLAYER')
END

INSERT INTO PLAYER (PlayerID, FirstName, LastName, Birthday)
VALUES (013, 'LEEROY', 'JENKINS', '2007-12-15');


CREATE PROCEDURE NEWTEAM
AS 
BEGIN
SET NOCOUNT ON
select team.SportID, Sport.SportName, Team.TeamName
from Team 
INNER JOIN Sport on Sport.SportID = Team.SportID
end; 

EXEC NEWTEAM;
