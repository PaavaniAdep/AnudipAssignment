/*Question
         Store Procedure:
         A stored procedure GetEmployeeById using an IN parameter to display employee details based on employee id,
         A stored procedure GetTotalEmployees using an OUT parameter to return the total number of employees in the table,
         A stored procedure IncreaseSalary using an INOUT parameter to increase the salary value by 5000?  */

Answer:

mysql> create database company_db;
Query OK, 1 row affected (0.06 sec)

mysql> use company_db;
Database changed
mysql> CREATE TABLE employees (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     dept VARCHAR(50),
    ->     salary INT
    ->
    -> );
Query OK, 0 rows affected (0.20 sec)

mysql> INSERT INTO employees VALUES(1, 'chiti', 'HR', 20000),(2, 'vasu', 'IT', 30000),(3, 'depu', 'Sales', 25000),(4, 'laya', 'IT', 40000);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc employees;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(50) | YES  |     | NULL    |       |
| dept   | varchar(50) | YES  |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> select * from employees;
+----+-------+-------+--------+
| id | name  | dept  | salary |
+----+-------+-------+--------+
|  1 | chiti | HR    |  20000 |
|  2 | vasu  | IT    |  30000 |
|  3 | depu  | Sales |  25000 |
|  4 | laya  | IT    |  40000 |
+----+-------+-------+--------+
4 rows in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dname VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM employees
    ->     WHERE dept = dname;
    -> END //
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeByDept('IT');
+----+------+------+--------+
| id | name | dept | salary |
+----+------+------+--------+
|  2 | vasu | IT   |  30000 |
|  4 | laya | IT   |  40000 |
+----+------+------+--------+
2 rows in set (0.01 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE ShowEmployees()
    -> BEGIN
    ->     SELECT * FROM employees;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL ShowEmployees();
+----+-------+-------+--------+
| id | name  | dept  | salary |
+----+-------+-------+--------+
|  1 | chiti | HR    |  20000 |
|  2 | vasu  | IT    |  30000 |
|  3 | depu  | Sales |  25000 |
|  4 | laya  | IT    |  40000 |
+----+-------+-------+--------+
4 rows in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeById(
    ->     IN eid INT
    -> )
    -> BEGIN
    ->
    ->     SELECT *
    ->     FROM employees
    ->     WHERE id = eid;
    ->
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> call getemployeebyid(1);
+----+-------+------+--------+
| id | name  | dept | salary |
+----+-------+------+--------+
|  1 | chiti | HR   |  20000 |
+----+-------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call getemployeebyid(4);
+----+------+------+--------+
| id | name | dept | salary |
+----+------+------+--------+
|  4 | laya | IT   |  40000 |
+----+------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetTotalEmployees(
    ->     OUT total INT
    -> )
    -> BEGIN
    ->
    ->     SELECT COUNT(*) INTO total
    ->     FROM employees;
    ->
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetTotalEmployees(@t);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT @t;
+------+
| @t   |
+------+
|    4 |
+------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE IncreaseSalary(
    ->     INOUT sal INT
    -> )
    -> BEGIN
    ->
    ->     SET sal = sal + 5000;
    ->
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> SET @x = 20000;
Query OK, 0 rows affected (0.00 sec)

mysql> CALL IncreaseSalary(@x);
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @x;
+-------+
| @x    |
+-------+
| 25000 |
+-------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE IncreaseEmployeeSalary(
    ->     IN eid INT
    -> )
    -> BEGIN
    ->
    ->     UPDATE employees
    ->     SET salary = salary + 5000
    ->     WHERE id = eid;
    ->
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> call increaseemployeesalary(2);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employees;
+----+-------+-------+--------+
| id | name  | dept  | salary |
+----+-------+-------+--------+
|  1 | chiti | HR    |  20000 |
|  2 | vasu  | IT    |  35000 |
|  3 | depu  | Sales |  25000 |
|  4 | laya  | IT    |  40000 |
+----+-------+-------+--------+
4 rows in set (0.00 sec)