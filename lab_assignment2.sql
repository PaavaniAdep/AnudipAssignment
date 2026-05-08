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
9 rows in set (0.00 sec)

mysql> use bankaccount;
Database changed
mysql> desc bankaccount;
+---------------------+---------------+------+-----+---------+-------+
| Field               | Type          | Null | Key | Default | Extra |
+---------------------+---------------+------+-----+---------+-------+
| account_id          | varchar(10)   | NO   | PRI | NULL    |       |
| account_holder_name | varchar(20)   | NO   |     | NULL    |       |
| account_balance     | decimal(10,2) | NO   |     | NULL    |       |
+---------------------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> use bankaccount;
Database changed
mysql> create table bankaccount(account_id varchar(10) not null primary key, account_holder_name varchar(20) not null, account_balance decimal(10,2) not null);
Query OK, 0 rows affected (0.04 sec)

mysql> desc bankaccount;
+---------------------+---------------+------+-----+---------+-------+
| Field               | Type          | Null | Key | Default | Extra |
+---------------------+---------------+------+-----+---------+-------+
| account_id          | varchar(10)   | NO   | PRI | NULL    |       |
| account_holder_name | varchar(20)   | NO   |     | NULL    |       |
| account_balance     | decimal(10,2) | NO   |     | NULL    |       |
+---------------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into bankaccount(account_id,account_holder_name,account_balance)values('101','roshan','40000');
Query OK, 1 row affected (0.01 sec)

mysql> select * from bankaccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | roshan              |        40000.00 |
+------------+---------------------+-----------------+
1 row in set (0.00 sec)

mysql> insert into bankaccount values('102','priya','80000'),('103','amruta','50000'),('104','sandhya','60000');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from bankaccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | roshan              |        40000.00 |
| 102        | priya               |        80000.00 |
| 103        | amruta              |        50000.00 |
| 104        | sandhya             |        60000.00 |
+------------+---------------------+-----------------+
4 rows in set (0.00 sec)

mysql> select account_holder_name,account_balance from bankaccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| roshan              |        40000.00 |
| priya               |        80000.00 |
| amruta              |        50000.00 |
| sandhya             |        60000.00 |
+---------------------+-----------------+
4 rows in set (0.00 sec)

mysql> select account_holder_name,account_balance from bankaccount where account_balance >30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| roshan              |        40000.00 |
| priya               |        80000.00 |
| amruta              |        50000.00 |
| sandhya             |        60000.00 |
+---------------------+-----------------+
4 rows in set (0.00 sec)

mysql> update bankaccount set account_balance='50000' where account_id='101';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from bankaccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | roshan              |        50000.00 |
| 102        | priya               |        80000.00 |
| 103        | amruta              |        50000.00 |
| 104        | sandhya             |        60000.00 |
+------------+---------------------+-----------------+
4 rows in set (0.00 sec)