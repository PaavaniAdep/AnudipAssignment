/* Question:
         Aggregation function, ORDER BY clauses, GROUP BY clauses, HAVING clauses, RENAME */

Answer:




mysql> show databases;
+---------------------------+
| Database                  |
+---------------------------+
| bankaccount               |
| ecommerce                 |
| hospital                  |
| information_schema        |
| mysql                     |
| performance_schema        |
| shop                      |
| student_management_system |
| sys                       |
+---------------------------+
9 rows in set (0.09 sec)

mysql> select * from orders;
ERROR 1046 (3D000): No database selected
mysql> use ecommerce;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| orders              |
| product             |
| student             |
+---------------------+
4 rows in set (0.02 sec)

mysql> select * from orders;
Empty set (0.03 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| customer_id  | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(5)  | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)

mysql> create database aggregation;
Query OK, 1 row affected (0.02 sec)

mysql> use aggregation;
Database changed
mysql> create table orders(order_id varchar(5) not null primary key,product_name varchar(10) not null,original_price double not null,selling_price double not null);
Query OK, 0 rows affected (0.06 sec)

mysql> create table product(product_id varchar(5) not null primary key,product_name varchar(10) not null,original_price double not null,selling_price double not null);
Query OK, 0 rows affected (0.04 sec)

mysql> alter table product add column category varchar(20) not null;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table product add column stock int not null;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(5)  | NO   | PRI | NULL    |       |
| product_name   | varchar(10) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| category       | varchar(20) | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into product values('p101','chair','6000','50000','furniture',12);
Query OK, 1 row affected (0.01 sec)

mysql> insert into product values('p102','table','4000','3000','furniture',10);
Query OK, 1 row affected (0.01 sec)

mysql> insert into product values('p103','mobile','20000','17000','electronic',10),('p104','jeans','25000','6000','clothing','14'),('p105','webcam','7000','60000','electronic','22');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select * from product;
+------------+--------------+----------------+---------------+------------+-------+
| product_id | product_name | original_price | selling_price | category   | stock |
+------------+--------------+----------------+---------------+------------+-------+
| p101       | chair        |           6000 |         50000 | furniture  |    12 |
| p102       | table        |           4000 |          3000 | furniture  |    10 |
| p103       | mobile       |          20000 |         17000 | electronic |    10 |
| p104       | jeans        |          25000 |          6000 | clothing   |    14 |
| p105       | webcam       |           7000 |         60000 | electronic |    22 |
+------------+--------------+----------------+---------------+------------+-------+
5 rows in set (0.00 sec)

mysql> select sum(selling_price) from product;
+--------------------+
| sum(selling_price) |
+--------------------+
|             136000 |
+--------------------+
1 row in set (0.01 sec)

mysql> select avg(selling_price) from product;
+--------------------+
| avg(selling_price) |
+--------------------+
|              27200 |
+--------------------+
1 row in set (0.00 sec)

mysql> select count(*) from product;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.01 sec)

mysql> select max(stock) from product;
+------------+
| max(stock) |
+------------+
|         22 |
+------------+
1 row in set (0.00 sec)

mysql> select min(stock) from product;
+------------+
| min(stock) |
+------------+
|         10 |
+------------+
1 row in set (0.00 sec)

mysql> select * from product order by stock;
+------------+--------------+----------------+---------------+------------+-------+
| product_id | product_name | original_price | selling_price | category   | stock |
+------------+--------------+----------------+---------------+------------+-------+
| p102       | table        |           4000 |          3000 | furniture  |    10 |
| p103       | mobile       |          20000 |         17000 | electronic |    10 |
| p101       | chair        |           6000 |         50000 | furniture  |    12 |
| p104       | jeans        |          25000 |          6000 | clothing   |    14 |
| p105       | webcam       |           7000 |         60000 | electronic |    22 |
+------------+--------------+----------------+---------------+------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by stock desc;
+------------+--------------+----------------+---------------+------------+-------+
| product_id | product_name | original_price | selling_price | category   | stock |
+------------+--------------+----------------+---------------+------------+-------+
| p105       | webcam       |           7000 |         60000 | electronic |    22 |
| p104       | jeans        |          25000 |          6000 | clothing   |    14 |
| p101       | chair        |           6000 |         50000 | furniture  |    12 |
| p102       | table        |           4000 |          3000 | furniture  |    10 |
| p103       | mobile       |          20000 |         17000 | electronic |    10 |
+------------+--------------+----------------+---------------+------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by stock desc limit 2;
+------------+--------------+----------------+---------------+------------+-------+
| product_id | product_name | original_price | selling_price | category   | stock |
+------------+--------------+----------------+---------------+------------+-------+
| p105       | webcam       |           7000 |         60000 | electronic |    22 |
| p104       | jeans        |          25000 |          6000 | clothing   |    14 |
+------------+--------------+----------------+---------------+------------+-------+
2 rows in set (0.00 sec)

mysql> select * from product order by stock limit 2;
+------------+--------------+----------------+---------------+------------+-------+
| product_id | product_name | original_price | selling_price | category   | stock |
+------------+--------------+----------------+---------------+------------+-------+
| p102       | table        |           4000 |          3000 | furniture  |    10 |
| p103       | mobile       |          20000 |         17000 | electronic |    10 |
+------------+--------------+----------------+---------------+------------+-------+
2 rows in set (0.00 sec)

mysql> create table employee(employee_id varchar(5) not null primary key,employee_name varchar(10) not null,department varchar(10) not null,salary int not null);
Query OK, 0 rows affected (0.04 sec)

mysql> select * from employee;
Empty set (0.01 sec)


mysql> insert into employee values('e101','pavani','HR',40000),('e102','diksha','HR',30000),('e103','dipti','IT',9000),('e104','laya','IT',7000),('e105','vasu','finance',8000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------------+---------------+------------+--------+
| employee_id | employee_name | department | salary |
+-------------+---------------+------------+--------+
| e101        | pavani        | HR         |  40000 |
| e102        | diksha        | HR         |  30000 |
| e103        | dipti         | IT         |   9000 |
| e104        | laya          | IT         |   7000 |
| e105        | vasu          | finance    |   8000 |
+-------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department,count(*) AS total_employee from EMPLOYEE GROUP BY department;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
| finance    |              1 |
+------------+----------------+
3 rows in set (0.00 sec)

mysql> select department,sum(salary) AS total_salary from employee GROUP BY department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        70000 |
| IT         |        16000 |
| finance    |         8000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department,avg(salary) AS average_salary from employee GROUP BY department;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| HR         |     35000.0000 |
| IT         |      8000.0000 |
| finance    |      8000.0000 |
+------------+----------------+
3 rows in set (0.00 sec)

mysql> select department,salary,count(*) from employee GROUP BY department,salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| HR         |  40000 |        1 |
| HR         |  30000 |        1 |
| IT         |   9000 |        1 |
| IT         |   7000 |        1 |
| finance    |   8000 |        1 |
+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> select department,count(*) as total_employee from employee group by department having count(*)> 1;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
+------------+----------------+
2 rows in set (0.00 sec)

mysql> select department,sum(salary) as total_salary from employee group by department having sum(salary)> 8000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        70000 |
| IT         |        16000 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> select department,sum(salary) as total_salary from employee group by department having sum(salary)> 6000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        70000 |
| IT         |        16000 |
| finance    |         8000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department,avg(salary) as total_salary from employee group by department having sum(salary)> 9000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |   35000.0000 |
| IT         |    8000.0000 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> alter table employee rename to employee_details;
Query OK, 0 rows affected (0.03 sec)


mysql> select * from employee_details;
+-------------+---------------+------------+--------+
| employee_id | employee_name | department | salary |
+-------------+---------------+------------+--------+
| e101        | pavani        | HR         |  40000 |
| e102        | diksha        | HR         |  30000 |
| e103        | dipti         | IT         |   9000 |
| e104        | laya          | IT         |   7000 |
| e105        | vasu          | finance    |   8000 |
+-------------+---------------+------------+--------+
5 rows in set (0.00 sec)
