Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.22 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> use payroll_service;
Database changed
mysql> SELECT DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT DATABASE();
+-----------------+
| DATABASE()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE employee_payroll
    -> (
    -> id     INT unsigned NOT NULL AUTO_INCREMENT,
    -> name   VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start  DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> DESCRIBE employee_payroll
    -> DESCRIBE employee_payroll;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIBE employee_payroll' at line 2
mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> INSERT INTO employee_payroll ( naeme, salary, start) VALUES
    -> INSERT INTO employee_payroll ( name, salary, start) VALUES
    -> ( 'Leena', 750000.00, '2020-09-16')
    -> ( 'Clev', 650000.00, '2020-08-10')
    -> ( 'Alex', 950000.00, '2020-06-10');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INSERT INTO employee_payroll ( name, salary, start) VALUES
( 'Leena', 750000.00,' at line 2
mysql> INSERT INTO employee_payroll ( name, salary, start) VALUES
    -> ( 'Leena', 750000.00, '2020-09-16'),
    -> ( 'Clev', 650000.00, '2020-08-10'),
    -> ( 'Alex', 950000.00, '2020-06-10');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELEC * FROM employee_payroll;     #UC4
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELEC * FROM employee_payroll' at line 1
mysql> SELECT * FROM employee_payroll;     #UC4
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | Leena | 750000 | 2020-09-16 |
|  2 | Clev  | 650000 | 2020-08-10 |
|  3 | Alex  | 950000 | 2020-06-10 |
+----+-------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT salary FROM employee_payroll WHERE name = 'Leena';     #UC5
+--------+
| salary |
+--------+
| 750000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll;     #UC5
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | Leena | 750000 | 2020-09-16 |
|  2 | Clev  | 650000 | 2020-08-10 |
|  3 | Alex  | 950000 | 2020-06-10 |
+----+-------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE
    -> SELECT * FROM employee_payroll;     #UC5
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM employee_payroll' at line 2
mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2020-08-01' AS DATE) AND DATE(NOW());     #UC5
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | Leena | 750000 | 2020-09-16 |
|  2 | Clev  | 650000 | 2020-08-10 |
+----+-------+--------+------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> update employee_payroll set gender = 'F' where name = 'Leena';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELEC * FROM employee_payroll;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELEC * FROM employee_payroll' at line 1
mysql> SELECT * FROM employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | Leena | F      | 750000 | 2020-09-16 |
|  2 | Clev  | NULL   | 650000 | 2020-08-10 |
|  3 | Alex  | NULL   | 950000 | 2020-06-10 |
+----+-------+--------+--------+------------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set gender = 'M' where name = 'Alex' or name = 'Clev';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | Leena | F      | 750000 | 2020-09-16 |
|  2 | Clev  | M      | 650000 | 2020-08-10 |
|  3 | Alex  | M      | 950000 | 2020-06-10 |
+----+-------+--------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|      800000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|      750000 |
|      800000 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| F      |      750000 |
| M      |      800000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| F      |           1 |
| M      |           2 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| F      |      750000 |
| M      |      800000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | SUM(salary) |
+--------+-------------+
| F      |      750000 |
| M      |     1600000 |
+--------+-------------+
2 rows in set (0.00 sec)