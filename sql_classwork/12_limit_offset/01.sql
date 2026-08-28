order by on expression:


mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.04 sec)



mysql> select name, salary, salary*12 as annual_salary from employeebatch order by salary*12 desc;
+-------+----------+---------------+
| name  | salary   | annual_salary |
+-------+----------+---------------+
| neha  | 60000.00 |     720000.00 |
| priya | 55000.00 |     660000.00 |
| Rahul | 45000.00 |     540000.00 |
| amit  | 40000.00 |     480000.00 |
| ravi  | 35000.00 |     420000.00 |
+-------+----------+---------------+
5 rows in set (0.01 sec)



mysql> select name, salary, salary*12 as annual_salary from employeebatch order by annual_salary desc;
+-------+----------+---------------+
| name  | salary   | annual_salary |
+-------+----------+---------------+
| neha  | 60000.00 |     720000.00 |
| priya | 55000.00 |     660000.00 |
| Rahul | 45000.00 |     540000.00 |
| amit  | 40000.00 |     480000.00 |
| ravi  | 35000.00 |     420000.00 |
+-------+----------+---------------+
5 rows in set (0.00 sec)



order by with distinct:


mysql> select distinct city from employeebatch order by city;
+--------+
| city   |
+--------+
| NULL   |
| bhopal |
| indore |
| pune   |
+--------+
4 rows in set (0.01 sec)


WAQ to get a emplyee from indore or bhopal arrange them by highest salary first  and if two emloyee same salary arrange by younger first.

mysql> select name, city, age, salary from employeebatch where city in('indore', 'bhopal') order by salary desc, age asc;
+-------+--------+------+----------+
| name  | city   | age  | salary   |
+-------+--------+------+----------+
| priya | indore |   28 | 55000.00 |
| Rahul | indore |   25 | 45000.00 |
| ravi  | bhopal |   22 | 35000.00 |
+-------+--------+------+----------+
3 rows in set (0.00 sec)


LIMIT: 

is use to restrict the number of rows return by a select query.


mysql> select * from employeebatch limit 2;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)




WAQ TO GET 3 HIGHEST PAID EMPLOYEES

mysql> select * from employeebatch order by salary desc limit 3;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


WAQ TO GET  LOWEST SALARY  EMPLOYEES.

mysql> select * from employeebatch order by salary ASC limit 1;
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
1 row in set (0.00 sec)



************************************

mysql> select name, department, salary from employeebatch where department = 'IT' order by salary desc limit 1;
+-------+------------+----------+
| name  | department | salary   |
+-------+------------+----------+
| priya | IT         | 55000.00 |
+-------+------------+----------+
1 row in set (0.02 sec)

***********************************


NOTE: IF we give more value in limit then it will not produce an error it will just give the available rows.

mysql> select * from employeebatch order by salary ASC limit 100;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)


WAQ TO GIVE  TWO HIGHEST PAID EMPLOYEE WHOSE SALARY GREATER THEN 50000

mysql> select * from employeebatch where salary>50000 order by salary desc limit 2;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)



***********************************
-1 not allowed with limit
++++++++++++++++++++++++++++

mysql> select * from employeebatch where salary>50000 order by salary desc limit -1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-1' at line 1
***********************************



DISTINCT WITH LIMIT:

mysql> SELECT DISTINCT CITY FROM employeebatch limit 2;
+--------+
| CITY   |
+--------+
| indore |
| NULL   |
+--------+
2 rows in set (0.00 sec)


WAQ TO FIND TWO EMPLOYEES WITH THE HIGHEST ANNUAL SALARY.

mysql> select name, salary, salary*12 as annual_salary from employeebatch order by annual_salary desc limit 2;
+-------+----------+---------------+
| name  | salary   | annual_salary |
+-------+----------+---------------+
| neha  | 60000.00 |     720000.00 |
| priya | 55000.00 |     660000.00 |
+-------+----------+---------------+
2 rows in set (0.00 sec)


OFFSET:

is use to skip a specified num of rows befor returning the result. 

SYNTAX:

select column1, column2 from tablename limit numberofrows offset numofrowsskip;


mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)



mysql> select * from employeebatch limit 2 offset 2;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)




WAQ TO FIND 3RD AND 4TH HIGHEST PAID EMPLOYEES.

mysql> select * from employeebatch order by salary desc limit 2 offset 2;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)





mysql> select * from employeebatch where department ='IT' order by salary desc limit 3 offset 1;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)

the above query showing the higest paid employees but skip the higest 1.


*******************************************************************
order operation in mysql:

select....choose column......from.....choose table...... where.....filter rows..... order by....sort rows.......limit....how many rows..... offset.....how many rows to skip

*******************************************************************

2,2 automatic added offset:  1st is offset,  2nd is limit 

mysql> select * from employeebatch order by salary desc limit 2, 2;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)




DML: 

UPDATE : IS A DML command which is used to modify existing record in a table. 

SYNTAX:

update tablename set column1= value1, column2= value2... where condition


in the above syntax where is not mendatory but without where every row updated.

