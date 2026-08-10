
INSERT COMMAND:---->>>

the insert command in mysql is dml command which is used to add new record into table

CASE 1: insert values in all columns ---->>>>>

SYNTAX:  Insert into tablename values (val1, val2, val3...)


mysql> use batch18;
--Database changed



mysql> create table pystudent(id int, name varchar(20), age int, city varchar(30));
--Query OK, 0 rows affected (0.05 sec)


mysql> insert into pystudent values(101, "bhavna", 30, "chennai");
--Query OK, 1 row affected (0.01 sec)



mysql> select * from pystudent;
--+------+--------+------+---------+
--| id   | name   | age  | city    |
--+------+--------+------+---------+
--|  101 | bhavna |   30 | chennai |
--+------+--------+------+---------+
--1 row in set (0.00 sec)



CASE 2 : insert values into spefic colums  if we dont want 
to insert data into every col or if we are 
providing all the values but order not followed the we need to provide col list 

SYNTAX:  insert into tablename(col1, col2, col3) values (val1, val2, val3);



mysql> insert into pystudent(id, name, city) values (102, "bhavna", "Hydrabad");
--Query OK, 1 row affected (0.01 sec)




mysql> select * from pystudent;
--+------+--------+------+----------+
--| id   | name   | age  | city     |
--+------+--------+------+----------+
--|  101 | bhavna |   30 | chennai  |
--|  102 | bhavna | NULL | Hydrabad |
--+------+--------+------+----------+
--2 rows in set (0.00 sec)



NOTE :  BEST PRACTICE---->>>>
always specifies the col names while inserting the data this makes the query easiare to read 


INSERTING MULTIPLE ROWS:---->

instead of writing multiple insert statements we can insert  many rows in one statement 

SYNTAX: insert into tablename values(val1, val2, val...), (val1, val2, val...)



mysql> insert into pystudent(id, name, age, city) values (102, "bhavna", 20, "Hydrabad"), (103, "thapaji", 21, "nepal");
--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0



mysql> select * from pystudent;
--+------+---------+------+----------+
--| id   | name    | age  | city     |
--+------+---------+------+----------+
--|  101 | bhavna  |   30 | chennai  |
--|  102 | bhavna  | NULL | Hydrabad |
--|  103 | bhavna  | NULL | Hydrabad |
--|  102 | bhavna  |   20 | Hydrabad |
--|  103 | thapaji |   21 | nepal    |
--+------+---------+------+----------+
--5 rows in set (0.00 sec)



INSERT USING SET:  mysql also supports the set syntax:  

insert into pystudent set id=108, name='riya', age=25, city='devas';
--Query OK, 1 row affected (0.03 sec)



mysql> select * from pystudent;
--+------+---------+------+----------+
--| id   | name    | age  | city     |
--+------+---------+------+----------+
--|  101 | bhavna  |   30 | chennai  |
--|  102 | bhavna  | NULL | Hydrabad |
--|  103 | bhavna  | NULL | Hydrabad |
--|  102 | bhavna  |   20 | Hydrabad |
--|  103 | thapaji |   21 | nepal    |
--|  108 | riya    |   25 | devas    |
--+------+---------+------+----------+
--6 rows in set (0.00 sec)


insert ..set can insert one row at a time

it is not the part of sql standard it means databases 
like oracle sql server and postgresql do not support this syntax.


insert data from another table: we can copy records from one table to another table 

SYNTAX:  create table pybackup as select * from pystudent where 1=0;


mysql> create table pybackup as select * from pystudent where 1=0;
--Query OK, 0 rows affected (0.04 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> desc pybackup;
--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| id    | int         | YES  |     | NULL    |       |
--| name  | varchar(20) | YES  |     | NULL    |       |
--| age   | int         | YES  |     | NULL    |       |
--| city  | varchar(30) | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--4 rows in set (0.03 sec)



mysql> insert into pybackup select * from pystudent;
--Query OK, 6 rows affected (0.03 sec)
--Records: 6  Duplicates: 0  Warnings: 0



mysql> select * from pybackup;
--+------+---------+------+----------+
--| id   | name    | age  | city     |
--+------+---------+------+----------+
--|  101 | bhavna  |   30 | chennai  |
--|  102 | bhavna  | NULL | Hydrabad |
--|  103 | bhavna  | NULL | Hydrabad |
--|  102 | bhavna  |   20 | Hydrabad |
--|  103 | thapaji |   21 | nepal    |
--|  108 | riya    |   25 | devas    |
--+------+---------+------+----------+
--6 rows in set (0.00 sec)




mysql> insert into pybackup(id, name) select id, name from pystudent;
--Query OK, 6 rows affected (0.01 sec)
--Records: 6  Duplicates: 0  Warnings: 0



mysql> select * from pybackup;
--+------+---------+------+----------+
--| id   | name    | age  | city     |
--+------+---------+------+----------+
--|  101 | bhavna  |   30 | chennai  |
--|  102 | bhavna  | NULL | Hydrabad |
--|  103 | bhavna  | NULL | Hydrabad |
--|  102 | bhavna  |   20 | Hydrabad |
--|  103 | thapaji |   21 | nepal    |
--|  108 | riya    |   25 | devas    |
--|  101 | bhavna  | NULL | NULL     |
--|  102 | bhavna  | NULL | NULL     |
--|  103 | bhavna  | NULL | NULL     |
--|  102 | bhavna  | NULL | NULL     |
--|  103 | thapaji | NULL | NULL     |
--|  108 | riya    | NULL | NULL     |
--+------+---------+------+----------+
--12 rows in set (0.00 sec)



RULES for INSERT:---->>

values must match with col order.
wrong order can to errors 
number of values must match with number or col 



PRYMARY KEY: --->>>

A primary key is a col or group of cols whos values uniqly identifies each row in a table
it does not allow duplicate values or null values.

without a primary key duplicate rocords can exists it becomes difficult 
to identifies a perticular row 
relationships between tables can not be stablished proper .

data integrity will be reduce:
searching records become less relaible.


CHARACTERISTICS OF PK:---->>>

uniqe values
cannot contain null
only one pk per table is allowed.
however: that pk can consist multiple cols (called composite pk)

it automaticaly creates an index when a pk is created mysql 
automatically creates a uniq index on that col.

values of a pk should be stable.


WAY ONE:---->>>> 

mysql> create table pyemployee(empid int primary key,name varchar(22), salary decimal(10,2));
--Query OK, 0 rows affected (0.06 sec)



mysql> desc pyemployee;
--+--------+---------------+------+-----+---------+-------+
--| Field  | Type          | Null | Key | Default | Extra |
--+--------+---------------+------+-----+---------+-------+
--| empid  | int           | NO   | PRI | NULL    |       |
--| name   | varchar(22)   | YES  |     | NULL    |       |
--| salary | decimal(10,2) | YES  |     | NULL    |       |
--+--------+---------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)




WAY TWO: ---->>>>

mysql> create table pyemployee1(empid int,name varchar(22), salary decimal(10,2), constraint pk_employee primary key(empid));
--Query OK, 0 rows affected (0.06 sec)



mysql> desc pyemployee;
--+--------+---------------+------+-----+---------+-------+
--| Field  | Type          | Null | Key | Default | Extra |
--+--------+---------------+------+-----+---------+-------+
--| empid  | int           | NO   | PRI | NULL    |       |
--| name   | varchar(22)   | YES  |     | NULL    |       |
--| salary | decimal(10,2) | YES  |     | NULL    |       |
--+--------+---------------+------+-----+---------+-------+
--3 rows in set (0.02 sec)



mysql> create table pyemployee2(empid int,name varchar(22), salary decimal(10,2),primary key(empid));
--Query OK, 0 rows affected (0.06 sec)



mysql> desc pyemployee2;
--+--------+---------------+------+-----+---------+-------+
--| Field  | Type          | Null | Key | Default | Extra |
--+--------+---------------+------+-----+---------+-------+
--| empid  | int           | NO   | PRI | NULL    |       |
--| name   | varchar(22)   | YES  |     | NULL    |       |
--| salary | decimal(10,2) | YES  |     | NULL    |       |
--+--------+---------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)



WAY 3: ---->>>>

mysql> create table pyemployee3(empid int, name varchar(22), salary decimal(10,2));
--Query OK, 0 rows affected (0.06 sec)



mysql> alter table pyemployee3 add primary key(empid);
--Query OK, 0 rows affected (0.09 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> desc pyemployee3;
--+--------+---------------+------+-----+---------+-------+
--| Field  | Type          | Null | Key | Default | Extra |
--+--------+---------------+------+-----+---------+-------+
--| empid  | int           | NO   | PRI | NULL    |       |
--| name   | varchar(22)   | YES  |     | NULL    |       |
--| salary | decimal(10,2) | YES  |     | NULL    |       |
--+--------+---------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)



