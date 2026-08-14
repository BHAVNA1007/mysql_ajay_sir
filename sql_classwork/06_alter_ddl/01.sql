
DROP ::::::: 
 
is a DDL command. it is use to permanently remove a database object
 from the database when we use drop the object itself is deleted
  along with the data stored inside it.


after drop command the table will no longer exists.


CAN WE DELETE MULTIPLE TABLE ?:::::::::::;
yes we can 


TRUNCATE VS DROP;;;;;;;;

truncate is used to remove all rows from a table while keeping the table.
drop is used to remove the entire table.

in truncate data remove but structure retained.
but drop schema and data both remove.

truncate resetes the auto_increment.
but with drop the table itself is remove including its auto increment.

truncate does not support where clause. because it remove the all rows.
drop also does not support where because it remove the entire table.

both are ddl operation so they can not be rolled back.



ALTER :::::::::::::::: 

is a ddl command use to modify the schema of an existing database object.

it allow us to change an existing table without droping and recreating the entire table.

we can use alter table for::::::::::::::

add a new col.

drop a col.

modifies a col datatype.

change col defination.

rename a col.

rename a table.

add constraints.

drop constraints.

add primary key. 

drop primary key.

add and drop forign key.

change auto_increment.


SYNTAX :::: ALTER TABLE TABLENAME alteroperation;

ater table is one of the machanism use to evolve the database schema.

ADD COL:::::::

SYNTAX::::
alter table table_name add col col_name datatype;

NOTE::::
existing rows will have null value in the newly added column
when no applicable default is supply.

ADD MULTIPLE COLUMNs::::

alter table azadi add column mobile varchar(20), add column course varchar(30), add column salary decimal(10,2);

add col at a specific position::::
by default a new col is added at the end
but mysql allow positioning.

First::: --------
=================
alter table azadi add column gender varchar(10) first;

specific position:::::
--------------------------
alter table azadi add column col1 datatype1 after col;
alter table azadi add column dob date after name;


NOTE::::;
column order has no bussiness significanse

DROP COLUMN:::
it is ues to permanently remove a column from the table.

SYNTAX::::::
alter table table_name drop column column_name;


MODIFy COLUMN::::::::
modify is use to change the defination of an existing column

SYNTAX::::::
alter table table_name modify column column_name new_defination;

modify multiple columns:::::
khud krna

modify CONSTRAINTS::::::::::
modify can change diffrent aspect of a column defination

alter table azadi modify column name varchar(50) not null;


alter table azadi modify column salary decimal(10,2) default 1000;

CHANGE COLUMN:::

can be use to rename a column  or change its defination

alter table table_name change column old_name new_name datatype;



CHANGE VS  MODIFY::::::

modify is used when we want to change the defination but keep the same column name
but
change is used when we want to rename the column and we want to redifind it



RENAME:::::

SYNTAX----
alter table table_name rename column old to new;


RENAME TABLE  WITH ALTER
================================================

SYNTAX::::
alter table old_table_name rename to new_table_name;


RENAME TABLE::::::
============================================

SYNTAX:::::
RENAME TABLE old_table_name TO new_table_name;


PRIMARY KEY USING ALTER:::::


mysql> create table azadstudent(id int, name varchar(20), salary decimal(10,2));
Query OK, 0 rows affected (0.06 sec)

mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | YES  |     | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table azadstudent add primary key(id);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   | PRI | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

HOME WORK:::::
add composite primary key


======================================

ALTER WITH AUTO_INCREMENT:::::
If the primary key column is also auto_increment then 
we can not directly remove the primary key 
because mysql require an auto_increment column to be indexed



++++++++++++++++++++++++++++++++++++++++
TOPICS WILL BE COVERD LATER;;;;

ADD AND DROP UNIQUE CONSTRAINTS USING ALTER
FOREIGN KEY USING ALTER
CHECK CONSTRAINT USING ALTER
DEFAULT USING ALTER
++++++++++++++++++++++++++++++++++++++++


mysql> use batch18;
Database changed


mysql> select * from pyemployee9;
+-----+------+------+
| sid | name | age  |
+-----+------+------+
|   1 | abc  |   30 |
|   2 | abc  |   30 |
|   3 | abc  |   30 |
|   4 | xyz  |   30 |
+-----+------+------+
4 rows in set (0.02 sec)

*********************
       DROP 
********************
 
is a DDL command. it is use to permanently remove a database object
from the database when we use drop the object itself is deleted
along with the data stored inside it.



mysql> drop table pyemployee9;
Query OK, 0 rows affected (0.03 sec)

=================================
after drop command the table will no longer exists.
=================================

mysql> select * from pyemployee9;
--ERROR 1146 (42S02): Table 'batch18.pyemployee9' doesn't exist


**********************
CAN WE DELETE MULTIPLE TABLE ?
yes we can 
***********************

mysql> drop table  pyemployee1, pyemployee2;
Query OK, 0 rows affected (0.03 sec)


mysql> select * from pyemployee1;
--ERROR 1146 (42S02): Table 'batch18.pyemployee1' doesn't exist

mysql> select * from pyemployee2;
--ERROR 1146 (42S02): Table 'batch18.pyemployee2' doesn't exist


********************
with if condition
********************

mysql> drop table if exists pyemployee2;
Query OK, 0 rows affected, 1 warning (0.01 sec)



*******************
TRUNCATE VS DROP
*******************

truncate is used to remove all rows from a table while keeping the table.
drop is used to remove the entire table.

in truncate data remove but structure retained.
but drop schema and data both remove.

truncate resetes the auto_increment.
but with drop the table itself is remove including its auto increment.

truncate does not support where clause. because it remove the all rows.
drop also does not support where because it remove the entire table.

both are ddl operation so they can not be rolled back.




************************
         ALTER 
************************

is a ddl command use to modify the schema of an existing database object.

it allow us to change an existing table without droping and recreating the entire table.

----------------------------
we can use alter table for::::::::::::::
-----------------------------

add a new col.

drop a col.

modifies a col datatype.

change col defination.

rename a col.

rename a table.

add constraints.

drop constraints.

add primary key. 

drop primary key.

add and drop forign key.

change auto_increment.

*****************************************************
SYNTAX :::: ALTER TABLE TABLENAME alteroperation;
*****************************************************

alter table is one of the machanism use to evolve the database schema.


mysql> create table azadi(student_id int, name varchar(20), age int, city varchar(20));
Query OK, 0 rows affected (0.05 sec)


mysql> desc azadi;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | YES  |     | NULL    |       |
| name       | varchar(20) | YES  |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)




mysql> insert into azadi values(101, 'deepika', 30, 'chennai'),(102, 'rashmika', 27, 'indore'),(103, 'anushka', 28, 'indore'),(104, 'virat', 30,'banglore');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0



mysql> select * from azadi;
+------------+----------+------+----------+
| student_id | name     | age  | city     |
+------------+----------+------+----------+
|        101 | deepika  |   30 | chennai  |
|        102 | rashmika |   27 | indore   |
|        103 | anushka  |   28 | indore   |
|        104 | virat    |   30 | banglore |
+------------+----------+------+----------+
4 rows in set (0.00 sec)



mysql> desc azadi;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | YES  |     | NULL    |       |
| name       | varchar(20) | YES  |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


*****************
    ADD COLUMN
*****************
SYNTAX::::
alter table table_name add column col_name datatype;


NOTE::::
existing rows will have null value in the newly added column
when no applicable default is supply.


mysql> alter table azadi add column email varchar(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | YES  |     | NULL    |       |
| name       | varchar(20) | YES  |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| email      | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)



mysql> select * from azadi;
+------------+----------+------+----------+-------+
| student_id | name     | age  | city     | email |
+------------+----------+------+----------+-------+
|        101 | deepika  |   30 | chennai  | NULL  |
|        102 | rashmika |   27 | indore   | NULL  |
|        103 | anushka  |   28 | indore   | NULL  |
|        104 | virat    |   30 | banglore | NULL  |
+------------+----------+------+----------+-------+
4 rows in set (0.00 sec)


********************************
    ADD MULTIPLE COLUMNS
********************************    
SYNTAX:::::
alter table table_name add column column_name1 datatype, add column column_name2 datatype, add column column_name3 datatype;


mysql> alter table azadi add column mobile varchar(20), add column course varchar(30), add column salary decimal(10,2);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| age        | int           | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| mobile     | varchar(20)   | YES  |     | NULL    |       |
| course     | varchar(30)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)


************************************************
     add col at a specific position::::
************************************************     
by default a new col is added at the end
but mysql allow positioning.

-----------------
CASE 1:   First
-----------------

SYNTAX ::::::
alter table table_name add column column_name datatype FIRST;

mysql> alter table azadi add column gender varchar(10) first;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| age        | int           | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| mobile     | varchar(20)   | YES  |     | NULL    |       |
| course     | varchar(30)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
9 rows in set (0.00 sec)


----------------------------
CASE 2: specific position
----------------------------

SYNTAX:::::
alter table table_name add column new_column datatype after col...;


mysql> alter table azadi add column dob date after name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| dob        | date          | YES  |     | NULL    |       |
| age        | int           | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| mobile     | varchar(20)   | YES  |     | NULL    |       |
| course     | varchar(30)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

********************************************************************
NOTE::::
column order has no bussiness significanse
********************************************************************


mysql> select name from azadi;
+----------+
| name     |
+----------+
| deepika  |
| rashmika |
| anushka  |
| virat    |
+----------+
4 rows in set (0.00 sec)



mysql> select dob,city from azadi;
+------+----------+
| dob  | city     |
+------+----------+
| NULL | chennai  |
| NULL | indore   |
| NULL | indore   |
| NULL | banglore |
+------+----------+
4 rows in set (0.00 sec)


****************************
     DROP COLUMN
****************************
it is ues to permanently remove a column from the table.

SYNTAX::::::
alter table table_name drop column column_name;

mysql> alter table azadi drop column dob;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| age        | int           | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| mobile     | varchar(20)   | YES  |     | NULL    |       |
| course     | varchar(30)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
9 rows in set (0.00 sec)


***************************
   MULTIPLE COLUMN DROP
***************************   

mysql> alter table azadi drop column mobile, drop column course;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| age        | int           | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


**************************
    MODIFY COLUMN
**************************    
modify is use to change the defination of an existing column

SYNTAX::::::
alter table table_name modify column column_name new_defination;


mysql> alter table azadi modify column age smallint;
Query OK, 4 rows affected (0.12 sec)
Records: 4  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(20)   | YES  |     | NULL    |       |
| age        | smallint      | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


mysql> alter table azadi modify column name varchar(50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(50)   | YES  |     | NULL    |       |
| age        | smallint      | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


-----------------------------------------
MODIFY multiple columns:::::
khud krna
-----------------------------------------


**********************************
      MODIFY CONSTRAINTS
**********************************
modify can change diffrent aspect of a column defination.


mysql> alter table azadi modify column name varchar(50) not null;
Query OK, 0 rows affected (0.20 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| name       | varchar(50)   | NO   |     | NULL    |       |
| age        | smallint      | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)



mysql> select * from azadi;
+--------+------------+----------+------+----------+-------+--------+
| gender | student_id | name     | age  | city     | email | salary |
+--------+------------+----------+------+----------+-------+--------+
| NULL   |        101 | deepika  |   30 | chennai  | NULL  |   NULL |
| NULL   |        102 | rashmika |   27 | indore   | NULL  |   NULL |
| NULL   |        103 | anushka  |   28 | indore   | NULL  |   NULL |
| NULL   |        104 | virat    |   30 | banglore | NULL  |   NULL |
+--------+------------+----------+------+----------+-------+--------+
4 rows in set (0.00 sec)



mysql> insert into azadi(name) values('siya');
Query OK, 1 row affected (0.01 sec)


mysql> select * from azadi;
+--------+------------+----------+------+----------+-------+--------+
| gender | student_id | name     | age  | city     | email | salary |
+--------+------------+----------+------+----------+-------+--------+
| NULL   |        101 | deepika  |   30 | chennai  | NULL  |   NULL |
| NULL   |        102 | rashmika |   27 | indore   | NULL  |   NULL |
| NULL   |        103 | anushka  |   28 | indore   | NULL  |   NULL |
| NULL   |        104 | virat    |   30 | banglore | NULL  |   NULL |
| NULL   |       NULL | siya     | NULL | NULL     | NULL  |   NULL |
+--------+------------+----------+------+----------+-------+--------+
5 rows in set (0.00 sec)


mysql> insert into azadi(age) values(20);
--ERROR 1364 (HY000): Field 'name' doesn't have a default value



mysql> alter table azadi modify column salary decimal(10,2) default 1000;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> select * from azadi;
+--------+------------+----------+------+----------+-------+--------+
| gender | student_id | name     | age  | city     | email | salary |
+--------+------------+----------+------+----------+-------+--------+
| NULL   |        101 | deepika  |   30 | chennai  | NULL  |   NULL |
| NULL   |        102 | rashmika |   27 | indore   | NULL  |   NULL |
| NULL   |        103 | anushka  |   28 | indore   | NULL  |   NULL |
| NULL   |        104 | virat    |   30 | banglore | NULL  |   NULL |
| NULL   |       NULL | siya     | NULL | NULL     | NULL  |   NULL |
+--------+------------+----------+------+----------+-------+--------+
5 rows in set (0.00 sec)


mysql> insert into azadi(name) values("bhagat singh");
Query OK, 1 row affected (0.02 sec)


mysql> select * from azadi;
+--------+------------+--------------+------+----------+-------+---------+
| gender | student_id | name         | age  | city     | email | salary  |
+--------+------------+--------------+------+----------+-------+---------+
| NULL   |        101 | deepika      |   30 | chennai  | NULL  |    NULL |
| NULL   |        102 | rashmika     |   27 | indore   | NULL  |    NULL |
| NULL   |        103 | anushka      |   28 | indore   | NULL  |    NULL |
| NULL   |        104 | virat        |   30 | banglore | NULL  |    NULL |
| NULL   |       NULL | siya         | NULL | NULL     | NULL  |    NULL |
| NULL   |       NULL | bhagat singh | NULL | NULL     | NULL  | 1000.00 |
+--------+------------+--------------+------+----------+-------+---------+
6 rows in set (0.00 sec)


****************************
     CHANGE COLUMN
***************************
can be use to rename a column  or change its defination.

SYNTAX::::::
alter table table_name change column old_name new_name datatype;


mysql> alter table azadi change column name fullname varchar(30);
Query OK, 6 rows affected (0.09 sec)
Records: 6  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| gender     | varchar(10)   | YES  |     | NULL    |       |
| student_id | int           | YES  |     | NULL    |       |
| fullname   | varchar(30)   | YES  |     | NULL    |       |
| age        | smallint      | YES  |     | NULL    |       |
| city       | varchar(20)   | YES  |     | NULL    |       |
| email      | varchar(20)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | 1000.00 |       |
+------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


===============================
CHANGE VS  MODIFY::::::
-------------------------------

modify is used when we want to change the defination but keep the same column name
but
change is used when we want to rename the column and we want to redifind it
================================


**************************
      RENAME
**************************

SYNTAX----
alter table table_name rename column old_column_name to new_column_name;


mysql> alter table azadi rename column age to student_age;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadi;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| gender      | varchar(10)   | YES  |     | NULL    |       |
| student_id  | int           | YES  |     | NULL    |       |
| fullname    | varchar(30)   | YES  |     | NULL    |       |
| student_age | smallint      | YES  |     | NULL    |       |
| city        | varchar(20)   | YES  |     | NULL    |       |
| email       | varchar(20)   | YES  |     | NULL    |       |
| salary      | decimal(10,2) | YES  |     | 1000.00 |       |
+-------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


************************
RENAME TABLE  WITH ALTER
************************

SYNTAX::::
alter table old_table_name rename to new_table_name;

mysql> alter table azadi rename to hamriazadi;
Query OK, 0 rows affected (0.04 sec)


mysql> select * from hamriazadi;
+--------+------------+--------------+-------------+----------+-------+---------+
| gender | student_id | fullname     | student_age | city     | email | salary  |
+--------+------------+--------------+-------------+----------+-------+---------+
| NULL   |        101 | deepika      |          30 | chennai  | NULL  |    NULL |
| NULL   |        102 | rashmika     |          27 | indore   | NULL  |    NULL |
| NULL   |        103 | anushka      |          28 | indore   | NULL  |    NULL |
| NULL   |        104 | virat        |          30 | banglore | NULL  |    NULL |
| NULL   |       NULL | siya         |        NULL | NULL     | NULL  |    NULL |
| NULL   |       NULL | bhagat singh |        NULL | NULL     | NULL  | 1000.00 |
+--------+------------+--------------+-------------+----------+-------+---------+
6 rows in set (0.00 sec)



************************
DIRECT RENAME TABLE
************************

SYNTAX:::::
RENAME TABLE old_table_name TO new_table_name;


mysql> RENAME TABLE hamriazadi TO sbkiazadi;
Query OK, 0 rows affected (0.03 sec)


mysql> desc sbkiazadi;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| gender      | varchar(10)   | YES  |     | NULL    |       |
| student_id  | int           | YES  |     | NULL    |       |
| fullname    | varchar(30)   | YES  |     | NULL    |       |
| student_age | smallint      | YES  |     | NULL    |       |
| city        | varchar(20)   | YES  |     | NULL    |       |
| email       | varchar(20)   | YES  |     | NULL    |       |
| salary      | decimal(10,2) | YES  |     | 1000.00 |       |
+-------------+---------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


=============================================
       PRIMARY KEY USING ALTER:::::
=============================================
mysql> create table azadstudent(id int, name varchar(20), salary decimal(10,2));
Query OK, 0 rows affected (0.06 sec)


mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | YES  |     | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> alter table azadstudent add primary key(id);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   | PRI | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> alter table azadstudent drop primary key;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   |     | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> create table azadstudent1(id int auto_increment primary key, name varchar(20), salary decimal(10,2));
Query OK, 0 rows affected (0.05 sec)

mysql> desc azadstudent1;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20)   | YES  |     | NULL    |                |
| salary | decimal(10,2) | YES  |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)


mysql> alter table azadstudent1 drop primary key;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key



mysql> alter table azadstudent1 modify id int;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc azadstudent1;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   | PRI | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)




mysql> alter table azadstudent1 drop primary key;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0




mysql> desc azadstudent1;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   |     | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)




this is experiment on table azadstudent



mysql> alter table azadstudent modify id int auto_increment primary key;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> desc azadstudent;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20)   | YES  |     | NULL    |                |
| salary | decimal(10,2) | YES  |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)



mysql> alter table azadstudent modify id int;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0




mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   | PRI | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)




mysql> alter table azadstudent drop primary key;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0




mysql> desc azadstudent;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   |     | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

*******************************************************************







