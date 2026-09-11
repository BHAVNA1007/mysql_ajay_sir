self referencing foreign key:
=============================

where a column in a table refererse to the primary key or unique key of the same table.

in simple words a table creates relationship itself



mysql> create table selfemployee(empid int primary key, empname varchar(20) not null, managerid int, foreign key(managerid)  references selfemployee(empid));

--Query OK, 0 rows affected (0.11 sec)



mysql> desc selfemployee;

--+-----------+-------------+------+-----+---------+-------+
--| Field     | Type        | Null | Key | Default | Extra |
--+-----------+-------------+------+-----+---------+-------+
--| empid     | int         | NO   | PRI | NULL    |       |
--| empname   | varchar(20) | NO   |     | NULL    |       |
--| managerid | int         | YES  | MUL | NULL    |       |
--+-----------+-------------+------+-----+---------+-------+
--3 rows in set (0.04 sec)



mysql> insert into selfemployee values(101, 'deepika', null);

--Query OK, 1 row affected (0.02 sec)



mysql> select * from  selfemployee;

--+-------+---------+-----------+
--| empid | empname | managerid |
--+-------+---------+-----------+
--|   101 | deepika |      NULL |
--+-------+---------+-----------+
--1 row in set (0.00 sec)




mysql> insert into selfemployee values(102, 'thapaji', 108);

--ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`batch18`.`selfemployee`, CONSTRAINT `selfemployee_ibfk_1` FOREIGN KEY (`managerid`) REFERENCES `selfemployee` (`empid`))



mysql> insert into selfemployee values(102, 'thapaji', 101);

--Query OK, 1 row affected (0.01 sec)




mysql> insert into selfemployee values(103, 'rashmika', 102);

--Query OK, 1 row affected (0.01 sec)




mysql> insert into selfemployee values(104, 'umesh', 101);

--Query OK, 1 row affected (0.01 sec)




mysql> select * from  selfemployee;

--+-------+----------+-----------+
--| empid | empname  | managerid |
--+-------+----------+-----------+
--|   101 | deepika  |      NULL |
--|   102 | thapaji  |       101 |
--|   103 | rashmika |       102 |
--|   104 | umesh    |       101 |
--+-------+----------+-----------+
--4 rows in set (0.00 sec)




mysql> insert into selfemployee values(105, 'abhi', 105);

--Query OK, 1 row affected (0.01 sec)




mysql> select * from  selfemployee;

--+-------+----------+-----------+
--| empid | empname  | managerid |
--+-------+----------+-----------+
--|   101 | deepika  |      NULL |
--|   102 | thapaji  |       101 |
--|   103 | rashmika |       102 |
--|   104 | umesh    |       101 |
--|   105 | abhi     |       105 |
--+-------+----------+-----------+
--5 rows in set (0.00 sec)





mysql> insert into selfemployee values(107, 'deepak', 108),(108, 'sneha', 108);

--ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`batch18`.`selfemployee`, CONSTRAINT `selfemployee_ibfk_1` FOREIGN KEY (`managerid`) REFERENCES `selfemployee` (`empid`))