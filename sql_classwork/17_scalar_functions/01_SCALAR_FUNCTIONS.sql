naming a check constrain: in industry level dstsbsde disign giving constarint meaningfull name is good practice


create table employee_e(id int, name varchar(20), age int, constraint chk_employee_age check(age>=18))


check vs not null:
h.w

Here is the specific difference:

NOT NULL	                      CHECK
======================================================================
Only prevents NULL value.	      Checks whether a value satisfies 
                                  a condition.

It does not validate the actual   It validates the actual value 
value.	                          according to a rule.

Example: name NOT NULL	          Example: age CHECK(age >= 21)

name = '' → ✅ Allowed	        age = 18 → ❌ Not allowed

name = NULL → ❌ Not allowed	    age = NULL → not rejected by CHECK 
                                  alone in mysql
=========================================================================



In one line:

NOT NULL → "Value must be present."
CHECK → "Value must be valid according to this rule."


default constraint:

default constraint provides a value automatically when the user dose not supply one.

ex: create table employee_e(id int primary key, name varchar(20), status varchar(20) default 'active');


mysql> create table employee_e(id int primary key, name varchar(20), status varchar(20) default 'active');
Query OK, 0 rows affected (0.06 sec)

mysql> desc employee_e;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| status | varchar(20) | YES  |     | active  |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> insert into employee_e(id, name) values(101, 'bhavna');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_e;
+-----+--------+--------+
| id  | name   | status |
+-----+--------+--------+
| 101 | bhavna | active |
+-----+--------+--------+
1 row in set (0.00 sec)


default for integer value:

mysql> create table product_p(pid int , pname varchar(20), price int default 0);
Query OK, 0 rows affected (0.03 sec)



default with datetime:
with the help of default we can automatically record the creation time.


create table default_datetime(id int, name varchar(20), createdat datetime default current_timestamp);


mysql> create table default_datetime(id int, name varchar(20), createdat datetime default current_timestamp);
Query OK, 0 rows affected (0.03 sec)

mysql> desc default_datetime;
+-----------+-------------+------+-----+-------------------+-------------------+
| Field     | Type        | Null | Key | Default           | Extra             |
+-----------+-------------+------+-----+-------------------+-------------------+
| id        | int         | YES  |     | NULL              |                   |
| name      | varchar(20) | YES  |     | NULL              |                   |
| createdat | datetime    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-----------+-------------+------+-----+-------------------+-------------------+
3 rows in set (0.00 sec)



mysql> insert into default_datetime(id, name) values(101, 'umesh');
Query OK, 1 row affected (0.01 sec)

mysql> select * from default_datetime;
+------+-------+---------------------+
| id   | name  | createdat           |
+------+-------+---------------------+
|  101 | umesh | 2026-09-02 09:55:02 |
+------+-------+---------------------+
1 row in set (0.00 sec)


mysql> create table employee_e1(id int not null default 1, name varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into employee_e1(name) values('tiya'), ('kiya');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_e1;
+----+------+
| id | name |
+----+------+
|  1 | tiya |
|  1 | kiya |
+----+------+
2 rows in set (0.00 sec)



create table employee_e2(id int, name varchar(20), not null(id));

NOTE: not null constraint cannot be define at table level.

create table employee_e3(id int, name varchar(20), dno int default 10 check(dno in(10,20,30)));

hw. you have to write a query default, not null and check .


function in mysql:
=================
is a predifind operation that accepts one or more values as input, perform a specific operation and return a result.

function===input---process==output

in mysql functions are classified into two types:

1.sinlge row function(scalar functions):

2.aggregate functions(group functions):


1.sinlge row function: a single row function operates on indivisual rows and produce one result for each row.


Type of scalar functions:
=========================

1.string functions

2.numeric functions

3.date and time functions

4.conditional functions

5.null handling functions

6.conversion functions


1.string functions: are use to perform operation on character or string data.

select upper('deepika');

mysql> select upper('deepika');
+------------------+
| upper('deepika') |
+------------------+
| DEEPIKA          |
+------------------+
1 row in set (0.00 sec)


select name, upper(name) from employee_e1;


mysql> select name, upper(name) from employee_e1;
+------+-------------+
| name | upper(name) |
+------+-------------+
| tiya | TIYA        |
| kiya | KIYA        |
+------+-------------+
2 rows in set (0.00 sec)