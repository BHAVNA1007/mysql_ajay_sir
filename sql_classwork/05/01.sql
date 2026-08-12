=======================================================
          AUTO_INCREMENT GAP:::::::::
=======================================================

There are several reason why gaps can occure.
1. if we perform deletw operation

student table
------------

1 deepika
2 rashmika
3 katapaa


delete id=2 ---------------------------rashmika
--------------
1 deepika
3 katapaa

insert... kiya
-------------
1 deepika
3 katapaa
4 kiya

---------------------------------------
2. the deleted value will never  reused automatically
--------------------------------------


===========================
     INSERT IGNORE : 
===========================


It is the variation of the insert statement in mysql
that attempts to insert new records into a table .

if an inserted row voilates certain constraints then mysql ignores 
that row instead of generating an error and continue proccessing the remaining rows.

in many real word situations such as importing large data sets 
csv files, duplicate records may already exists in the database.  


REAL EXPERIMENT::::::::
----------------------------------------------------------------


mysql> select * from pyemployee;
+-------+----------+-----------+
| empid | name     | salary    |
+-------+----------+-----------+
|   101 | deepika  | 500000.00 |
|   102 | rashmika |  70000.00 |
+-------+----------+-----------+
2 rows in set (0.03 sec)

mysql> insert into pyemployee values(102, "kiya",80000);
ERROR 1062 (23000): Duplicate entry '102' for key 'pyemployee.PRIMARY'


mysql> insert ignore into pyemployee values(102, "kiya", 80000);
Query OK, 0 rows affected, 1 warning (0.00 sec)


mysql> select * from pyemployee;

+-------+----------+-----------+
| empid | name     | salary    |
+-------+----------+-----------+
|   101 | deepika  | 500000.00 |
|   102 | rashmika |  70000.00 |
+-------+----------+-----------+
2 rows in set (0.00 sec)



CORRECT:::::::::::::::


mysql> insert into pyemployee values(103, "kiya",80000);
Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee;

+-------+----------+-----------+
| empid | name     | salary    |
+-------+----------+-----------+
|   101 | deepika  | 500000.00 |
|   102 | rashmika |  70000.00 |
|   103 | kiya     |  80000.00 |
+-------+----------+-----------+
3 rows in set (0.00 sec)

--------------------------------------------------------------------

============================================================
         INSERT ON DUPLICATE KEY UPDATE:::::::::
============================================================


Insert on duplicate key update is a mysql specific extention
of the insert statment that allow you to insert a now record
into a table. 

If the inserted row volited pk or unique key constaints then
mysql updates the exixting record inseat og generationg an error.



mysql> insert into pyemployee values(101, 'dipu', 70000) on duplicate key update name ='bahubali', salary = 8700;
Query OK, 2 rows affected (0.03 sec)

mysql> select * from pyemployee;

+-------+----------+----------+
| empid | name     | salary   |
+-------+----------+----------+
|   101 | bahubali |  8700.00 |
|   102 | rashmika | 70000.00 |
|   103 | kiya     | 80000.00 |
+-------+----------+----------+
3 rows in set (0.00 sec)


mysql> insert into pyemployee values(104, 'dipu', 70000) on duplicate key update name ='bahubali', salary = 8700;
Query OK, 1 row affected (0.01 sec)


mysql> select * from pyemployee;

+-------+----------+----------+
| empid | name     | salary   |
+-------+----------+----------+
|   101 | bahubali |  8700.00 |
|   102 | rashmika | 70000.00 |
|   103 | kiya     | 80000.00 |
|   104 | dipu     | 70000.00 |
+-------+----------+----------+
4 rows in set (0.00 sec)


============================================================
         SHOW CREATE TABLE tablename in my sql::::::
============================================================

it is a mysql command use to desplay the exact sql statement.
that was use to create an existing table it shows the complite
table structure.


mysql> desc pyemployee;

+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| empid  | int           | NO   | PRI | NULL    |       |
| name   | varchar(22)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.03 sec)



mysql> show create table pyemployee;

+------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table      | Create Table                                                                                                                                                                                                             |
+------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| pyemployee | CREATE TABLE `pyemployee` (
  `empid` int NOT NULL,
  `name` varchar(22) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)


============================================================
         TRUNCATE command :::::::: DDL 
============================================================

TRUNCATE is use to remove all rows from a table at once.

SYNTAX:::    truncate table tablename


EXPERIMENT::::::::::::::::::::::::
------------------------------------


mysql> select * from pyemployee;

+-------+----------+----------+
| empid | name     | salary   |
+-------+----------+----------+
|   101 | bahubali |  8700.00 |
|   102 | rashmika | 70000.00 |
|   103 | kiya     | 80000.00 |
|   104 | dipu     | 70000.00 |
+-------+----------+----------+
4 rows in set (0.00 sec)


mysql> truncate table pyemployee;
Query OK, 0 rows affected (0.08 sec)


mysql> select * from pyemployee;
Empty set (0.00 sec)


mysql> desc pyemployee;

+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| empid  | int           | NO   | PRI | NULL    |       |
| name   | varchar(22)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


====================================================================
          WHY TRUNCATE IS CONSIDARD AS A DDL ?????
====================================================================

Truncate is considard as ddl because is treated as table level
structural not as a row by row dml operation.

it operates at the table level and dealocates / resetes the
tables data storage rather than proccessing indivdual row like 
delete.


------------------------------------------
mysql> select * from  pystd;
+-----+-------+-------+
| sid | subid | marks |
+-----+-------+-------+
| 101 |   501 |    98 |
| 101 |   502 |    80 |
| 201 |   501 |    93 |
+-----+-------+-------+
3 rows in set (0.02 sec)


mysql> truncate table  pystd where sid = 2;   ///invalid

ERROR 1064 (42000): You have an error in your SQL syntax; 
check the manual that corresponds to your MySQL server
version for the right syntax to use near 'where sid = 2' at line 1

-----------------------------------------

truncate dose not accept where clause

truncate dose not delete table structure.

--------------------------------------

NOTE::: 

truncate command resets AUTO_INCREMENT value . 
(but incase of delete does not normally reset AUTO_INCREMENT)


mysql> create table pytruncate(id int primary key auto_increment, name varchar(20));
Query OK, 0 rows affected (0.05 sec)



mysql> desc pytruncate;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(20) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)


Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select * from pytruncate;
+----+----------+
| id | name     |
+----+----------+
|  1 | deepika  |
|  2 | rashmika |
|  3 | vaibhav  |
+----+----------+
3 rows in set (0.00 sec)


mysql> truncate pytruncate;
Query OK, 0 rows affected (0.04 sec)



mysql> select * from pytruncate;
Empty set (0.00 sec)



mysql> insert into pytruncate(name) values('deepika');
Query OK, 1 row affected (0.01 sec)



mysql> select * from pytruncate;
+----+---------+
| id | name    |
+----+---------+
|  1 | deepika |
+----+---------+
1 row in set (0.00 sec)


==================================================
        WHEN WE HAVE TO USE TRUNCATE:::::::
==================================================

when we do not need any existing rows.

when table is temporary table.

truncate is faster then delete.

truncate and transactions : truncate table cause an implicite 
commite and cannot be rolled back like DML.

truncate and trigars : truncate command does not fire delete trigars.
=========================================


+++++++++++++++++++++++++++

topics on hold : we will cover it later

truncate VS delete
truncate VS drop
table VS foregin key

+++++++++++++++++++++++++++



=====================================
          ALTER COMMAND
=====================================








