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
    
INSERT INTO PROGRAMME (ProgrammeName, SchoolID) 
VALUES
-- School of Computing and Informatics (SchoolID = 1)
('BSc (Hons) in Computer Science', 1),
('BSc (Hons) in Digital Media', 1),
('BSc (Hons) in Computing with Data Analytics', 1),
('BSc (Hons) in Cybersecurity', 1),

-- School of Business (SchoolID = 2)
('Bachelor of Business (Hons) in Finance & Risk Management', 2),
('Bachelor of Business (Hons) in Marketing & Information Systems', 2),
('Bachelor of Business (Hons) in Accounting & Information Systems', 2),

-- School of Applied Sciences and Mathematics (SchoolID = 3)
('BSc (Hons) in Applied Mathematics and Finance', 3),
('BSc (Hons) in Food Science and Technology', 3),
('BSc (Hons) in Agrotechnology', 3),

-- Faculty of Engineering (SchoolID = 4)
('BEng (Hons) in Civil Engineering', 4),
('BEng (Hons) in Mechanical Engineering', 4),
('BEng (Hons) in Electrical & Electronic Engineering', 4),
('BEng (Hons) in Mechatronics Engineering', 4),

-- School of Design (SchoolID = 5)
('BSc (Hons) in Architecture', 5),
('BSc (Hons) in Product Design', 5);

INSERT INTO STUDENT (StudentID, EnrolmentNumber, Name, ICNumber, Address, PhoneNumber, Email, YearStudy, YearCompletion, ProgrammeID) VALUES
(1, 'B2025011', 'Mohammad Danish bin Haji Kamal', '01-112244', 'No. 12, Spg 45, Kg Rimba, BE3119', '+6738123456', 'danish.kamal@student.utb.bn', 2, 2027, 1),
(2, 'B2025012', 'Nur Fathiah binti Haji Zainal', '01-223355', NULL, '+6738234567', 'fathiah.zainal@student.utb.bn', 2, 2027, 2),
(3, 'B2025013', 'Awangku Mohammad Faiz bin Pengiran Latif', '01-334466', 'No. 8, Spg 112, Kg Jerudong, BG3122', NULL, 'awgku.latif@student.utb.bn', 2, 2028, 3),
(4, 'B2025014', 'Siti Norazimah binti Awang Besar', '01-445577', 'No. 25, Spg 88, Kg Mentiri, BU1929', '+6738456789', 'siti.besar@student.utb.bn', 2, NULL, 4),
(5, 'B2025015', 'Chua Wei Lun', '00-556688', NULL, NULL, 'chua.lun@student.utb.bn', 2, 2028, 5),
(6, 'B2025016', 'Dayangku Nur Syazwana binti Pengiran Haji Damit', '01-667799', 'No. 3, Spg 204, Kg Sengkurong, BG1121', '+6738678901', 'dayangku.damit@student.utb.bn', 2, 2027, 6),
(7, 'B2025017', 'Mohammad Nazirul bin Haji Yusof', '01-778800', 'No. 19, Spg 15, Kg Lambak Kanan, BC2315', '+6738789012', 'mohammad.yusof2@student.utb.bn', 2, NULL, 7),
(8, 'B2025018', 'Nurul Hazirah binti Haji Ramli', '01-889911', NULL, '+6738890123', 'nurul.ramli@student.utb.bn', 2, 2028, 8),
(9, 'B2025019', 'Goh Jun Hao', '00-990022', 'No. 42, Spg 60, Kg Serusop, BB2313', NULL, 'goh.hao@student.utb.bn', 2, 2027, 9),
(10, 'B2025020', 'Siti Rashidah binti Haji Umar', '01-001133', 'No. 7, Spg 33, Kg Gadong, BE1118', '+6738012345', 'siti.umar@student.utb.bn', 2, 2027, 10),
(11, 'B2026011', 'Mohammad Khairul bin Awang Nordin', '01-113355', NULL, '+6738112233', 'mohammad.nordin@student.utb.bn', 1, 2028, 11),
(12, 'B2026012', 'Nur Sabrina binti Haji Ariffin', '01-224466', 'No. 14, Spg 9, Kg Kiulap, BE1518', NULL, 'sabrina.ariffin@student.utb.bn', 1, 2028, 12),
(13, 'B2026013', 'Awangku Mohammad Luqman bin Pengiran Haji Rahim', '01-335577', 'No. 51, Spg 500, Kg Tutong, TA1141', '+6738334455', 'awgku.rahim@student.utb.bn', 1, NULL, 13),
(14, 'B2026014', 'Vanessa Ong Mei Ling', '00-446688', NULL, '+6738445566', 'vanessa.ong@student.utb.bn', 1, 2028, 14),
(15, 'B2026015', 'Mohammad Zulfadli bin Haji Sapar', '01-557799', 'No. 88, Spg 72, Kg Kilanas, BF2520', NULL, 'mohammad.sapar@student.utb.bn', 1, 2029, 15),
(16, 'B2026016', 'Dayangku Nurul Ain binti Pengiran Tajuddin', '01-668800', 'No. 6, Spg 130, Kg Subok, BD2717', '+6738667788', 'dayangku.tajuddin@student.utb.bn', 1, 2028, 16),
(17, 'B2026017', 'Mohammad Syahmi bin Haji Yahya', '01-779911', NULL, NULL, 'mohammad.yahya@student.utb.bn', 1, 2029, 3),
(18, 'B2026018', 'Nur Nabilah binti Awang Suhaimi', '01-880022', 'No. 22, Spg 41, Kg Tanjong Nangka, BG2321', '+6738889900', 'nur.suhaimi@student.utb.bn', 1, NULL, 7),
(19, 'B2026019', 'Kevin Tan Zhi Ming', '00-991133', 'No. 31, Spg 18, Kg Kiarong, BE1318', '+6738990011', 'kevin.tan@student.utb.bn', 1, 2028, 11),
(20, 'B2026020', 'Siti Nurfadhilah binti Haji Md Zin', '01-002244', NULL, '+6738001122', 'siti.zin@student.utb.bn', 1, 2030, 16);
    
INSERT INTO EVENT (EventName, EventDate, EventActivities, CategoryID) 
VALUES
-- Category 1: Islamic
('UTB Majlis Khatam Al-Quran', '2026-03-25', 'Quran recitation, Khatam ceremony, and Tahlil', 1),
('Isra Mi\'raj Commemoration Lecture', '2026-02-16', 'Religious talk and congregational prayers', 1),
('Ma\'al Hijrah Special Ceramah', '2026-06-16', 'Islamic talk on personal development and renewal', 1),

-- Category 2: Life Skills
('UTB Career & Entrepreneurship Workshop', '2026-04-10', 'Resume writing, mock interviews, and startup pitching', 2),
('Public Speaking & Leadership Masterclass', '2026-05-18', 'Toastmasters-style drills and presentation exercises', 2),
('Financial Literacy for Graduates', '2026-08-05', 'Budgeting, investing, and personal finance management', 2),
('Design Thinking & Problem Solving Bootcamp', '2026-10-12', 'Interactive group case studies and rapid prototyping', 2),

-- Category 3: Sport Physical
('UTB Annual Campus Run & Fitness Fest', '2026-02-22', '5km and 10km fun run, aerobics session', 3),
('Inter-Faculty Badminton Championship', '2026-03-08', 'Singles and doubles tournament matches', 3),
('UTB Futsal League Tournament', '2026-07-14', 'Competitive group matches and knockout finals', 3),
('Campus Martial Arts Showcase & Workshop', '2026-09-02', 'Silat and Taekwondo demonstrations and basics training', 3),

-- Category 4: Community Services
('Campus Green & Tree Planting Drive', '2026-01-20', 'Planting saplings and campus recycling campaign', 4),
('UTB Blood Donation & Health Screening Drive', '2026-04-28', 'Voluntary blood donation and basic health checks', 4),
('Beach Clean-Up at Muara Beach', '2026-06-06', 'Trash collection, sorting, and coastal conservation talk', 4),
('Charity Bake Sale & Toy Drive for Orphans', '2026-11-15', 'Fundraising stalls and toy collection booth', 4),

-- Category 5: Culture
('Malay Cultural Heritage Showcase', '2026-02-05', 'Gulingtangan performance, traditional attire, and food tasting', 5),
('UTB International Cultural Night', '2026-09-20', 'International student performances, booth exhibits, and fashion show', 5),
('Traditional Arts & Calligraphy Workshop', '2026-10-25', 'Hands-on Jawi calligraphy and traditional craft making', 5);

INSERT INTO PARTICIPATION (StudentID, EventID, RoleID, Hours) 
VALUES
-- Event 1: UTB Majlis Khatam Al-Quran
(1, 1, 4, 8.0),  -- Organizer
(2, 1, 3, 6.0),  -- Committee Member
(3, 1, 1, 2.5),  -- Participant
-- Event 2: Isra Mi'raj Commemoration Lecture
(4, 2, 2, 4.0),  -- Volunteer
(5, 2, 1, 2.0),  -- Participant
-- Event 3: Ma'al Hijrah Special Ceramah
(6, 3, 1, 2.0),  -- Participant
-- Event 4: UTB Career & Entrepreneurship Workshop
(7, 4, 4, 10.0), -- Organizer
(8, 4, 3, 7.5),  -- Committee Member
(9, 4, 1, 4.0),  -- Participant
-- Event 5: Public Speaking & Leadership Masterclass
(10, 5, 2, 5.0), -- Volunteer
(11, 5, 1, 3.5), -- Participant
-- Event 6: Financial Literacy for Graduates
(12, 6, 1, 3.0), -- Participant
-- Event 7: Design Thinking & Problem Solving Bootcamp
(13, 7, 3, 6.0), -- Committee Member
(14, 7, 1, 4.5), -- Participant
-- Event 8: UTB Annual Campus Run & Fitness Fest
(15, 8, 4, 12.0),-- Organizer
(16, 8, 2, 6.0), -- Volunteer
(17, 8, 1, 3.0), -- Participant
(1, 8, 1, 3.0),  -- Participant
-- Event 9: Inter-Faculty Badminton Championship
(18, 9, 3, 8.0), -- Committee Member
(19, 9, 1, 4.0), -- Participant
-- Event 10: UTB Futsal League Tournament
(20, 10, 2, 5.5),-- Volunteer
(2, 10, 1, 4.0), -- Participant
-- Event 12: UTB Blood Donation & Health Screening Drive
(3, 12, 4, 9.0), -- Organizer
(4, 12, 2, 5.0), -- Volunteer
-- Event 14: Beach Clean-Up at Muara Beach
(5, 14, 2, 6.0), -- Volunteer
(6, 14, 1, 4.0), -- Participant
-- Event 16: Malay Cultural Heritage Showcase
(7, 16, 3, 7.0), -- Committee Member
(8, 16, 1, 3.5), -- Participant
-- Event 17: UTB International Cultural Night
(9, 17, 4, 15.0);-- Organizer

INSERT INTO CLUB_MEMBERSHIP (StudentID, ClubID, Position, StartYear, EndYear) VALUES
-- Student 1
(1, 1, 'President', 2024, NULL),
(1, 4, 'Member', 2023, 2025),
-- Student 2
(2, 1, 'Vice President', 2024, NULL),
(2, 3, 'Secretary', 2023, NULL),
-- Student 3
(3, 2, 'President', 2025, NULL),
-- Student 4
(4, 2, 'Treasurer', 2024, NULL),
(4, 8, 'Member', 2025, NULL),
-- Student 5
(5, 3, 'President', 2024, NULL),
-- Student 6
(6, 3, 'Vice President', 2025, NULL),
-- Student 7
(7, 4, 'Head of Public Relations', 2024, NULL),
-- Student 8
(8, 4, 'Member', 2024, 2025),
(8, 5, 'President', 2025, NULL),
-- Student 9
(9, 5, 'Secretary', 2024, NULL),
-- Student 10
(10, 6, 'President', 2023, NULL),
-- Student 11
(11, 6, 'Treasurer', 2024, NULL),
-- Student 12
(12, 7, 'President', 2025, NULL),
-- Student 13
(13, 7, 'Member', 2024, NULL),
(13, 10, 'Logistics Officer', 2025, NULL),
-- Student 14
(14, 8, 'President', 2024, NULL),
-- Student 15
(15, 8, 'Vice President', 2025, NULL),
-- Student 16
(16, 9, 'President', 2024, NULL),
-- Student 17
(17, 9, 'Event Coordinator', 2025, NULL),
-- Student 18
(18, 10, 'President', 2023, NULL),
-- Student 19
(19, 10, 'Member', 2024, NULL),
-- Student 20
(20, 1, 'Member', 2025, NULL);

-- Display 
SELECT * FROM school ORDER BY (SchoolID);
SELECT * FROM event_category ORDER BY (categoryID);
SELECT * FROM role ORDER BY (roleID);
SELECT * FROM club ORDER BY (clubID);
SELECT * FROM programme ORDER BY (programmeID);
SELECT * FROM student ORDER BY (studentID);
SELECT * FROM event ORDER BY (eventID);
SELECT * FROM participation ORDER BY (participationID);
SELECT * FROM club_membership ORDER BY (membershipID);


-- Test Query

-- Can we join student + programme?
SELECT
    s.Name,
    s.EnrolmentNumber,
    p.ProgrammeName
FROM STUDENT s
JOIN PROGRAMME p
    ON s.ProgrammeID = p.ProgrammeID; 
    
-- Can we see event participation? 
SELECT
    s.Name,
    e.EventName,
    r.RoleName,
    p.Hours
FROM PARTICIPATION p
JOIN STUDENT s
    ON p.StudentID = s.StudentID
JOIN EVENT e
    ON p.EventID = e.EventID
JOIN ROLE r
    ON p.RoleID = r.RoleID;
    
-- Can we see event categories?
SELECT
    e.EventName,
    ec.CategoryName,
    e.EventDate
FROM EVENT e
JOIN EVENT_CATEGORY ec
    ON e.CategoryID = ec.CategoryID;
    
-- Can we see club membership? 
SELECT
    s.Name,
    c.ClubName,
    cm.Position,
    cm.StartYear,
    cm.EndYear
FROM CLUB_MEMBERSHIP cm
JOIN STUDENT s
    ON cm.StudentID = s.StudentID
JOIN CLUB c
    ON cm.ClubID = c.ClubID;
    
-- Test the foreign key 
INSERT INTO PARTICIPATION
(StudentID, EventID, RoleID, Hours)
VALUES
(9999, 1, 1, 3.0);