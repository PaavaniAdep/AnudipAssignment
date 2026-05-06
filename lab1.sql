
/* Question
Create a table with named Feedback 

with attributes: ● FeedbackID (Primary Key) 

● StudentID (Foreign key) 

● Date 

● InstructorName 

● Feedback


Answer: */

mysql> create database student_management_system;
Query OK, 1 row affected (0.01 sec)

mysql> use student_management_system;
Database changed

mysql> create table Student(student_id int not null primary key auto_increment,name varchar(20),age int,phone_number integer);
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+-------------------------------------+
| Tables_in_student_management_system |
+-------------------------------------+
| student                             |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> desc student;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| student_id   | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(20) | YES  |     | NULL    |                |
| age          | int         | YES  |     | NULL    |                |
| phone_number | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> create table Feedback(feedback_id int not null primary key auto_increment,student_id int,feedback_date date,instructor_name varchar(20),feedback varchar(100),foreign key(student_id)references Student(student_id));
Query OK, 0 rows affected (0.05 sec)

mysql> desc Feedback;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| feedback_id     | int          | NO   | PRI | NULL    | auto_increment |
| student_id      | int          | YES  | MUL | NULL    |                |
| feedback_date   | date         | YES  |     | NULL    |                |
| instructor_name | varchar(20)  | YES  |     | NULL    |                |
| feedback        | varchar(100) | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)