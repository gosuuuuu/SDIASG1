-- Create Database
CREATE DATABASE StudentAchievementPassport;
USE StudentAchievementPassport;

CREATE TABLE SCHOOL (
    SchoolID INT AUTO_INCREMENT PRIMARY KEY,
    SchoolName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PROGRAMME (
    ProgrammeID INT AUTO_INCREMENT PRIMARY KEY,
    ProgrammeName VARCHAR(150) NOT NULL,
    SchoolID INT NOT NULL,
    FOREIGN KEY (SchoolID)
        REFERENCES SCHOOL(SchoolID)
);

CREATE TABLE STUDENT (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    EnrolmentNumber VARCHAR(30) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    ICNumber VARCHAR(30) NOT NULL UNIQUE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(30),
    Email VARCHAR(150) NOT NULL UNIQUE,
    YearStudy INT NOT NULL,
    YearCompletion INT,
    ProgrammeID INT NOT NULL,
    FOREIGN KEY (ProgrammeID)
        REFERENCES PROGRAMME(ProgrammeID)
);

CREATE TABLE EVENT_CATEGORY (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE EVENT (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(150) NOT NULL,
    EventDate DATE NOT NULL,
    EventActivities VARCHAR(255),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID)
        REFERENCES EVENT_CATEGORY(CategoryID)
);

CREATE TABLE ROLE (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PARTICIPATION (
    ParticipationID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    EventID INT NOT NULL,
    RoleID INT NOT NULL,
    Hours DECIMAL(4,1) NOT NULL,
    FOREIGN KEY (StudentID)
        REFERENCES STUDENT(StudentID),
    FOREIGN KEY (EventID)
        REFERENCES EVENT(EventID),
    FOREIGN KEY (RoleID)
        REFERENCES ROLE(RoleID)
);

CREATE TABLE CLUB (
    ClubID INT AUTO_INCREMENT PRIMARY KEY,
    ClubName VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE CLUB_MEMBERSHIP (
    MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    ClubID INT NOT NULL,
    Position VARCHAR(100) NOT NULL,
    StartYear INT NOT NULL,
    EndYear INT,
    FOREIGN KEY (StudentID)
        REFERENCES STUDENT(StudentID),
    FOREIGN KEY (ClubID)
        REFERENCES CLUB(ClubID)
);

-- Insert Sample Dataset 
INSERT INTO SCHOOL (SchoolID, SchoolName) 
VALUES 
    (1, 'School of Computing and Informatics'),
    (2, 'School of Business'),
	(3, 'School of Applied Sciences and Mathematics'),
	(4, 'Faculty of Engineering'),
    (5, 'School of Design');
    
INSERT INTO EVENT_CATEGORY (CategoryID, CategoryName) 
VALUES 
    (1, 'Islamic'),
    (2, 'Life Skills'),
	(3, 'Sport Physical'),
	(4, 'Comunity Services'),
    (5, 'Culture');
    
INSERT INTO ROLE (RoleID, RoleName) 
VALUES 
    (1, 'Participant'),
    (2, 'Volunteer'),
	(3, 'Committee Member'),
    (4, 'Organizer');    
    
INSERT INTO CLUB (ClubID, ClubName) 
VALUES 
    (1, 'Frissbee'),
    (2, 'Netball'),
	(3, 'Badminton'),
    (4, 'Futsal'),
    (5, 'Dodgeball'),
    (6, 'Touch Rugby'),
    (7, 'Swimming'),
    (8, 'Music'),
    (9, 'Korean Culture'),
    (10, 'Basketball');  
    

-- Display 
SELECT * FROM SCHOOL ORDER BY (SchoolID);
SELECT * FROM event_category ORDER BY (categoryID);
SELECT * FROM role ORDER BY (roleID);
SELECT * FROM club ORDER BY (clubID);