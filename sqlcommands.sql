/*Question


Write SQL queries on a table using the following concepts: UPDATE command, wildcard operators (% and _), LIMIT clause, DISTINCT and non-distinct records, AND, OR, BETWEEN, NOT BETWEEN, IN, NOT IN, IS NULL, IS NOT NULL, greater than (>), less than (<), greater than equal to (>=), and less than equal to (<=) operators?


Answer:



mysql> show databases;
+---------------------------+
| Database                  |
+---------------------------+
| ecommerce                 |
| hospital                  |
| information_schema        |
| mysql                     |
| performance_schema        |
| shop                      |
| student_management_system |
| sys                       |
+---------------------------+
8 rows in set (0.22 sec)

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
4 rows in set (0.03 sec)

mysql> select * from customer;
Empty set (0.05 sec)

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
10 rows in set (0.02 sec)

mysql> insert into customer(customer_id,customer_name,city,email,address,phonenumber,pincode,bill_no,state,country)values('c101','laya','bhiwandi','laya@gmail.com','balaji nagar','9870653452',421302,99,'maharastra','india'),('c102','vasu','narpoli','vasu@gmail.com','bhandari compound','9870574328',421303,09,'usa','xyz');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> insert into customer(customer_id,customer_name,city,email,address,phonenumber,pincode,bill_no,state,country)values('c103','chiti','devji','chiti@gmail.com','thane','9879853452',421306,89,'bhandup','mumbai'),('c104','depu','naka','depu@gmail.com','narayan compound','9835574328',421305,80,'delhi','opl');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
| c103        | chiti         | devji    | chiti@gmail.com | thane             | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
| c104        | depu          | naka     | depu@gmail.com  | narayan compound  | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
4 rows in set (0.00 sec)

mysql> update customer set address='payal compound' where customer_id='c103';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound    | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
| c104        | depu          | naka     | depu@gmail.com  | narayan compound  | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
4 rows in set (0.00 sec)

mysql> select * from customer where customer_name like 'ti%';
Empty set (0.01 sec)

mysql> select * from customer where customer_name like '%ti';
+-------------+---------------+-------+-----------------+----------------+-------------+---------+---------+---------+---------+
| customer_id | customer_name | city  | email           | address        | phonenumber | pincode | bill_no | state   | country |
+-------------+---------------+-------+-----------------+----------------+-------------+---------+---------+---------+---------+
| c103        | chiti         | devji | chiti@gmail.com | payal compound | 9879853452  |  421306 |      89 | bhandup | mumbai  |
+-------------+---------------+-------+-----------------+----------------+-------------+---------+---------+---------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_name like '%a%';
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> select * from customer where customer_name like 'pu%';
Empty set (0.00 sec)

mysql> select * from customer where customer_name like 'u%';
Empty set (0.00 sec)

mysql> select * from customer where customer_name like '%pu';
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
| customer_id | customer_name | city | email          | address          | phonenumber | pincode | bill_no | state | country |
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
| c104        | depu          | naka | depu@gmail.com | narayan compound | 9835574328  |  421305 |      80 | delhi | opl     |
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_name like 'l___';
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address      | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar | 9870653452  |  421302 |      99 | maharastra | india   |
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_name like '_a__';
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> select * from customer where customer_name like '__p_';
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
| customer_id | customer_name | city | email          | address          | phonenumber | pincode | bill_no | state | country |
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
| c104        | depu          | naka | depu@gmail.com | narayan compound | 9835574328  |  421305 |      80 | delhi | opl     |
+-------------+---------------+------+----------------+------------------+-------------+---------+---------+-------+---------+
1 row in set (0.00 sec)

mysql> select * from customer limit 3;
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound    | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql> select * from customer limit 2;
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
+-------------+---------------+----------+----------------+-------------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> select distinct city from customer;
+----------+
| city     |
+----------+
| bhiwandi |
| narpoli  |
| devji    |
| naka     |
+----------+
4 rows in set (0.00 sec)

mysql> select * from customer where bill_no>80;
+-------------+---------------+----------+-----------------+----------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address        | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+----------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar   | 9870653452  |  421302 |      99 | maharastra | india   |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
+-------------+---------------+----------+-----------------+----------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> select * from customer where bill_no<80;
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| customer_id | customer_name | city    | email          | address           | phonenumber | pincode | bill_no | state | country |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| c102        | vasu          | narpoli | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa   | xyz     |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where bill_no<=80;
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| customer_id | customer_name | city    | email          | address           | phonenumber | pincode | bill_no | state | country |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| c102        | vasu          | narpoli | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa   | xyz     |
| c104        | depu          | naka    | depu@gmail.com | narayan compound  | 9835574328  |  421305 |      80 | delhi | opl     |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
2 rows in set (0.00 sec)

mysql> select * from customer where bill_no>=80;
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address          | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar     | 9870653452  |  421302 |      99 | maharastra | india   |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound   | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
| c104        | depu          | naka     | depu@gmail.com  | narayan compound | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_name='laya' AND bill_no='80';
Empty set (0.00 sec)

mysql> select * from customer where customer_name='laya' OR bill_no='80';
+-------------+---------------+----------+----------------+------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address          | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar     | 9870653452  |  421302 |      99 | maharastra | india   |
| c104        | depu          | naka     | depu@gmail.com | narayan compound | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+----------------+------------------+-------------+---------+---------+------------+---------+
2 rows in set (0.00 sec)

mysql> select * from customer where customer_id between 'c102' and 'c104';
+-------------+---------------+---------+-----------------+-------------------+-------------+---------+---------+---------+---------+
| customer_id | customer_name | city    | email           | address           | phonenumber | pincode | bill_no | state   | country |
+-------------+---------------+---------+-----------------+-------------------+-------------+---------+---------+---------+---------+
| c102        | vasu          | narpoli | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa     | xyz     |
| c103        | chiti         | devji   | chiti@gmail.com | payal compound    | 9879853452  |  421306 |      89 | bhandup | mumbai  |
| c104        | depu          | naka    | depu@gmail.com  | narayan compound  | 9835574328  |  421305 |      80 | delhi   | opl     |
+-------------+---------------+---------+-----------------+-------------------+-------------+---------+---------+---------+---------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id between 'c101' and 'c103';
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound    | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id not between 'c102' and 'c104';
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email          | address      | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com | balaji nagar | 9870653452  |  421302 |      99 | maharastra | india   |
+-------------+---------------+----------+----------------+--------------+-------------+---------+---------+------------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_id in ('c101','c104','c103');
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address          | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar     | 9870653452  |  421302 |      99 | maharastra | india   |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound   | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
| c104        | depu          | naka     | depu@gmail.com  | narayan compound | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+-----------------+------------------+-------------+---------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id not in ('c101','c104','c103');
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| customer_id | customer_name | city    | email          | address           | phonenumber | pincode | bill_no | state | country |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
| c102        | vasu          | narpoli | vasu@gmail.com | bhandari compound | 9870574328  |  421303 |       9 | usa   | xyz     |
+-------------+---------------+---------+----------------+-------------------+-------------+---------+---------+-------+---------+
1 row in set (0.00 sec)

mysql> select * from customer where email is null;
Empty set (0.00 sec)

mysql> select * from customer where email is not null;
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| customer_id | customer_name | city     | email           | address           | phonenumber | pincode | bill_no | state      | country |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
| c101        | laya          | bhiwandi | laya@gmail.com  | balaji nagar      | 9870653452  |  421302 |      99 | maharastra | india   |
| c102        | vasu          | narpoli  | vasu@gmail.com  | bhandari compound | 9870574328  |  421303 |       9 | usa        | xyz     |
| c103        | chiti         | devji    | chiti@gmail.com | payal compound    | 9879853452  |  421306 |      89 | bhandup    | mumbai  |
| c104        | depu          | naka     | depu@gmail.com  | narayan compound  | 9835574328  |  421305 |      80 | delhi      | opl     |
+-------------+---------------+----------+-----------------+-------------------+-------------+---------+---------+------------+---------+
4 rows in set (0.00 sec)