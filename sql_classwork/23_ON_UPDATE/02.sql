types of relationships:
=======================

IN a relational dadabase a relationship describes how rows in one table are connected to rows in another table. 

one-two-one:  1:1
============
it means on row in table A is associated with atmost one row in table B.
and one in table B is associated with atmost one row in table A.

example:

one employee will have one employee card.
one person will have on passport.
one user have one profile.



one employee will have one employee card.
=========================================


mysql> create table employee190(empid int primary key, empname varchar(20));

--Query OK, 0 rows affected (0.04 sec)



mysql> create table empcard(cardid int primary key, empid int unique, cardnumber varchar(20), foreign key (empid) references employee190(empid));

--Query OK, 0 rows affected (0.04 sec)



mysql> desc employee190;

--+---------+-------------+------+-----+---------+-------+
--| Field   | Type        | Null | Key | Default | Extra |
--+---------+-------------+------+-----+---------+-------+
--| empid   | int         | NO   | PRI | NULL    |       |
--| empname | varchar(20) | YES  |     | NULL    |       |
--+---------+-------------+------+-----+---------+-------+
--2 rows in set (0.00 sec)



mysql> desc empcard;

--+------------+-------------+------+-----+---------+-------+
--| Field      | Type        | Null | Key | Default | Extra |
--+------------+-------------+------+-----+---------+-------+
--| cardid     | int         | NO   | PRI | NULL    |       |
--| empid      | int         | YES  | UNI | NULL    |       |
--| cardnumber | varchar(20) | YES  |     | NULL    |       |
--+------------+-------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)



mysql> insert into employee190 values(101, 'deepika'),(102, 'rashmika');

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0




mysql> select * from employee190;
--+-------+----------+
--| empid | empname  |
--+-------+----------+
--|   101 | deepika  |
--|   102 | rashmika |
--+-------+----------+
--2 rows in set (0.00 sec)




mysql> insert into empcard values(1, 101, 'CARD111');

--Query OK, 1 row affected (0.01 sec)



mysql> insert into empcard values(2, 101, 'CARD222');

--ERROR 1062 (23000): Duplicate entry '101' for key 'empcard.empid'


ONE-TO-MANY:
============

1:N  : IN 1:N ONE row in the parent table can be associated with multiple row in the child table but each child row belongs to one parent


the forein key is place in the many sides.

one department can have many employee.

MANY-TO-ONE:
============
N:1

IS similar to one to many but it is viewd from the opposite direction


MANY-TO-MANY:
=============
M:N

IT means on row in table A CAN be associated with many rows in table B  . and one row in table B can also be associated many rows in table A . 


suppose we have student table and course table now


deepika ..... java
deepika ..... python
deepika ..... react


java .... rashmika
java ....deepika
java ....katappa



NOTE: we can not directly creat many to many relationship useing two tables.

becaues in that case we have to repeat the student information. therefore we need third table.

that third table or additional table is called junction table or bridge table, mapping table.

 student 
    ^
    |
    |
    |
    |
student_course (junction table, bridge table, mapping table)
    |
    |
    |
    |
  course




mysql> create table student191(stuid int primary key, stuname varchar(20));

--Query OK, 0 rows affected (0.09 sec)



mysql> create table course191(cid int primary key, cname varchar(20));

--Query OK, 0 rows affected (0.04 sec)




mysql> create table student_course191(stuid int, cid int, primary key(stuid, cid), foreign key(stuid) references student191(stuid), foreign key(cid) references course191(cid));

--Query OK, 0 rows affected (0.06 sec)



mysql> desc student191;

--+---------+-------------+------+-----+---------+-------+
--| Field   | Type        | Null | Key | Default | Extra |
--+---------+-------------+------+-----+---------+-------+
--| stuid   | int         | NO   | PRI | NULL    |       |
--| stuname | varchar(20) | YES  |     | NULL    |       |
--+---------+-------------+------+-----+---------+-------+
--2 rows in set (0.03 sec)




mysql> desc course191;

--+-------+-------------+------+-----+---------+-------+
--| Field | Type        | Null | Key | Default | Extra |
--+-------+-------------+------+-----+---------+-------+
--| cid   | int         | NO   | PRI | NULL    |       |
--| cname | varchar(20) | YES  |     | NULL    |       |
--+-------+-------------+------+-----+---------+-------+
--2 rows in set (0.00 sec)




mysql> insert into student191 values(101, 'deepika'), (102, 'rashmika'), (103, 'katappa');

--Query OK, 3 rows affected (0.01 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> insert into  course191 values(1, 'java'),(2, 'python'), (3, 'mysql');

--Query OK, 3 rows affected (0.03 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> insert into student_course191 values(101, 1), (101, 2), (102, 1), (102, 2);

--Query OK, 4 rows affected (0.01 sec)
--Records: 4  Duplicates: 0  Warnings: 0



mysql> select * from student_course191;

--+-------+-----+
--| stuid | cid |
--+-------+-----+
--|   101 |   1 |
--|   102 |   1 |
--|   101 |   2 |
--|   102 |   2 |
--+-------+-----+
--4 rows in set (0.00 sec)



mysql> insert into student_course191 values(101, 1);

--ERROR 1062 (23000): Duplicate entry '101-1' for key 'student_course191.PRIMARY'  


ANOTHER example TABLES:

are order and product  

employee and  project

teacher and subject

customer and product



*********************************
HW:
CAN WE HAVE CONPOSITE FOREIGN KEY 
**********************************







SELF REFERENCING FOREIGN KEY:
=============================