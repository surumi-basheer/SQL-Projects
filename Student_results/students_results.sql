create database student_results;
use student_results;
create table students(student_id int primary key,Name varchar(150),department varchar(250),year varchar(150));
create table subjects(subject_id int primary key,subject_name varchar(250),credits int);
create table marks(mark_id int,student_id int, foreign key(student_id) references students(student_id),subject_id int,foreign key (subject_id) references subjects(subject_id),marks int);
INSERT INTO students (student_id, name, department, year) VALUES
(1, 'Arun Kumar', 'Computer Science', '1st Year'),
(2, 'Priya Sharma', 'Information Technology', '2nd Year'),
(3, 'Rahul Verma', 'Electronics', '3rd Year'),
(4, 'Sneha Patel', 'Mechanical Engineering', 'Final Year'),
(5, 'Amit Singh', 'Civil Engineering', '1st Year');
INSERT INTO subjects (subject_id, subject_name, credits) VALUES
(1, 'Database Management Systems', 50),
(2, 'Operating Systems', 50),
(3, 'Computer Networks', 50);
INSERT INTO marks (mark_id, student_id, subject_id, marks) VALUES
(1, 1, 1, 85),
(2, 1, 2, 78),
(3, 1, 3, 88),

(4, 2, 1, 72),
(5, 2, 2, 90),
(6, 2, 3, 78),

(7, 3, 1, 45),
(8, 3, 2, 67),
(9, 3, 3, 72),

(10, 4, 1, 84),
(11, 4, 2, 59),
(12, 4, 3, 62),

(13, 5, 1,92),
(14, 5, 2, 67),
(15, 5, 3, 72);
-- Get top 3 students in each subject
select s.student_id,s.Name,su.subject_id,su.subject_name,m.marks from marks m inner join students s on m.student_id = s.student_id
inner join subjects su on su.subject_id = m.subject_id where su. subject_id=1 order by 
marks desc limit 3 ;       
select s.student_id,s.Name,su.subject_id,su.subject_name,m.marks from marks m inner join students s on m.student_id = s.student_id
inner join subjects su on su.subject_id = m.subject_id where su. subject_id=2 order by 
marks desc limit 3 ;
select s.student_id,s.Name,su.subject_id,su.subject_name,m.marks from marks m inner join students s on m.student_id = s.student_id
inner join subjects su on su.subject_id = m.subject_id where su. subject_id=3 order by 
marks desc limit 3 ;
 
-- Calculate average marks per department
select department,avg (marks) from students inner join marks on students.student_id = marks.student_id group by department;                                                                                                                                                                                                                                                                                                                                                                                                                                                  

-- Find students who failed in more than 1 subjects
select s.student_id,s.Name,count(m.subject_id) from students s inner join marks m on s.student_id = m.student_id  where marks< 70 group by s.student_id,s.Name having count(m.subject_id)>= 1; 