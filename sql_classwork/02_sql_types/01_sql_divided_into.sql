SQL DIVIDED INTO :


1. DDL
2. DML
3. DQL
4. DCL
5. TCL


--07-08-2026

create databases

mysql> create database batch18;
--Query OK, 1 row affected (0.03 sec)




mysql> show databases;
--+--------------------+
--| Database           |
--+--------------------+
--| batch18            |
--| college            |
--| dbms1              |
--| delta_app          |
--| foodstore          |
--| information_schema |
--| mysql              |
--| performance_schema |
--| sakila             |
--| startersql         |
--| sys                |
--| world              |
--+--------------------+
--12 rows in set (0.04 sec)




mysql> create database batch18;
--ERROR 1007 (HY000): Can't create database 'batch18'; database exists



mysql> create database if not exists batch18;
--Query OK, 1 row affected, 1 warning (0.02 sec)


mysql> use batch18;
--Database changed


mysql> select database();
--+------------+
--| database() |
--+------------+
--| batch18    |
--+------------+
--1 row in set (0.00 sec)


mysql> create database if not exists newone;
--Query OK, 1 row affected (0.01 sec)



mysql> use newone;
--Database changed



mysql> select database();
--+------------+
--| database() |
--+------------+
--| newone     |
--+------------+
--1 row in set (0.00 sec)



mysql> drop database newone;
--Query OK, 0 rows affected (0.05 sec)



mysql> use newone;
--ERROR 1049 (42000): Unknown database 'newone'

mysql> drop database newone;
--ERROR 1008 (HY000): Can't drop database 'newone'; database doesn't exist



mysql> drop database if exists newone;
--Query OK, 0 rows affected, 1 warning (0.02 sec)




mysql> select database;
--ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1



mysql> select database();
--+------------+
--| database() |
--+------------+
--| NULL       |
--+------------+
--1 row in set (0.00 sec)




mysql> use batch18;
--Database changed



mysql> create table student(id int, name varchar(20), age int);
--Query OK, 0 rows affected (0.07 sec)




mysql> desc student;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | YES  |     | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--| age   | int         | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--3 rows in set (0.01 sec)





mysql> show tables;
--+-------------------+
--| Tables_in_batch18 |
--+-------------------+
--| student           |
--+-------------------+
--1 row in set (0.03 sec)




mysql> create table A(A int);
--Query OK, 0 rows affected (0.03 sec)




mysql> desc A;
--+-------+------+------+-----+---------+-------+
--| Field | Type | Null | Key | Default | Extra |
--+-------+------+------+-----+---------+-------+
--| A     | int  | YES  |     | NULL    |       |
--+-------+------+------+-----+---------+-------+
--1 row in set (0.02 sec)





mysql> show tables;
--+-------------------+
--| Tables_in_batch18 |
--+-------------------+
--| a                 |
--| student           |
--+-------------------+
--2 rows in set (0.00 sec)




mysql> select * from batch18;
--ERROR 1146 (42S02): Table 'batch18.batch18' doesn't exist
--mysql> select * from a;
--Empty set (0.03 sec)




mysql> select * from A;
--Empty set (0.00 sec)




mysql> create table student1(id int primary key, name varchar(20), age int);
--Query OK, 0 rows affected (0.05 sec)




mysql> desc student1;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | NO   | PRI | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--| age   | int         | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)




mysql> create table employee as select * from student;
--Query OK, 0 rows affected (0.04 sec)
--Records: 0  Duplicates: 0  Warnings: 0





mysql> desc employee;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | YES  |     | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--| age   | int         | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--3 rows in set (0.02 sec)




mysql> create table emp1 as select * from student1;
--Query OK, 0 rows affected (0.06 sec)
--Records: 0  Duplicates: 0  Warnings: 0





mysql> desc emp1;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | NO   |     | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--| age   | int         | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)





mysql> create table emp2 as select id, name from student;
--Query OK, 0 rows affected (0.05 sec)
--Records: 0  Duplicates: 0  Warnings: 0




mysql> desc emp2;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | YES  |     | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--2 rows in set (0.00 sec)




mysql> create table emp3 as select * from student where 1=2;
--Query OK, 0 rows affected (0.05 sec)
--Records: 0  Duplicates: 0  Warnings: 0




mysql> insert into student values(101, "Bhavna", 30);
--Query OK, 1 row affected (0.01 sec)





mysql> select * from student;
--+------+--------+------+
--| id   | name   | age  |
--+------+--------+------+
--|  101 | Bhavna |   30 |
--+------+--------+------+
--1 row in set (0.00 sec)





mysql> create table t1 as select * from student;
--Query OK, 1 row affected (0.05 sec)
--Records: 1  Duplicates: 0  Warnings: 0




mysql> select * from t1;
--+------+--------+------+
--| id   | name   | age  |
--+------+--------+------+
--|  101 | Bhavna |   30 |
--+------+--------+------+
--1 row in set (0.00 sec)
--create tables




mysql> create table t2 as select * from student where 1=2;
--Query OK, 0 rows affected (0.05 sec)
--Records: 0  Duplicates: 0  Warnings: 0




mysql> select * from t2;
--Empty set (0.00 sec)
