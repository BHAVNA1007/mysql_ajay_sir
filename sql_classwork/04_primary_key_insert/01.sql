composite primary key: some times one col is not sufficient means
neither col is uniqe in that case we create composite key



mysql> create table pycustomer_product(cid int, pid int, quantity int, primary key(cid, pid));
--Query OK, 0 rows affected (0.03 sec)



mysql> desc pycustomer_product;
--+----------+------+------+-----+---------+-------+
--| Field    | Type | Null | Key | Default | Extra |
--+----------+------+------+-----+---------+-------+
--| cid      | int  | NO   | PRI | NULL    |       |
--| pid      | int  | NO   | PRI | NULL    |       |
--| quantity | int  | YES  |     | NULL    |       |
--+----------+------+------+-----+---------+-------+
--3 rows in set (0.00 sec)




mysql> insert into  pycustomer_product values(101, 501, 4);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from  pycustomer_product;
--+-----+-----+----------+
--| cid | pid | quantity |
--+-----+-----+----------+
--| 101 | 501 |        4 |
--+-----+-----+----------+
--1 row in set (0.00 sec)



mysql> insert into  pycustomer_product values(102, 501, 2);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from  pycustomer_product;
--+-----+-----+----------+
--| cid | pid | quantity |
--+-----+-----+----------+
--| 101 | 501 |        4 |
--| 102 | 501 |        2 |
--+-----+-----+----------+
--2 rows in set (0.00 sec)



mysql> insert into  pycustomer_product values(101, 501, 9);
--ERROR 1062 (23000): Duplicate entry '101-501' for key 'pycustomer_product.PRIMARY'



mysql> insert into  pycustomer_product values(101, 504, 9);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from  pycustomer_product;
--+-----+-----+----------+
--| cid | pid | quantity |
--+-----+-----+----------+
--| 101 | 501 |        4 |
--| 101 | 504 |        9 |
--| 102 | 501 |        2 |
--+-----+-----+----------+
--3 rows in set (0.00 sec)



auto increment property:
it is a mysql attribute used with numeric cols to automatically 
generate a uniqe number
whenever a new record is inserted into a table

it is most commonly used with the primary key 
so that the user does not have to enter the id mannually

whenever a new employee joins we must manualy decide the next id.

problem:

we may forget the id.
duplicate ids can be inserted accedently.
to solve above problem auto-increment is used


mysql> create table pyemployee5(id int auto_increment primary key, name varchar(20), salary decimal(10,2));
--Query OK, 0 rows affected (0.03 sec)



mysql> desc pyemployee5;
--+--------+---------------+------+-----+---------+----------------+
--| Field  | Type          | Null | Key | Default | Extra          |
--+--------+---------------+------+-----+---------+----------------+
--| id     | int           | NO   | PRI | NULL    | auto_increment |
--| name   | varchar(20)   | YES  |     | NULL    |                |
--| salary | decimal(10,2) | YES  |     | NULL    |                |
--+--------+---------------+------+-----+---------+----------------+
--3 rows in set (0.00 sec)



mysql> create table pyemployee5(id int auto_increment, name varchar(20), salary decimal(10,2));
--ERROR 1050 (42S01): Table 'pyemployee5' already exists


mysql> create table pyemployee6(id int auto_increment, name varchar(20), salary decimal(10,2));
--ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key



mysql> insert into pyemployee5(name, salary) values('rashmika', 6666);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee5;
--+----+----------+----------+
--| id | name     | salary   |
--+----+----------+----------+
--|  1 | dipu     | 89999.00 |
--|  2 | rashmika |  6666.00 |
--+----+----------+----------+
--2 rows in set (0.00 sec)



mysql> insert into pyemployee5(name, salary) values('thapaji', 6666);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee5;
--+----+----------+----------+
--| id | name     | salary   |
--+----+----------+----------+
--|  1 | dipu     | 89999.00 |
--|  2 | rashmika |  6666.00 |
--|  3 | thapaji  |  6666.00 |
--+----+----------+----------+
--3 rows in set (0.00 sec)


rules for auto_increment;
only one auto_increment col per table is allow.

mysql> create table pyemployee6(eid int auto_increment, did int auto_increment);
--ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key


default starting value bydefault auto_increment starts from 1.
and bydefault it increase by 1.

changing starting value:
we can change the starting value of auto_increment.



mysql> create table pyemployee7(eid int auto_increment primary key,name varchar(20)) auto_increment=1000;
--Query OK, 0 rows affected (0.05 sec)



mysql> desc pyemployee7;
--+-------+-------------+------+-----+---------+----------------+
--| Field | Type        | Null | Key | Default | Extra          |
--+-------+-------------+------+-----+---------+----------------+
--| eid   | int         | NO   | PRI | NULL    | auto_increment |
--| name  | varchar(20) | YES  |     | NULL    |                |
--+-------+-------------+------+-----+---------+----------------+
--2 rows in set (0.00 sec)



mysql> insert into pyemployee7(name) values('deepika');
--Query OK, 1 row affected (0.01 sec)



mysql> insert into pyemployee7(name) values('rashmika');
--Query OK, 1 row affected (0.01 sec)



mysql> insert into pyemployee7(name) values('katapaaa');
--Query OK, 1 row affected (0.01 sec)




mysql> select * from pyemployee7;
--+------+----------+
--| eid  | name     |
--+------+----------+
--| 1000 | deepika  |
--| 1001 | rashmika |
--| 1002 | katapaaa |
--+------+----------+
--3 rows in set (0.00 sec)


##manually inserting auto_increment values:


mysql> create table pyemployee8(eid int auto_increment primary key,name varchar(20));
--Query OK, 0 rows affected (0.03 sec)



mysql> desc pyemployee8;
--+-------+-------------+------+-----+---------+----------------+
--| Field | Type        | Null | Key | Default | Extra          |
--+-------+-------------+------+-----+---------+----------------+
--| eid   | int         | NO   | PRI | NULL    | auto_increment |
--| name  | varchar(20) | YES  |     | NULL    |                |
--+-------+-------------+------+-----+---------+----------------+
--2 rows in set (0.00 sec)



mysql> insert into pyemployee8(name) values('rashmika');
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee8;
--+-----+----------+
--| eid | name     |
--+-----+----------+
--|   1 | rashmika |
--+-----+----------+
--1 row in set (0.00 sec)



mysql> insert into pyemployee8 values(10,'kuldeep');
--Query OK, 1 row affected (0.01 sec)




mysql> select * from pyemployee8;
--+-----+----------+
--| eid | name     |
--+-----+----------+
--|   1 | rashmika |
--|  10 | kuldeep  |
--+-----+----------+
--2 rows in set (0.00 sec)



mysql> insert into pyemployee8(name) values('deepika');
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee8;
--+-----+----------+
--| eid | name     |
--+-----+----------+
--|   1 | rashmika |
--|  10 | kuldeep  |
--|  11 | deepika  |
--+-----+----------+
--3 rows in set (0.00 sec)


note--->> 
if we manually insert the value that is greater then current auto_increment value 
then mysql updates to next auto_increment value accordingly


mysql> insert into pyemployee8 values(2,'anil');
--Query OK, 1 row affected (0.03 sec)



mysql> insert into pyemployee8(name) values('bhavna');
--Query OK, 1 row affected (0.03 sec)


-------------------------------------->>>>>>>>>>>>>>

mysql> select * from pyemployee8;
--+-----+----------+
--| eid | name     |
--+-----+----------+
--|   1 | rashmika |
--|   2 | anil     |
--|  10 | kuldeep  |
--|  11 | deepika  |
--|  12 | bhavna   |
--+-----+----------+
--5 rows in set (0.00 sec)
----------------->>>>>>>>>>>>>>>>>>>>


an auto_increment with null value:

if we explicitly insert null value into an auto increment col 
mysql trits it as we did not provide any value and automatically
generates the next sequnce number.


mysql> create table  pyemployee9(sid int auto_increment primary key,name varchar(20), age int);
--Query OK, 0 rows affected (0.06 sec)



mysql> insert into pyemployee9(name, age) values("abc", 30);
--Query OK, 1 row affected (0.03 sec)



mysql> insert into pyemployee9(name, age) values(null,"xyz", 30);
ERROR 1136 (21S01): Column count doesnt match value count at row 1



mysql> insert into pyemployee9(name, age) values("abc", 30);
--Query OK, 1 row affected (0.01 sec)



CASE 1:  default behavioure 
in most my sql installation if the sql mode does not include 
NO_AUTO_VALUE_ON_ZERO then inserting 0 into an auto increment
col behaves exaclty like inserting null. it means mysql automatically
generates the next available values.



mysql> insert into pyemployee9 values(null,"abc", 30);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pyemployee9;
--+-----+------+------+
--| sid | name | age  |
--+-----+------+------+
--|   1 | abc  |   30 |
--|   2 | abc  |   30 |
--|   3 | abc  |   30 |
--+-----+------+------+
--3 rows in set (0.00 sec)

auto increment with 0: if we insert 0 into an autoincrement col 
then the result depends on mysql sql mode

----------------------------->>>>>>

CASE 2: 
 when NO_AUTO_VALUE_ON_ZERO is inabled then 0 is treated as normal 
 value


mysql> insert into pyemployee9 values(0,"xyz", 30);
--Query OK, 1 row affected (0.02 sec)

mysql> select * from pyemployee9;
--+-----+------+------+
--| sid | name | age  |
--+-----+------+------+
--|   1 | abc  |   30 |
--|   2 | abc  |   30 |
--|   3 | abc  |   30 |
--|   4 | xyz  |   30 |
--+-----+------+------+
--4 rows in set (0.00 sec)





mysql> select @@sql_mode;

--+-----------------------------------------------------------------------------------------------------------------------+
--| @@sql_mode                                                                                                            |
--+-----------------------------------------------------------------------------------------------------------------------+
--| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION |
--+-----------------------------------------------------------------------------------------------------------------------+
--1 row in set (0.02 sec)









### CLASS TEST



mysql> create table pystd(sid int, subid int, marks int, primary key(sid, subid));
--Query OK, 0 rows affected (0.03 sec)



mysql> desc pystd;
--+-------+------+------+-----+---------+-------+
--| Field | Type | Null | Key | Default | Extra |
--+-------+------+------+-----+---------+-------+
--| sid   | int  | NO   | PRI | NULL    |       |
--| subid | int  | NO   | PRI | NULL    |       |
--| marks | int  | YES  |     | NULL    |       |
--+-------+------+------+-----+---------+-------+
--3 rows in set (0.00 sec)



mysql> insert into pystd values(101,501,98),(101, 502,80),(201, 501,93);
--Query OK, 3 rows affected (0.01 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> select * from  pystd;
--+-----+-------+-------+
--| sid | subid | marks |
--+-----+-------+-------+
--| 101 |   501 |    98 |
--| 101 |   502 |    80 |
--| 201 |   501 |    93 |
--+-----+-------+-------+
--3 rows in set (0.00 sec)




mysql> create table product(pid int primary key, pname varchar(20), pcatogory varchar(22), price decimal(10,2));
--Query OK, 0 rows affected (0.04 sec)



mysql> desc product;
--+-----------+---------------+------+-----+---------+-------+
--| Field     | Type          | Null | Key | Default | Extra |
--+-----------+---------------+------+-----+---------+-------+
--| pid       | int           | NO   | PRI | NULL    |       |
--| pname     | varchar(20)   | YES  |     | NULL    |       |
--| pcatogory | varchar(22)   | YES  |     | NULL    |       |
--| price     | decimal(10,2) | YES  |     | NULL    |       |
--+-----------+---------------+------+-----+---------+-------+
--4 rows in set (0.00 sec)




mysql> insert into product(pid, pname, pcatogory, price) values(101, 'laptop', 'electronic', 200000), (102, 'dryer', 'electronic', 100000);
--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> insert into product set pid=103, pname='mob', pcatogory='elec', price=80000;
--Query OK, 1 row affected (0.01 sec)



mysql> select * from product;
--+-----+--------+------------+-----------+
--| pid | pname  | pcatogory  | price     |
--+-----+--------+------------+-----------+
--| 101 | laptop | electronic | 200000.00 |
--| 102 | dryer  | electronic | 100000.00 |
--| 103 | mob    | elec       |  80000.00 |
--+-----+--------+------------+-----------+
--3 rows in set (0.00 sec)
