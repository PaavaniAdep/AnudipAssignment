Question  

/*Create a databases question using all SQL commands 
SELECT,DELETE,DROP,TRUNCATE,INSERT,ALERT */

Answer:


mysql> show databases;
+---------------------------+
| Database                  |
+---------------------------+
| ecommerce                 |
| information_schema        |
| mysql                     |
| performance_schema        |
| student_management_system |
| sys                       |
+---------------------------+
6 rows in set (0.11 sec)

mysql> use ecommerce;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| orders              |
| product             |
+---------------------+
3 rows in set (0.01 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phonenumber | varchar(10)  | NO   |     | NULL    |       |
| pincode     | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.03 sec)

mysql> select * from customer;
Empty set (0.03 sec)

mysql> insert into customer(customer_id,name,city,email,address,phonenumber,pincode)values('c101','pavani','bhiwandi','paavani@gmail.com','bhandari compound narpoli','8104545988','421302');
Query OK, 1 row affected (0.03 sec)

mysql> select * from customer;
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
| customer_id | name   | city     | email             | address                   | phonenumber | pincode |
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
| c101        | pavani | bhiwandi | paavani@gmail.com | bhandari compound narpoli | 8104545988  |  421302 |
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
1 row in set (0.00 sec)

mysql> select customer_id,name from customer;
+-------------+--------+
| customer_id | name   |
+-------------+--------+
| c101        | pavani |
+-------------+--------+
1 row in set (0.00 sec)

mysql> insert into customer values('c102','vasu','mumbai','vasu@gmail.com','kalva city','1234546566','421305');
Query OK, 1 row affected (0.01 sec)

mysql> insert into customer values('c103','laya','dadar','laya@gmail.com','sai city','3456345698','421304'),('c104','depika','narpoli','depika@gmail.com','narpoli naka','9875546734','421306');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
| customer_id | name   | city     | email             | address                   | phonenumber | pincode |
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
| c101        | pavani | bhiwandi | paavani@gmail.com | bhandari compound narpoli | 8104545988  |  421302 |
| c102        | vasu   | mumbai   | vasu@gmail.com    | kalva city                | 1234546566  |  421305 |
| c103        | laya   | dadar    | laya@gmail.com    | sai city                  | 3456345698  |  421304 |
| c104        | depika | narpoli  | depika@gmail.com  | narpoli naka              | 9875546734  |  421306 |
+-------------+--------+----------+-------------------+---------------------------+-------------+---------+
4 rows in set (0.00 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phonenumber | varchar(10)  | NO   |     | NULL    |       |
| pincode     | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table customer modify customer_id varchar(10) not null;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(10)  | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phonenumber | varchar(10)  | NO   |     | NULL    |       |
| pincode     | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table customer add bill_no int not null;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(10)  | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phonenumber | varchar(10)  | NO   |     | NULL    |       |
| pincode     | int          | NO   |     | NULL    |       |
| bill_no     | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> alter table customer add state varchar(10) not null,add country varchar(10) not null;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(10)  | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phonenumber | varchar(10)  | NO   |     | NULL    |       |
| pincode     | int          | NO   |     | NULL    |       |
| bill_no     | int          | NO   |     | NULL    |       |
| state       | varchar(10)  | NO   |     | NULL    |       |
| country     | varchar(10)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql> alter table customer change column name customer_name varchar(10) not null;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| customer_id   | varchar(10)  | NO   | PRI | NULL    |       |
| customer_name | varchar(10)  | NO   |     | NULL    |       |
| city          | varchar(10)  | NO   |     | NULL    |       |
| email         | varchar(20)  | NO   |     | NULL    |       |
| address       | varchar(100) | NO   |     | NULL    |       |
| phonenumber   | varchar(10)  | NO   |     | NULL    |       |
| pincode       | int          | NO   |     | NULL    |       |
| bill_no       | int          | NO   |     | NULL    |       |
| state         | varchar(10)  | NO   |     | NULL    |       |
| country       | varchar(10)  | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| customer_id  | varchar(5)  | NO   | MUL | NULL    |
     |
| product_id   | varchar(5)  | NO   | MUL | NULL    |
     |
| quantity     | int         | NO   |     | NULL    |
     |
| total_price  | double      | NO   |     | NULL    |
     |
| payment_mode | varchar(20) | NO   |     | NULL    |
     |
| order_date   | date        | NO   |     | NULL    |
     |
| order_status | varchar(20) | NO   |     | NULL    |
     |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> create table demo(id varchar(5) not null primary key,name varchar(20) not null);
Query OK, 0 rows affected (0.05 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo drop primary key;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   |     | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo add primary key (id);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> delete from customer;
Query OK, 4 rows affected (0.01 sec)

mysql> desc customer;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| customer_id   | varchar(10)  | NO   | PRI | NULL    |       |
| customer_name | varchar(10)  | NO   |     | NULL    |       |
| city          | varchar(10)  | NO   |     | NULL    |       |
| email         | varchar(20)  | NO   |     | NULL    |       |
| address       | varchar(100) | NO   |     | NULL    |       |
| phonenumber   | varchar(10)  | NO   |     | NULL    |       |
| pincode       | int          | NO   |     | NULL    |       |
| bill_no       | int          | NO   |     | NULL    |       |
| state         | varchar(10)  | NO   |     | NULL    |       |
| country       | varchar(10)  | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql> select * from customer;
Empty set (0.00 sec)