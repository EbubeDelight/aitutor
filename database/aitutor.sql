--create the 'aitutor' database
CREATE DATABASE aitutor;

-- Connect to the 'aitutor' database
\c aitutor;


--create the 'user' tabel
CREATE TABLE user (
    userId BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    userPassword VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    userRole VARCHAR(50) NOT NULL
);

-- create the 'profile' table
CREATE TABLE profile (
    profileId BIGSERIAL PRIMARY KEY,
    bio VARCHAR(255),
    contactInfo VARCHAR(255),
    photo BYTEA,-- Assuming photo is stored as binary data
    userId BIGSERIAL UNIQUE,
    FOREIGN KEY (userId) REFERENCES user(userId)
);

-- create the 'settings' table
CREATE TABLE settings (
    settingsId BIGSERIAL PRIMARY KEY,
    notificationPreferences VARCHAR(50),
    privacySettings VARCHAR(50),
    userId INT UNIQUE,
    FOREIGN KEY (userId ) REFERENCES user(userId )
);
-- create the 'student' table
CREATE TABLE student (
    matrNr BIGSERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    course_enrolled VARCHAR(50) NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(userid)
);
-- create the 'professor' table
CREATE TABLE professor (
    profId BIGSERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    course_taught VARCHAR(50) NOT NULL,
    userId BIGSERIAL UNIQUE,
    FOREIGN KEY (userID) REFERENCES user(userId)
);

-- create the 'course' table
CREATE TABLE course (
    courseId BIGSERIAL PRIMARY KEY,
    courseTitle VARCHAR(100) NOT NULL,
    coursematerial BYTEA, -- Assuming binary data (document or video)
    profId BIGSERIAL,
    FOREIGN KEY (profId ) REFERENCES professor(profId )
);

-- Create the 'enrollment' table
CREATE TABLE enrollment (
    enrollmentId BIGSERIAL PRIMARY KEY,
    matrNr BIGSERIAL,
    CourseID BIGSERIAL,
    FOREIGN KEY (matrNr) REFERENCES student(matrNr),
    FOREIGN KEY (courseId) REFERENCES course(courseId),
    UNIQUE (matrNr, courseId)
);

-- Create the 'admin' table
CREATE TABLE admin (
    adminId BIGSERIAL PRIMARY KEY,
    firstname VARCHAR(55),
    lastname VARCHAR(55),
    email VARCHAR(55),
    userId IGSERIAL UNIQUE,
    FOREIGN KEY (userId) REFERENCES user(userId)
);

-- Create the 'bugs_report' table
CREATE TABLE bugs_report (
    bugId BIGSERIAL PRIMARY KEY,
    bugDescription VARCHAR(100),
    bugStatus VARCHAR(50),
    adminId BIGSERIAL,
    FOREIGN KEY (adminId) REFERENCES admin(adminId)
);

-- Create the 'platform_component' table
CREATE TABLE platform_component (
    componentId SERIAL PRIMARY KEY,
    componentType VARCHAR(55),
    adminId BIGSERIAL,
    bugId BIGSERIAL,
    FOREIGN KEY (adminId) REFERENCES admin(adminId),
    FOREIGN KEY (bugId) REFERENCES admin(bugId)
);

-- Create the 'performance_dashboard' table
CREATE TABLE performance_dashboard (
    dashboardId BIGSERIAL PRIMARY KEY,
    metrics VARCHAR(55),
    reports BYTEA,
    adminId BIGSERIAL,
    FOREIGN KEY (adminId) REFERENCES admin(adminId),
);

-- Create the 'assignment' table
CREATE TABLE assignment (
    assignmentId SERIAL PRIMARY KEY,
    assignmentTitle VARCHAR(100) NOT NULL,
    grade VARCHAR(30),
    submissionDeadline TIMESTAMP,
    courseId BIGSERIAL,
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);

-- Create the 'grade' table
CREATE TABLE grade (
    gradeId BIGSERIAL PRIMARY KEY,
    gradeValue FLOAT NOT NULL,
    assignmentId BIGSERIAL,
    matrNr BIGSERIAL,
    FOREIGN KEY (assignmentId) REFERENCES assignment(assignmentId),
    FOREIGN KEY (matrNr) REFERENCES student(matrNr)
);

-- Create the 'community_chat' table
CREATE TABLE community_chat (
    chatId BIGSERIAL PRIMARY KEY,
    chatTime timestamp,
    chatStatus VARCHAR(55),
    messages VARCHAR(255),
    matrNr BIGSERIAL,
    profId BIGSERIAL,
    FOREIGN KEY (matrNr) REFERENCES student(matrNr),
    FOREIGN KEY (profId) REFERENCES student(profId)
);

-- Create the 'aitutor' table
CREATE TABLE aitutor (
    aitutorId BIGSERIAL PRIMARY KEY,
    knowledgeBase VARCHAR(255),
    responseTime TIMESTAMP
);


