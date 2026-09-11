diff cascade vs set null:
=========================

Both are referential actions used with a FOREIGN KEY when a row in the parent table is updated or deleted.

| Point                        | `ON DELETE CASCADE`                        | `ON DELETE SET NULL`                                        |
| ---------------------------- | ------------------------------------------ | ----------------------------------------------------------- |
| Meaning                      | Delete the related child row automatically | Set the child’s foreign-key value to `NULL`                 |
| Effect on child row          |     Child row is deleted                   | Child row remains                                           |
| Foreign key value            | Removed along with the row                 | Changed to `NULL`                                           |
| FK column must allow `NULL`? | No                                         | Yes                                                         |
| Best when                    | Child record has no meaning without parent | Child record can exist without parent                       |
| Example                      | Delete a department → delete its employees | Delete a manager → employees remain but `manager_id = NULL` |


on update:
==========

mysql> select * from employee18;

--+-------+---------+--------+
--| empid | empname | deptid |
--+-------+---------+--------+
--|   101 | deepika |      1 |
--|   103 | thapaji |      3 |
--|   104 | kanak   |      1 |
--|   105 | katappa |   NULL |
--+-------+---------+--------+
--4 rows in set (0.04 sec)



mysql> select * from department18;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | hr       |
--|      3 | finance  |
--+--------+----------+
--2 rows in set (0.02 sec)



mysql> update department18 set deptid = 10 where deptid = 1;

--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`batch18`.`employee18`, CONSTRAINT `employee18_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `department18` (`deptid`))




NOTE: if we change department id and if child records are refering to it then bydefault it dose not allow to update.



mysql> update department18 set deptname = 'hr_IT' where deptid = 1;

--Query OK, 1 row affected (0.04 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from department18;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | hr_IT    |
--|      3 | finance  |
--+--------+----------+
--2 rows in set (0.00 sec)



on update cascade:
==================
if the referenced key in tha parent table changes automatically update the curresponding foreign key in the child table



mysql> create table department187(deptid int primary key, deptname varchar(20));

--Query OK, 0 rows affected (0.05 sec)



mysql> create table employee187(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department187(deptid) on update cascade);

--Query OK, 0 rows affected (0.05 sec)



mysql> insert into department187 values(1, 'HR'), (2, 'IT');

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> insert into employee187 values(101, 'deepika', 1),(102, 'rashmika', 1);

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> select * from  department187;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | HR       |
--|      2 | IT       |
--+--------+----------+
--2 rows in set (0.00 sec)



mysql> select * from employee187;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)




in the above example mysql automatically changes the child rowss.


on update set null:
===================
when the parent key changes set the corresponding child foreign key values to null.


mysql> create table department188(deptid int primary key, deptname varchar(20));

--Query OK, 0 rows affected (0.03 sec)



mysql> insert into department188 values(1, 'HR'), (2, 'IT');

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> create table employee188(empid int primary key, empname varchar(20), deptid int, foreign key(deptid) references department188(deptid) on update set null);

--Query OK, 0 rows affected (0.07 sec)



mysql> insert into employee188 values(101, 'deepika', 1),(102, 'rashmika', 1);

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> select * from  department188;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | HR       |
--|      2 | IT       |
--+--------+----------+
--2 rows in set (0.00 sec)




mysql> select * from employee188;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.00 sec)




mysql> update department188 set deptid = 10 where deptid = 1;

--Query OK, 1 row affected (0.02 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from  department188;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      2 | IT       |
--|     10 | HR       |
--+--------+----------+
--2 rows in set (0.00 sec)




mysql> select * from employee188;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |   NULL |
--|   102 | rashmika |   NULL |
--+-------+----------+--------+
--2 rows in set (0.00 sec)



*********************************************************
HW

HOW TO ADD FOREIGN KEY CONSTRAINT IF TABLES ARE ALREDY. CREATED.

mysql> create table department200(id int primary key, deptname varchar(20));
--Query OK, 0 rows affected (0.05 sec)


mysql> create table employee200(empid int primary key, empname varchar(20));
--Query OK, 0 rows affected (0.05 sec)

mysql> ALTER table employee200 add id int;
--Query OK, 0 rows affected (0.04 sec)
--Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee200;
--+---------+-------------+------+-----+---------+-------+
--| Field   | Type        | Null | Key | Default | Extra |
--+---------+-------------+------+-----+---------+-------+
--| empid   | int         | NO   | PRI | NULL    |       |
--| empname | varchar(20) | YES  |     | NULL    |       |
--| id      | int         | YES  |     | NULL    |       |
--+---------+-------------+------+-----+---------+-------+
--3 rows in set (0.05 sec)

mysql> desc department200;
--+----------+-------------+------+-----+---------+-------+
--| Field    | Type        | Null | Key | Default | Extra |
--+----------+-------------+------+-----+---------+-------+
--| id       | int         | NO   | PRI | NULL    |       |
--| deptname | varchar(20) | YES  |     | NULL    |       |
--+----------+-------------+----


mysql> ALTER TABLE employee200
    -> ADD CONSTRAINT fk_on_emp
    -> FOREIGN KEY (id)
    -> REFERENCES department200(id);
--Query OK, 0 rows affected (0.10 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> desc employee200;
--+---------+-------------+------+-----+---------+-------+
--| Field   | Type        | Null | Key | Default | Extra |
--+---------+-------------+------+-----+---------+-------+
--| empid   | int         | NO   | PRI | NULL    |       |
--| empname | varchar(20) | YES  |     | NULL    |       |
--| id      | int         | YES  | MUL | NULL    |       |
--+---------+-------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)



HOW TO DROP FOREIGN KEY CONSTRAINT.



mysql> ALTER TABLE employee200 DROP foreign key fk_on_emp ;
--Query OK, 0 rows affected (0.02 sec)
--Records: 0  Duplicates: 0  Warnings: 0
************************************************************




COMBINING ON DELETE AND ON UPDATE:
==================================



mysql> create table department189(deptid int primary key, deptname varchar(20));

--Query OK, 0 rows affected (0.03 sec)



mysql> insert into department189 values(1, 'HR'), (2, 'IT');

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



deptid int, foreign key(deptid) references department189

--(deptid) on update cascade on delete cascade);
--Query OK, 0 rows affected (0.04 sec)



mysql> insert into employee189 values(101, 'deepika', 1),(102, 'rashmika', 1);

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



perform update and delete ABOVE table:
--------------------------------------

mysql> select * from employee189;
--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   102 | rashmika |      1 |
--+-------+----------+--------+
--2 rows in set (0.02 sec)

mysql> select * from department189;
--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | HR       |
--|      2 | IT       |
--+--------+----------+
--2 rows in set (0.02 sec)

mysql> update department189 set deptid = 10 where deptid = 1;
--Query OK, 1 row affected (0.02 sec)
--Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department189;
--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      2 | IT       |
--|     10 | HR       |
--+--------+----------+
--2 rows in set (0.00 sec)