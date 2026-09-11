joins :
=======

a join is use to combine rows from two or more tables basesd on related comlumn or logical conditions.

in a properly design relational database information is usually divided into multiple tables to avoid duplication and to fatch data from all the tables we requires joins. 

A join does not nessessary require a foreign key. 

A foreign key stablish referencial  integrity whereease join stablish a relationship for a particular query. 


mysql> SELECT * FROM EMPLOYEE18;

--+-------+---------+--------+
--| empid | empname | deptid |
--+-------+---------+--------+
--|   101 | deepika |      1 |
--|   103 | thapaji |      3 |
--|   104 | kanak   |      1 |
--|   105 | katappa |   NULL |
--+-------+---------+--------+
--4 rows in set (0.02 sec)



mysql> SELECT * FROM DEPARTMENT18;

--+--------+----------+
--| deptid | deptname |
--+--------+----------+
--|      1 | hr_IT    |
--|      3 | finance  |
--+--------+----------+
--2 rows in set (0.02 sec)



mysql> insert into DEPARTMENT18 values(2, 'marketing'),(4, 'sales');

--Query OK, 2 rows affected (0.01 sec)
--Records: 2  Duplicates: 0  Warnings: 0




mysql> SELECT * FROM DEPARTMENT18;

--+--------+-----------+
--| deptid | deptname  |
--+--------+-----------+
--|      1 | hr_IT     |
--|      2 | marketing |
--|      3 | finance   |
--|      4 | sales     |
--+--------+-----------+
--4 rows in set (0.00 sec)




mysql> insert into EMPLOYEE18 values(106, 'rashmika', 4);

--Query OK, 1 row affected (0.01 sec)



mysql> SELECT * FROM EMPLOYEE18;

--+-------+----------+--------+
--| empid | empname  | deptid |
--+-------+----------+--------+
--|   101 | deepika  |      1 |
--|   103 | thapaji  |      3 |
--|   104 | kanak    |      1 |
--|   105 | katappa  |   NULL |
--|   106 | rashmika |      4 |
--+-------+----------+--------+
--5 rows in set (0.00 sec)



mysql> update  DEPARTMENT18 set deptname = 'HR' where deptid = 1;

--Query OK, 1 row affected (0.01 sec)
--Rows matched: 1  Changed: 1  Warnings: 0




mysql> SELECT * FROM DEPARTMENT18;

--+--------+-----------+
--| deptid | deptname  |
--+--------+-----------+
--|      1 | HR        |
--|      2 | marketing |
--|      3 | finance   |
--|      4 | sales     |
--+--------+-----------+
--4 rows in set (0.00 sec)




SYNTAX
======

select column1, column2 from table1 join table2 on table1.column = table2.column;


mysql> select employee18.empname, department18.deptname from   employee18 join department18 on employee18.deptid = department18.deptid;

--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| kanak    | HR       |
--| thapaji  | finance  |
--| rashmika | sales    |
--+----------+----------+
--4 rows in set (0.00 sec)




mysql> select e.empname, d.deptname from  employee18 as e join department18 as d on e.deptid = d.deptid;


--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| kanak    | HR       |
--| thapaji  | finance  |
--| rashmika | sales    |
--+----------+----------+
--4 rows in set (0.00 sec)




NOTE: THE ON clause specify the join condition used to determine which rows from two or more tables are related and should be combine

it tells the db engine how rows from the participatig table matched in our case :

 on e.deptid = d.deptid;

 it means match an employee row department row when the employee department id is equal to the depatments department id.


mysql> select * from  employee18 as e join department18 as d on e.deptid = d.deptid;

--+-------+----------+--------+--------+----------+
--| empid | empname  | deptid | deptid | deptname |
--+-------+----------+--------+--------+----------+
--|   101 | deepika  |      1 |      1 | HR       |
--|   104 | kanak    |      1 |      1 | HR       |
--|   103 | thapaji  |      3 |      3 | finance  |
--|   106 | rashmika |      4 |      4 | sales    |
--+-------+----------+--------+--------+----------+
--4 rows in set (0.00 sec)


workflow:
========
  
employee.....

department.....

   on condition.....

find matching rows....

  combinined matching raows.....

.... generate result  



mysql> select e.empname, d.deptname from  employee18 as e join department18 as d on e.deptid <> d.deptid;


--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | sales     |
--| deepika  | finance   |
--| deepika  | marketing |
--| thapaji  | sales     |
--| thapaji  | marketing |
--| thapaji  | HR        |
--| kanak    | sales     |
--| kanak    | finance   |
--| kanak    | marketing |
--| rashmika | finance   |
--| rashmika | marketing |
--| rashmika | HR        |
--+----------+-----------+
--12 rows in set (0.01 sec)




mysql> select e.empname, d.deptname from  employee18 as e join department18 as d;

--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | sales     |
--| deepika  | finance   |
--| deepika  | marketing |
--| deepika  | HR        |
--| thapaji  | sales     |
--| thapaji  | finance   |
--| thapaji  | marketing |
--| thapaji  | HR        |
--| kanak    | sales     |
--| kanak    | finance   |
--| kanak    | marketing |
--| kanak    | HR        |
--| katappa  | sales     |
--| katappa  | finance   |
--| katappa  | marketing |
--| katappa  | HR        |
--| rashmika | sales     |
--| rashmika | finance   |
--| rashmika | marketing |
--| rashmika | HR        |
--+----------+-----------+
--20 rows in set (0.00 sec)



