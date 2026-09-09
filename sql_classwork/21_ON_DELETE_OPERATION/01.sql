
mysql> select * from employee18;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      2 |
--|   103 | thapaji  |      3 |
--|   104 | kanak    |      1 |
--|   105 | katappa  |   NULL |
--+-------+----------+--------+
--5 rows in set (0.07 sec)



mysql> select * from department18;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | hr       |
--|      2 | it       |
--|      3 | finance  |
--+--------+----------+
--3 rows in set (0.02 sec)



mysql> delete from department18 where deptid = 1;

--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`batch18`.`employee18`, CONSTRAINT `employee18_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department18` (`deptid`))



in the above query mysql will not allow deletion because employee 102, 104 are still referencing department 1. 


without on delete means do not allow deletion of the parent row if child rows are refering to it.


ON DELETE IN MYSQL:
===================

syntx:
======

create table employee(.....,foreign key(childcolumn) references parenttable(parentcolumn) on delete action)

for mysql the actions are :
===========================

1. cascade
2. restrict
3. no action
4. set null

***************************************************************

on delete cascade:
===================

if the parent record is deleted automatically delete the related child records. 



mysql> create table department183(deptid int primary key, deptname varchar(20));
--Query OK, 0 rows affected (0.07 sec)


mysql> create table employee183(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department183(deptid) on delete cascade);
--Query OK, 0 rows affected (0.05 sec)

mysql> insert into department183 values(1, 'cs');
--Query OK, 1 row affected (0.01 sec)

mysql> insert into employee183 values(101, 'deepika', 1);
--Query OK, 1 row affected (0.01 sec)

mysql> insert into employee183 values(102, 'rashmika', 1);
--Query OK, 1 row affected (0.01 sec)

mysql> select * from department183;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | cs       |
--+--------+----------+
--1 row in set (0.00 sec)


mysql> select * from employee183;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)



mysql> delete from department183 where deptid = 1;
--Query OK, 1 row affected (0.01 sec)


mysql> select * from department183;
--Empty set (0.00 sec)


mysql> select * from employee183;
--Empty set (0.00 sec)



***************************************************************

ON DELETE RESTRICT:
===================

Means do not allow the parent record to deleted if child records are using it. 


mysql> create table department184(deptid int primary key, deptname varchar(20));
--Query OK, 0 rows affected (0.03 sec)


mysql> insert into department184 values(1, 'cs');
--Query OK, 1 row affected (0.01 sec)


mysql> select * from department184;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | cs       |
--+--------+----------+
--1 row in set (0.00 sec)



mysql> create table employee184(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department184(deptid) on delete restrict);
--Query OK, 0 rows affected (0.05 sec)



mysql> insert into employee184 values(101, 'deepika', 1);
--Query OK, 1 row affected (0.03 sec)


mysql> insert into employee184 values(102, 'rashmika', 1);
--Query OK, 1 row affected (0.01 sec)


mysql> select * from employee184;

-- +-------+----------+--------+
-- | empid | empname  | deptid |
-- +-------+----------+--------+
-- |   101 | deepika  |      1 |
-- |   102 | rashmika |      1 |
-- +-------+----------+--------+
-- 2 rows in set (0.00 sec)


mysql> delete from department184 where deptid = 1;
--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`batch18`.`employee184`, CONSTRAINT `employee184_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department184` (`deptid`) ON DELETE RESTRICT)


MySQL says:
================

I cannot delete department 1 because an employee is still referencing it.

Thats the meaning of RESTRICT.

ON DELETE RESTRICT = Do not allow deletion of the parent if a child is using it.

***************************************************************

ON DELETE NO ACTION:
====================

Do not take any automatic action to remove or change the child row.

if you don't write any ON DELETE clause, MySQL's default is effectively NO ACTION/RESTRICT behavior.

mysql> insert into department185 values(1, 'cs');
--Query OK, 1 row affected (0.01 sec)


mysql> select * from department185;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | cs       |
--+--------+----------+
--1 row in set (0.00 sec)



mysql> create table employee185(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department185(deptid) on delete NO ACTION);
--Query OK, 0 rows affected (0.05 sec)



mysql> insert into employee185 values(101, 'deepika', 1);
--Query OK, 1 row affected (0.01 sec)



mysql> insert into employee185 values(102, 'rashmika', 1);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from employee185;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)



mysql> delete from department185 where deptid = 1;
--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`batch18`.`employee185`, CONSTRAINT `employee185_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department185` (`deptid`))


In MySQL, NO ACTION is effectively the same as RESTRICT because the constraint is checked immediately.

***************************************************************

ON DELETE SET NULL:
===================

When the parent row is deleted, set the corresponding foreign-key values in the child table to NULL instead of deleting the child rows.


mysql> create table department186(deptid int primary key, deptname varchar(20));
--Query OK, 0 rows affected (0.03 sec)



mysql> insert into department186 values(1, 'cs');
--Query OK, 1 row affected (0.01 sec)



mysql> select * from department186;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | cs       |
--+--------+----------+
--1 row in set (0.00 sec)


mysql> create table employee186(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department186(deptid) on delete SET NULL);
--Query OK, 0 rows affected (0.04 sec)


mysql> insert into employee186 values(101, 'deepika', 1);
--Query OK, 1 row affected (0.01 sec)


mysql> insert into employee186 values(102, 'rashmika', 1);
--Query OK, 1 row affected (0.01 sec)


mysql> select * from employee186;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)



mysql> DELETE FROM department186 where deptid = 1;
--Query OK, 1 row affected (0.01 sec)


The parent department was deleted successfully

mysql> select * from department186;
--Empty set (0.00 sec)


mysql> select * from employee185;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)


mysql> select * from employee186;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |   NULL |
--|   102 | rashmika |   NULL |
--+-------+----------+--------+
--2 rows in set (0.00 sec)

And MySQL automatically changed the referencing child values.