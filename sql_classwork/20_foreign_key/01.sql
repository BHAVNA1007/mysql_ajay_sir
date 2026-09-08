
FOREGIN key:
============

A FOREGIN key is a column combination of columns in one table that references a candidate key normaly a primary key or unique key in another table.



mysql> create table department(deptid int primary key, dname varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> create table employee(empid int primary key, empname varchar(20), deptid int, foreign key (deptid) references department(deptid));
Query OK, 0 rows affected (0.05 sec)

mysql> desc department;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| deptid | int         | NO   | PRI | NULL    |       |
| dname  | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> desc employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empid   | int         | NO   | PRI | NULL    |       |
| empname | varchar(20) | YES  |     | NULL    |       |
| deptid  | int         | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into department values(1, 'kiya'), (2, 'piya'), (3, 'siya');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from department;
+--------+-------+
| deptid | dname |
+--------+-------+
|      1 | kiya  |
|      2 | piya  |
|      3 | siya  |
+--------+-------+
3 rows in set (0.00 sec)

mysql> insert into employee values(101, 'deepika', 1), (102, 'rashmika', 2), (103, 'katappa', 1);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------+----------+--------+
| empid | empname  | deptid |
+-------+----------+--------+
|   101 | deepika  |      1 |
|   102 | rashmika |      2 |
|   103 | katappa  |      1 |
+-------+----------+--------+
3 rows in set (0.00 sec)

its main perpose to maintain referencial intigrety between related tables.


mysql> insert into employee values(104, 'bahubali', 10);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pk`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`))


the above query voilated the referencial intigrity.


parent table and child table 


1. parent table : (owner table)
=================

the table containing the refferenced key is called parent table.


mysql> select * from department;
+--------+-------+
| deptid | dname |
+--------+-------+
|      1 | kiya  |
|      2 | piya  |
|      3 | siya  |
+--------+-------+
3 rows in set (0.00 sec)

in our example department  table  is a parent table.


Child table:
=============

table containig the foreign key is called child table  . 


mysql> select * from employee;
+-------+----------+--------+
| empid | empname  | deptid |
+-------+----------+--------+
|   101 | deepika  |      1 |
|   102 | rashmika |      2 |
|   103 | katappa  |      1 |
+-------+----------+--------+
3 rows in set (0.00 sec)

in our example employee table is child table.



example tables 
cutomer table and orders table: 
==============================
example tables

cutomer table
=============

mysql> create table customer(cust_id int primary key, cname varchar(20), email varchar(100));
Query OK, 0 rows affected (0.04 sec)


mysql> desc customer;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| cust_id | int          | NO   | PRI | NULL    |       |
| cname   | varchar(20)  | YES  |     | NULL    |       |
| email   | varchar(100) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> insert into customer values(101, 'depu', 'depu@gmail.com'), (102, 'rashmika', 'rashmika@gmail.com');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0


mysql> select * from customer;
+---------+----------+--------------------+
| cust_id | cname    | email              |
+---------+----------+--------------------+
|     101 | depu     | depu@gmail.com     |
|     102 | rashmika | rashmika@gmail.com |
+---------+----------+--------------------+
2 rows in set (0.00 sec)



orders table
============

mysql> create table orders(oid int primary key, order_name varchar(20), amount decimal(10,2), cust_id int, foreign key (cust_id) references customer(cust_id));
Query OK, 0 rows affected (0.04 sec)

mysql> desc orders;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| oid        | int           | NO   | PRI | NULL    |       |
| order_name | varchar(20)   | YES  |     | NULL    |       |
| amount     | decimal(10,2) | YES  |     | NULL    |       |
| cust_id    | int           | YES  | MUL | NULL    |       |
+------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> insert into orders values(9999, 'laptop', 50000, 101), (1111, 'mobile', 3000, 101);

Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+------+------------+----------+---------+
| oid  | order_name | amount   | cust_id |
+------+------------+----------+---------+
| 1111 | mobile     |  3000.00 |     101 |
| 9999 | laptop     | 50000.00 |     101 |
+------+------------+----------+---------+
2 rows in set (0.00 sec)


ADVANTAGES OF FK:

maintains refferencial interity :
=================================
a fk insures that a value in the child table must currespond to an existing value in the parent table. 


PREVENTS INVALID DATA:
======================
It stops users from inserting unrelated or invalid ids into the child table 

IT MAINTAINS RELATIONSHIPS BETWEEN TWO TABLES:
==============================================

PREVENTS ORPHAN RECORDS:
======================
IS a child record whose parent no longer exists.

IT CONTROLS DELETE OPERATION:
=============================

IT CONTROLS UPDATE OPERATIONS:
==============================

IT MAKES DATABASE DESIGN MORE RELAIABLE:
========================================

SYNTAX:

CREATE TABLE PARENT_TABLE(id INT PRIMARY KEY)

CREATE TABLE CHILD_TABLE(id INT PRIMARY KEY,
 parentid int, foreign key(parentid) refferences parenttable(id))



 mysql> create table department18(deptid int primary key, deptname varchar(20));
Query OK, 0 rows affected (0.13 sec)

mysql> desc department18;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptid   | int         | NO   | PRI | NULL    |       |
| deptname | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.04 sec)


mysql> CREATE TABLE employee18 (
    ->     empid INT PRIMARY KEY,
    ->     empname VARCHAR(20),
    ->     deptid INT,
    ->     FOREIGN KEY (deptid) REFERENCES department18(deptid)
    -> );
Query OK, 0 rows affected (0.08 sec)




mysql> desc employee18;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empid   | int         | NO   | PRI | NULL    |       |
| empname | varchar(20) | YES  |     | NULL    |       |
| deptid  | int         | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into department18 values(1, 'hr'), (2, 'it'), (3, 'finance');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from department18;
+--------+----------+
| deptid | deptname |
+--------+----------+
|      1 | hr       |
|      2 | it       |
|      3 | finance  |
+--------+----------+
3 rows in set (0.00 sec)

mysql> insert into employee18 values(101, 'deepika', 1), (102, 'rashmika', 2), (103, 'thapaji', 3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee18;
+-------+----------+--------+
| empid | empname  | deptid |
+-------+----------+--------+
|   101 | deepika  |      1 |
|   102 | rashmika |      2 |
|   103 | thapaji  |      3 |
+-------+----------+--------+
3 rows in set (0.00 sec)




mysql> insert into employee18 values(104, 'kanak', 5);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`batch18`.`employee18`, CONSTRAINT `employee18_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department18` (`deptid`))



THE above query givs error because department id 5 is not available in department.


mysql> insert into employee18 values(104, 'kanak', 1);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee18;
+-------+----------+--------+
| empid | empname  | deptid |
+-------+----------+--------+
|   101 | deepika  |      1 |
|   102 | rashmika |      2 |
|   103 | thapaji  |      3 |
|   104 | kanak    |      1 |
+-------+----------+--------+
4 rows in set (0.00 sec)


we can have duplicate value in fk.

foregin key dose not mean value must be unique. it can have duplicate values. 

mysql> insert into employee18(empid, empname) values(105, 'katappa');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee18;
+-------+----------+--------+
| empid | empname  | deptid |
+-------+----------+--------+
|   101 | deepika  |      1 |
|   102 | rashmika |      2 |
|   103 | thapaji  |      3 |
|   104 | kanak    |      1 |
|   105 | katappa  |   NULL |
+-------+----------+--------+
5 rows in set (0.00 sec)



NOTE : foregin key can contain null value bydefault. because null is not equal to invalid department . it means in our example the employee currently has no department value.





create table employee18(empid..., empname..., deptid int not null, foreign key.....)


foregin key vs primary key
===========================


primary key: uniquly identify a row
fk: references a key in another table.

pk : can not contain null
fk : it can contain null bydefault 

pk : one pk constraint per table possible.

fk : multiple fk constraint per table possible.

pk : it prevents duplicate entry.
fk : it allow duplicates bydeafult

pk : it identify any entity.
fk : it maintains  or stablish relationship 



fk refferencing uk:


mysql> create table department181(deptid int primary key, deptcode varchar(20) unique);
Query OK, 0 rows affected (0.05 sec)

mysql> create table employee181(empid int primary key, empname varchar(20), dcode varchar(20), foreign key(dcode) references department181(deptcode));
Query OK, 0 rows affected (0.06 sec)

mysql> select * from employee181;
Empty set (0.00 sec)

mysql> desc employee181;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empid   | int         | NO   | PRI | NULL    |       |
| empname | varchar(20) | YES  |     | NULL    |       |
| dcode   | varchar(20) | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc department181;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptid   | int         | NO   | PRI | NULL    |       |
| deptcode | varchar(20) | YES  | UNI | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into department181 values(1, 'IT111');
Query OK, 1 row affected (0.01 sec)

mysql> insert into department181 values(2, 'CS123');
Query OK, 1 row affected (0.01 sec)

mysql> select * from department181;
+--------+----------+
| deptid | deptcode |
+--------+----------+
|      2 | CS123    |
|      1 | IT111    |
+--------+----------+
2 rows in set (0.00 sec)

mysql> insert into employee181 values(101, 'deepika', 'CS123');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee181;
+-------+---------+-------+
| empid | empname | dcode |
+-------+---------+-------+
|   101 | deepika | CS123 |
+-------+---------+-------+
1 row in set (0.00 sec)

mysql> insert into employee181 values(101, 'deepika', 1);

ERROR 1062 (23000): Duplicate entry '101' for key 'employee181.PRIMARY'


mysql> create table tt1(id int not null);
Query OK, 0 rows affected (0.03 sec)



mysql> CREATE TABLE tt2 (
    ->     tid INT PRIMARY KEY,
    ->     id INT NOT NULL,
    ->     FOREIGN KEY (id) REFERENCES tt1(id)
    -> );

    ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'tt2_ibfk_1' in the referenced table 'tt1'



NAMING A FOREGIN KEY:
=====================

When we create a foregin key we can give the foregin key constraint a name.

That name helps us to identify the relationship between two tables eassily.


contraint constraintname foregin key(column name) references parenttable(parent column)



mysql> create table department182(deptid int primary key, deptcode varchar(20) unique);
Query OK, 0 rows affected (0.06 sec)

mysql> create table employee182(empid int primary key, empname varchar(20), dcode varchar(20), constraint fk_employee182_department182 foreign key(dcode) references department182(deptcode));
Query OK, 0 rows affected (0.05 sec)

mysql> desc employee182;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empid   | int         | NO   | PRI | NULL    |       |
| empname | varchar(20) | YES  |     | NULL    |       |
| dcode   | varchar(20) | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc department182;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptid   | int         | NO   | PRI | NULL    |       |
| deptcode | varchar(20) | YES  | UNI | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into employee182 values(109, 'deepika', 'cs1234');
ERROR 

mysql> alter table employee182 drop foreign key  fk_employee182_department182;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee182 values(109, 'deepika', 'cs1234');
Query OK, 1 row affected (0.01 sec)












***************************************************************
MULTIPLE FOREIGN KEY IN A TABLE:
================================

mysql> create table doctor(d_id int primary key, d_name varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> create table pateint(p_id int primary key, p_name varchar(20));
Query OK, 0 rows affected (0.03 sec)


mysql> create table appointment(ap_id int primary key, d_id int,constraint fk_docter_app foreign key (d_id) references doctor (d_id), p_id int, constraint fk_pateint_app  foreign key (p_id) references pateint (p_id));
Query OK, 0 rows affected (0.06 sec)

mysql> desc  doctor;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| d_id   | int         | NO   | PRI | NULL    |       |
| d_name | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> desc  pateint;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| p_id   | int         | NO   | PRI | NULL    |       |
| p_name | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc appointment;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| ap_id | int  | NO   | PRI | NULL    |       |
| d_id  | int  | YES  | MUL | NULL    |       |
| p_id  | int  | YES  | MUL | NULL    |       |
+-------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

