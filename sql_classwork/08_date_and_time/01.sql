date and time: 
*******************
mysql provides following date and time data types:

DATE : it will store date only ---  2026-08-13

TIME : it will store time only --- 14:30:45

DATETIME : date + time  2026-08-13  14:30:45

TIMESTAMP : date + time

YEAR : it will store year only.


DATE:
******

date stores only the date.

formate:  yyyy-mm-dd

use date when time is not required like date of birth, joining dates, invoice date,
order date etc.

TIME : 
******
formate hh-mm-ss

starttime 09:30:89


DATE + TIME: 
***************
formate: yyyy-mm-dd hh:mm:ss

Timestamp: it also stores date + time. one of its mejore advantage is that is can work with mysqls automatic current time features.

CREATE TABLE employeedt1(
    id INT,
    name VARCHAR(20),
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

NOTE:   CURRENT_TIMESTAMP returns current date and time.



datetime vs timestamp:
***********************

both can store date and time
date time stores date and time valuse as given it does not perform automatic time zone conversion

but 

in timestamp mysql converts timestamp values between the session time zone.

on update current_timestamp:this is useful for tracing when a row was last modified.


YEAR:
******
it stores only year.

Formate: yyyy-mm-dd 


boolean in mysql:
*****************

it is used when a column should represent a true false condition.

in mysql boolean and bool for synonyms for tinyint(1) mysql does not provide a separate boolean numeric storage type.

NOTE: in tinyint(1): here 1 historically represent diplay width not storage size or restriction to values 0 and 1. 




--------------------------------------
binary datatypes will be coverd later
--------------------------------------




mysql> use batch18;
Database changed


DATE:
******

date stores only the date.

formate:  yyyy-mm-dd

use date when time is not required like date of birth, joining dates, invoice date,
order date etc.



mysql> create table employeedt(id int, name varchar(20), birthdate date);
Query OK, 0 rows affected (0.09 sec)



mysql> desc employeedt;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int         | YES  |     | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| birthdate | date        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)



mysql> insert into employeedt values(101, 'deepika', '1978-08-13');
Query OK, 1 row affected (0.02 sec)



mysql> select * from employeedt;
+------+---------+------------+
| id   | name    | birthdate  |
+------+---------+------------+
|  101 | deepika | 1978-08-13 |
+------+---------+------------+
1 row in set (0.00 sec)


TIME : 
******
formate hh-mm-ss

starttime 09:30:89


mysql> create table clsschedule(cls_id int, cls_name varchar(20), starttime time);
Query OK, 0 rows affected (0.03 sec)



mysql> desc clsschedule;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| cls_id    | int         | YES  |     | NULL    |       |
| cls_name  | varchar(20) | YES  |     | NULL    |       |
| starttime | time        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> insert into clsschedule values(50001, 'java', '09:30:39');
Query OK, 1 row affected (0.01 sec)



mysql> select * from  clsschedule;
+--------+----------+-----------+
| cls_id | cls_name | starttime |
+--------+----------+-----------+
|  50001 | java     | 09:30:39  |
+--------+----------+-----------+
1 row in set (0.00 sec)



DATE + TIME: 
***************
formate: yyyy-mm-dd hh:mm:ss

Timestamp: it also stores date + time. one of its mejore advantage is that is can work with mysqls automatic current time features.

CREATE TABLE employeedt1(
    id INT,
    name VARCHAR(20),
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

NOTE:   CURRENT_TIMESTAMP returns current date and time.


mysql> create table appointment(apid int, custname varchar(20),aptime datetime);
Query OK, 0 rows affected (0.03 sec)



mysql> desc  appointment;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| apid     | int         | YES  |     | NULL    |       |
| custname | varchar(20) | YES  |     | NULL    |       |
| aptime   | datetime    | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> insert into  appointment values(111, 'rashmika', '2026-08-28 10:20:33');
Query OK, 1 row affected (0.01 sec)



mysql> select * from   appointment;
+------+----------+---------------------+
| apid | custname | aptime              |
+------+----------+---------------------+
|  111 | rashmika | 2026-08-28 10:20:33 |
+------+----------+---------------------+
1 row in set (0.00 sec)



mysql> CREATE TABLE employeedt1( id INT, name VARCHAR(20), createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.04 sec)


mysql> desc employeedt1;
+-----------+-------------+------+-----+-------------------+-------------------+
| Field     | Type        | Null | Key | Default           | Extra             |
+-----------+-------------+------+-----+-------------------+-------------------+
| id        | int         | YES  |     | NULL              |                   |
| name      | varchar(20) | YES  |     | NULL              |                   |
| createdat | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-----------+-------------+------+-----+-------------------+-------------------+
3 rows in set (0.00 sec)



mysql> insert into employeedt1(id, name) values(1001, 'bhavna');
Query OK, 1 row affected (0.01 sec)



mysql> select * from employeedt1;
+------+--------+---------------------+
| id   | name   | createdat           |
+------+--------+---------------------+
| 1001 | bhavna | 2026-08-18 10:04:01 |
+------+--------+---------------------+
1 row in set (0.00 sec)



datetime vs timestamp:
***********************

both can store date and time
date time stores date and time valuse as given it does not perform automatic time zone conversion

but 

in timestamp mysql converts timestamp values between the session time zone.


on update current_timestamp:
*****************************
this is useful for tracing when a row was last modified.


mysql> create table employeedt2(id int, name varchar(20), created_at timestamp default current_timestamp, updateat timestamp default current_timestamp on update  current_timestamp);
Query OK, 0 rows affected (0.03 sec)



mysql> desc employeedt2;
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type        | Null | Key | Default           | Extra                                         |
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
| id         | int         | YES  |     | NULL              |                                               |
| name       | varchar(20) | YES  |     | NULL              |                                               |
| created_at | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updateat   | timestamp   | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.00 sec)



mysql> insert into employeedt2(id, name) values(101, 'deepika');
Query OK, 1 row affected (0.01 sec)



mysql> select * from employeedt2;
+------+---------+---------------------+---------------------+
| id   | name    | created_at          | updateat            |
+------+---------+---------------------+---------------------+
|  101 | deepika | 2026-08-18 10:16:01 | 2026-08-18 10:16:01 |
+------+---------+---------------------+---------------------+
1 row in set (0.00 sec)



mysql> update employeedt2 set name='deepika padukon' where  id ='101';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from employeedt2;
+------+-----------------+---------------------+---------------------+
| id   | name            | created_at          | updateat            |
+------+-----------------+---------------------+---------------------+
|  101 | deepika padukon | 2026-08-18 10:16:01 | 2026-08-18 10:18:36 |
+------+-----------------+---------------------+---------------------+
1 row in set (0.00 sec)



YEAR:
******
it stores only year.

Formate: yyyy-mm-dd 


mysql> create table vhicle1(vid int, model varchar(20), mefyear year);
Query OK, 0 rows affected (0.03 sec)


mysql> desc vhicle1;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| vid     | int         | YES  |     | NULL    |       |
| model   | varchar(20) | YES  |     | NULL    |       |
| mefyear | year        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


boolean in mysql:
*****************

it is used when a column should represent a true false condition.

in mysql boolean and bool for synonyms for tinyint(1) mysql does not provide a separate boolean numeric storage type.

NOTE: in tinyint(1): here 1 historically represent diplay width not storage size or restriction to values 0 and 1. 


mysql> create table employeedt3(id int, name varchar(20), is_active boolean);
Query OK, 0 rows affected (0.03 sec)


mysql> desc employeedt3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int         | YES  |     | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| is_active | tinyint(1)  | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> insert into employeedt3 values(101,'deepika', True);
Query OK, 1 row affected (0.01 sec)


mysql> insert into employeedt3 values(102,'deepika', False);
Query OK, 1 row affected (0.01 sec)



mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
+------+---------+-----------+
2 rows in set (0.00 sec)


mysql> insert into employeedt3 values(102,'deepika', false);
Query OK, 1 row affected (0.01 sec)


mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
|  102 | deepika |         0 |
+------+---------+-----------+
3 rows in set (0.00 sec)


mysql> insert into employeedt3 values(103,'deepika', 1);
Query OK, 1 row affected (0.01 sec)


mysql> insert into employeedt3 values(104,'deepika', 15);
Query OK, 1 row affected (0.01 sec)


mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
|  102 | deepika |         0 |
|  103 | deepika |         1 |
|  104 | deepika |        15 |
+------+---------+-----------+
5 rows in set (0.00 sec)





****************************************************************
mysql> create table employeedt3(id int, name varchar(20), is_active boolean);
Query OK, 0 rows affected (0.03 sec)

mysql> desc employeedt3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int         | YES  |     | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| is_active | tinyint(1)  | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into employeedt3 values(101,'deepika', True);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employeedt3 values(102,'deepika', False);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
+------+---------+-----------+
2 rows in set (0.00 sec)

mysql> insert into employeedt3 values(102,'deepika', false);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
|  102 | deepika |         0 |
+------+---------+-----------+
3 rows in set (0.00 sec)

mysql> insert into employeedt3 values(103,'deepika', 1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employeedt3 values(104,'deepika', 15);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeedt3;
+------+---------+-----------+
| id   | name    | is_active |
+------+---------+-----------+
|  101 | deepika |         1 |
|  102 | deepika |         0 |
|  102 | deepika |         0 |
|  103 | deepika |         1 |
|  104 | deepika |        15 |
+------+---------+-----------+
5 rows in set (0.00 sec)

