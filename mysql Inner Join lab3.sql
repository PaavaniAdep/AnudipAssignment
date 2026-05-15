/* Question: Create database Studentmanagementsystem contain  "Student" table with the following a columns:StudentId,FirstName,lastName

 and "Course" table with the following a columns: CourseId,CourseName 

and Enrollment table with the following a columns:EnrollmentID,StudentID(Foreign key),CourseID(Foreign Key).

You want to use inner join to generate a list of all possible student-course combinations.*/

Answer:


mysql> show databases;
+---------------------------+
| Database                  |
+---------------------------+
| aggregation               |
| bankaccount               |
| company_db                |
| ecommerce                 |
| hospital                  |
| information_schema        |
| joints                    |
| mysql                     |
| performance_schema        |
| shop                      |
| store_procedure_example   |
| student_management_system |
| sys                       |
+---------------------------+
13 rows in set (0.14 sec)

mysql> show tables;
+-------------------------------------+
| Tables_in_student_management_system |
+-------------------------------------+
| feedback                            |
| student                             |
+-------------------------------------+
2 rows in set (0.02 sec)

mysql> create database studentmanagementsystem;
Query OK, 1 row affected (0.03 sec)

mysql> use studentmanagementsystem;
Database changed
mysql> create table student(student_id varchar(10) primary key not null,first_name varchar(10) not null,last_name varchar(10) not null);
Query OK, 0 rows affected (0.05 sec)

mysql> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | varchar(10) | NO   | PRI | NULL    |       |
| first_name | varchar(10) | NO   |     | NULL    |       |
| last_name  | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into student values('s101','Pavani','Adep'),('s102','Diksha','Ghadigao'),('s103','Vasuda','Merugu'),('s104','Lavanya','Gajula'),('s105','Depika','Mittapeli');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from student;
+------------+------------+-----------+
| student_id | first_name | last_name |
+------------+------------+-----------+
| s101       | Pavani     | Adep      |
| s102       | Diksha     | Ghadigao  |
| s103       | Vasuda     | Merugu    |
| s104       | Lavanya    | Gajula    |
| s105       | Depika     | Mittapeli |
+------------+------------+-----------+
5 rows in set (0.00 sec)


mysql> create table course(course_id varchar(10) primary key not null,course_name varchar(10) not null);
Query OK, 0 rows affected (0.15 sec)

mysql> desc course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | varchar(10) | NO   | PRI | NULL    |       |
| course_name | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into course values('c101','pavani'),('c102','vasuda'),('c103','laya'),('c104','depika'),('c104','chitti');
ERROR 1062 (23000): Duplicate entry 'c104' for key 'course.PRIMARY'
mysql> insert into course values('c101','pavani'),('c102','vasuda'),('c103','laya'),('c104','depika'),('c105','chitti');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from course;
+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
| c101      | pavani      |
| c102      | vasuda      |
| c103      | laya        |
| c104      | depika      |
| c105      | chitti      |
+-----------+-------------+
5 rows in set (0.00 sec)

mysql> create table enrollment(enrollment_id varchar(10) primary key not null,course_id varchar(10) not null,foreign key (course_id) REFERENCES course(course_id),student_id varchar(10) not null,foreign key (student_id) REFERENCES student(student_id));
Query OK, 0 rows affected (0.09 sec)

mysql> desc enrollment;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| enrollment_id | varchar(10) | NO   | PRI | NULL    |       |
| course_id     | varchar(10) | NO   | MUL | NULL    |       |
| student_id    | varchar(10) | NO   | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into enrollment values('1','2','101'),('2','3','102'),('3','4','103'),('4','5','104'),('5','6','105');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`studentmanagementsystem`.`enrollment`, CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`))
mysql> desc enrollment;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| enrollment_id | varchar(10) | NO   | PRI | NULL    |       |
| course_id     | varchar(10) | NO   | MUL | NULL    |       |
| student_id    | varchar(10) | NO   | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.20 sec)

mysql> select * from enrollment;
Empty set (0.00 sec)

mysql> insert into student values('101','Pavani','Adep'),('102','Diksha','Ghadigao'),('103','Vasuda','Merugu');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student;
+------------+------------+-----------+
| student_id | first_name | last_name |
+------------+------------+-----------+
| 101        | Pavani     | Adep      |
| 102        | Diksha     | Ghadigao  |
| 103        | Vasuda     | Merugu    |
| s101       | Pavani     | Adep      |
| s102       | Diksha     | Ghadigao  |
| s103       | Vasuda     | Merugu    |
| s104       | Lavanya    | Gajula    |
| s105       | Depika     | Mittapeli |
+------------+------------+-----------+
8 rows in set (0.00 sec)

mysql> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | varchar(10) | NO   | PRI | NULL    |       |
| first_name | varchar(10) | NO   |     | NULL    |       |
| last_name  | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into course values('1','mysql'),('2','python'),('3','java');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into enrollment values('e1','c101','s101'),('e2','c102','s102'),('e3','c103','s103');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select s.student_id,s.first_name,s.last_name,c.course_id,c.course_name from enrollment e inner join student s on e.student_id=s.student_id inner join course c on e.course_id=c.course_id;
+------------+------------+-----------+-----------+-------------+
| student_id | first_name | last_name | course_id | course_name |
+------------+------------+-----------+-----------+-------------+
| s101       | Pavani     | Adep      | c101      | pavani      |
| s102       | Diksha     | Ghadigao  | c102      | vasuda      |
| s103       | Vasuda     | Merugu    | c103      | laya        |
+------------+------------+-----------+-----------+-------------+
3 rows in set (0.00 sec)