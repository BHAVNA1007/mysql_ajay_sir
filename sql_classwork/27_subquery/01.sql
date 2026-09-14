SUBQUERY:
=========

IS a query return inside another sql query.

the inner query is called sbquery, nested query.

the outer query is called main query.

suquerys are usefull when the condition of one query depends on the result of another query.





mysql> create table subdepartment(deptid int primary key, dname varchar(20))
;
--Query OK, 0 rows affected (0.13 sec)



mysql> desc subdepartment;

--+--------+-------------+------+-----+---------+-------+
--| Field  | Type        | Null | Key | Default | Extra |
--+--------+-------------+------+-----+---------+-------+
--| deptid | int         | NO   | PRI | NULL    |       |
--| dname  | varchar(20) | YES  |     | NULL    |       |
--+--------+-------------+------+-----+---------+-------+
--2 rows in set (0.04 sec)



mysql> insert into subdepartment values (1, 'HR'), (2, 'IT'), (3, 'Finance');

--Query OK, 3 rows affected (0.02 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> select * from subdepartment;

--+--------+---------+
--| deptid | dname   |
--+--------+---------+
--|      1 | HR      |
--|      2 | IT      |
--|      3 | Finance |
--+--------+---------+
--3 rows in set (0.00 sec)



mysql> create table subemployee (eid int primary key, ename varchar(20), salary int, deptid int);

--Query OK, 0 rows affected (0.03 sec)





mysql> desc subemployee;

--+--------+-------------+------+-----+---------+-------+
--| Field  | Type        | Null | Key | Default | Extra |
--+--------+-------------+------+-----+---------+-------+
--| eid    | int         | NO   | PRI | NULL    |       |
--| ename  | varchar(20) | YES  |     | NULL    |       |
--| salary | int         | YES  |     | NULL    |       |
--| deptid | int         | YES  |     | NULL    |       |
--+--------+-------------+------+-----+---------+-------+
--4 rows in set (0.00 sec)



mysql> insert into subemployee values (101, 'amit', 3000, 1), (102, 'rahul', 50000, 2), (103, 'deepika', 6000, 3), (104, 'rashmika', 89000, 1),(105, 'katappa', 70000, 2);

--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0




mysql> select * from subemployee;

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 101 | amit     |   3000 |      1 |
--| 102 | rahul    |  50000 |      2 |
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--5 rows in set (0.00 sec)


single row subquery:
====================

A single row subquery returns exactly one row or one value it is generally used with

operators:
=========

=
<
>
>=
<=
<>


WAQ:  TO FIND EMPLOYEE ERNING MORE THEN THE AVERAGE SALARY


WITHOUT SUBQUERY:
=================

mysql> SELECT AVG(salary) from subemployee;

--+-------------+
--| AVG(salary) |
--+-------------+
--|  43600.0000 |
--+-------------+
--1 row in set (0.01 sec)



mysql> select * from subemployee where salary >  43600;

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 102 | rahul    |  50000 |      2 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--3 rows in set (0.00 sec)




WITH SUBQUERY
=============

mysql> select * from subemployee where salary > (SELECT AVG(salary) from subemployee);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 102 | rahul    |  50000 |      2 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--3 rows in set (0.01 sec)




WAQ : TO FIND EMPLOYEES EARNING EXACLTY THE MAXIMUM SALARY .

mysql> select * from subemployee where salary = (SELECT MAX(salary) from subemployee);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 104 | rashmika |  89000 |      1 |
--+-----+----------+--------+--------+
--1 row in set (0.00 sec)




WAQ. TO FIND EMPLOYEES EARNING ATLEAST THE AVG SALARY.

mysql> select * from subemployee where salary >= (SELECT AVG(salary) from subemployee);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 102 | rahul    |  50000 |      2 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--3 rows in set (0.00 sec)



WAQ. TO FIND EMPLOYEES WHOSE SALARY IS NOT EQUAL TO THE MINIMUM SALARY.


mysql> select * from subemployee where salary <> (SELECT MIN(salary) from subemployee);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 102 | rahul    |  50000 |      2 |
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--4 rows in set (0.00 sec)



mysql> select * from subemployee where salary = (SELECT salary from subemployee);

--ERROR 1242 (21000): Subquery returns more than 1 row


MULTIPLE ROW SUBQUERY
=====================

IT returns more then one row it is commonly use with:

IN
NOT IN
ANY
SOME
ALL



WAQ. TO FIND EMPLOYEES WHO ARE WORKING IN IT AND FINANCE.

mysql> select * from subemployee;

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 101 | amit     |   3000 |      1 |
--| 102 | rahul    |  50000 |      2 |
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--5 rows in set (0.00 sec)



mysql> select * from subdepartment;

--+--------+---------+
--| deptid | dname   |
--+--------+---------+
--|      1 | HR      |
--|      2 | IT      |
--|      3 | Finance |
--+--------+---------+
--3 rows in set (0.00 sec)



mysql> select deptid from subdepartment where dname IN('IT', 'Finance');

--+--------+
--| deptid |
--+--------+
--|      2 |
--|      3 |
--+--------+
--2 rows in set (0.00 sec)



mysql> SELECT * from subemployee where deptid in (2, 3);

--+-----+---------+--------+--------+
--| eid | ename   | salary | deptid |
--+-----+---------+--------+--------+
--| 102 | rahul   |  50000 |      2 |
--| 103 | deepika |   6000 |      3 |
--| 105 | katappa |  70000 |      2 |
--+-----+---------+--------+--------+
--3 rows in set (0.00 sec)



mysql> SELECT * from subemployee where deptid in(select deptid from subdepartment where dname IN('IT', 'Finance'));

--+-----+---------+--------+--------+
--| eid | ename   | salary | deptid |
--+-----+---------+--------+--------+
--| 102 | rahul   |  50000 |      2 |
--| 103 | deepika |   6000 |      3 |
--| 105 | katappa |  70000 |      2 |
--+-----+---------+--------+--------+
--3 rows in set (0.00 sec)



WAQ TO DISPLAY ALL THE EMPLOYEES WHO ARE NOT WORKING IN IT.

mysql> SELECT *
    -> FROM subemployee
    -> WHERE deptid NOT IN (
    ->     SELECT deptid
    ->     FROM subdepartment
    ->     WHERE dname = 'IT'
    -> );
+-----+----------+--------+--------+
| eid | ename    | salary | deptid |
+-----+----------+--------+--------+
| 101 | amit     |   3000 |      1 |
| 103 | deepika  |   6000 |      3 |
| 104 | rashmika |  89000 |      1 |
+-----+----------+--------+--------+
3 rows in set (0.00 sec)




MULTIPLE COLUMN SUBQUERY:
==========================
IT returns two or more columns.

SYNTAX:
======

select column1, column2 from tablename where (column1, column2) in(select column1, column2 from tablename where condition); 


WAQ : TO FIND THE HIGHEST PAID EMPLOYEE FROM EACH DEPARTMENT. 


mysql> select * from subemployee;

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 101 | amit     |   3000 |      1 |
--| 102 | rahul    |  50000 |      2 |
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--5 rows in set (0.00 sec)


mysql> select * from subdepartment;

--+--------+---------+
--| deptid | dname   |
--+--------+---------+
--|      1 | HR      |
--|      2 | IT      |
--|      3 | Finance |
--+--------+---------+
--3 rows in set (0.00 sec)



mysql> select deptid, max(salary) from subemployee group by deptid;

--+--------+-------------+
--| deptid | max(salary) |
--+--------+-------------+
--|      1 |       89000 |
--|      2 |       70000 |
--|      3 |        6000 |
--+--------+-------------+
--3 rows in set (0.00 sec)


The above query is multiple column and multiple row subquery



mysql> SELECT * FROM subemployee WHERE(deptid, salary) IN (SELECT deptid, MAX(salary) FROM
    -> subemployee GROUP BY deptid);


--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--3 rows in set (0.01 sec)



WAQ. TO FIND EMPLOYEES WHOSE SALARY IS GREATER THEN ANY SALARY IN DEPARTMENT ONE.


mysql> select salary from subemployee where deptid =1;

--+--------+
--| salary |
--+--------+
--|   3000 |
--|  89000 |
--+--------+
--2 rows in set (0.00 sec)



mysql> select * from subemployee where salary > any( select salary from subemployee where deptid = 1);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 102 | rahul    |  50000 |      2 |
--| 103 | deepika  |   6000 |      3 |
--| 104 | rashmika |  89000 |      1 |
--| 105 | katappa  |  70000 |      2 |
--+-----+----------+--------+--------+
--4 rows in set (0.00 sec)



WAQ:  TO FIND ALL THE EMPLOYEES WHOSE SALARY IS GREATER THEN THE SALARY OF EVERY EMPLOYEE WORKING IN DEPARTMENT 1

mysql> select * from subemployee where salary > all( select salary from subemployee where deptid = 1);

--Empty set (0.00 sec)



WAQ:  TO FIND ALL THE EMPLOYEES WHOSE SALARY IS GREATER THEN THE SALARY OF EVERY EMPLOYEE WORKING IN DEPARTMENT 2

mysql> select * from subemployee where salary > all( select salary from subemployee where deptid = 2);

--+-----+----------+--------+--------+
--| eid | ename    | salary | deptid |
--+-----+----------+--------+--------+
--| 104 | rashmika |  89000 |      1 |
--+-----+----------+--------+--------+
--1 row in set (0.00 sec)




WAQ: TO FIND EMPLOYEES WHO EARN LESS THEN EVERY EMPLOYEE IN THE FINANCE DEPARTMENT. 

mysql> select * from subemployee where salary < all (select salary from subemployee where deptid = (select deptid from subdepartment where dname = 'Finance'));

--+-----+-------+--------+--------+
--| eid | ename | salary | deptid |
--+-----+-------+--------+--------+
--| 101 | amit  |   3000 |      1 |
--+-----+-------+--------+--------+
--1 row in set (0.00 sec)
