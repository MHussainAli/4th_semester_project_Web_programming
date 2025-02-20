CREATE DATABASE IF NOT EXISTS campus_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE campus_management;
DROP TABLE IF EXISTS enrollments; DROP TABLE IF EXISTS courses; DROP TABLE IF EXISTS students;
CREATE TABLE students(id INT AUTO_INCREMENT PRIMARY KEY,roll_no VARCHAR(30) UNIQUE NOT NULL,name VARCHAR(100) NOT NULL,email VARCHAR(120) UNIQUE NOT NULL,phone VARCHAR(30),department VARCHAR(100) NOT NULL,semester INT NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE courses(id INT AUTO_INCREMENT PRIMARY KEY,code VARCHAR(30) UNIQUE NOT NULL,title VARCHAR(120) NOT NULL,credit_hours INT NOT NULL,instructor VARCHAR(100) NOT NULL);
CREATE TABLE enrollments(id INT AUTO_INCREMENT PRIMARY KEY,student_id INT NOT NULL,course_id INT NOT NULL,enrolled_on DATE NOT NULL,FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE,FOREIGN KEY(course_id) REFERENCES courses(id) ON DELETE CASCADE,UNIQUE(student_id,course_id));
INSERT INTO students(roll_no,name,email,phone,department,semester) VALUES ('BSCS-001','Ali Ahmed','ali@example.com','03001234567','Computer Science',3),('BSCS-002','Sara Khan','sara@example.com','03111234567','Computer Science',3),('BSCS-003','Usman Raza','usman@example.com','03221234567','Software Engineering',4);
INSERT INTO courses(code,title,credit_hours,instructor) VALUES ('CS-301','Web Programming',3,'Dr. Ahmed'),('CS-302','Data Structures',3,'Dr. Hassan'),('CS-303','Database Systems',3,'Dr. Sara');
INSERT INTO enrollments(student_id,course_id,enrolled_on) VALUES(1,1,CURDATE()),(1,2,CURDATE()),(2,1,CURDATE());
