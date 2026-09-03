aggregate function:
==================

an aggregate function performs a calculation  on a set of rows and returns one summarise result. 

they are used in bussiness reports, sales reports, e-comerce analytics etc.

it process on multiple rows.

count():
=======

it is use to count rows or non-null values. 

there are three forms available for these:

count(*)
count(column)
count(distinct column)


count(*): it counts rows.
=========================
no matter null or values it counts all. rows

mysql> select * from employeee;
+------+---------+-----------+
| id   | name    | salary    |
+------+---------+-----------+
|  101 | deepika | 899999.00 |
|  102 | null    | 899999.00 |
|  102 |         | 899999.00 |
+------+---------+-----------+
3 rows in set (0.03 sec)

mysql> select count(*) from employeee;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.01 sec)




count(column):
==============

it counts non-null values in that column

the diff count(*) and count(column) is:

count(*) : how many rows exists

count(column): how many rows excludes non-null


count(distinct column):  it counts unique non-null values
=======================

mysql> select * from employeee;
+------+---------+-----------+
| id   | name    | salary    |
+------+---------+-----------+
|  101 | deepika | 899999.00 |
|  102 | null    | 899999.00 |
|  102 |         | 899999.00 |
+------+---------+-----------+
3 rows in set (0.00 sec)

mysql> select count(distinct salary) from employeee;
+------------------------+
| count(distinct salary) |
+------------------------+
|                      1 |
+------------------------+
1 row in set (0.00 sec)


sum():
======

calculates the total of numeric values

it ignores the null values.

mysql> select * from gymmembers;
+----------+------------+----------------+------------+
| MemberID | MemberName | MembershipType | MonthlyFee |
+----------+------------+----------------+------------+
|      501 | John       | Premium        |    1200.00 |
|      503 | Daniel     | Basic          |     700.00 |
+----------+------------+----------------+------------+
2 rows in set (0.02 sec)


mysql> select sum(MonthlyFee) from gymmembers;
+-----------------+
| sum(MonthlyFee) |
+-----------------+
|         1900.00 |
+-----------------+
1 row in set (0.00 sec)



sum() with where:
=================

aggregate functions become more powerfull when combine with filtering.


mysql>  select salary from employee_s;
+----------+
| salary   |
+----------+
| 40000.00 |
| 55000.00 |
| 85000.00 |
| 35000.00 |
| 70000.00 |
| 42000.00 |
| 90000.00 |
| 30000.00 |
| 65000.00 |
| 28000.00 |
+----------+
10 rows in set (0.00 sec)


WAQ. TO give sum of all salaries above 50000.

mysql> select sum(salary) from employee_s where salary > 50000;
+-------------+
| sum(salary) |
+-------------+
|   365000.00 |
+-------------+
1 row in set (0.00 sec)

AVG():
======

calculates arithmetic mean.

IT Excludes null values. 


mysql>  select salary from employee_s;
+----------+
| salary   |
+----------+
| 40000.00 |
| 55000.00 |
| 85000.00 |
| 35000.00 |
| 70000.00 |
| 42000.00 |
| 90000.00 |
| 30000.00 |
| 65000.00 |
| 28000.00 |
+----------+
10 rows in set (0.00 sec)

mysql> select AVG(salary) from employee_s;
+--------------+
| AVG(salary)  |
+--------------+
| 54000.000000 |
+--------------+
1 row in set (0.00 sec)

MIN():
======

mysql>  select salary from employee_s;
+----------+
| salary   |
+----------+
| 40000.00 |
| 55000.00 |
| 85000.00 |
| 35000.00 |
| 70000.00 |
| 42000.00 |
| 90000.00 |
| 30000.00 |
| 65000.00 |
| 28000.00 |
+----------+
10 rows in set (0.00 sec)

it returns the smallest values.

mysql> select min(salary) from employee_s;
+-------------+
| min(salary) |
+-------------+
|    28000.00 |
+-------------+
1 row in set (0.00 sec)


mysql> select emp_name,min(salary) from employee_s;

ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'batch18.employee_s.emp_name'; this is incompatible with sql_mode=only_full_group_by


MAX():
======

mysql>  select salary from employee_s;
+----------+
| salary   |
+----------+
| 40000.00 |
| 55000.00 |
| 85000.00 |
| 35000.00 |
| 70000.00 |
| 42000.00 |
| 90000.00 |
| 30000.00 |
| 65000.00 |
| 28000.00 |
+----------+
10 rows in set (0.00 sec)

mysql> select MAX(salary) from employee_s;
+-------------+
| MAX(salary) |
+-------------+
|    90000.00 |
+-------------+
1 row in set (0.00 sec)

***************************************************************

mysql> SELECT COUNT(*) as total_emp, sum(salary) as totalsalary, avg(salary) as avgsalary, min(salary) as min_salary, max(salary) as max_salary from employee_s;


+-----------+-------------+--------------+------------+------------+
| total_emp | totalsalary | avgsalary    | min_salary | max_salary |
+-----------+-------------+--------------+------------+------------+
|        10 |   540000.00 | 54000.000000 |   28000.00 |   90000.00 |
+-----------+-------------+--------------+------------+------------+
1 row in set (0.00 sec)


***************************************************************


GROUP BY: 
========

is a sql clause use to divide rows into groups based on one or more columns so that aggregate function can perform calculation independently for each group. 

it converts a large collection of rows into logical groups and allow us to calculate summary. 

SYNTAX:
=======

SELECT COLUMN_NAME, AGGRIGATE_FUNCTION(COLUMN_NAME) FROM table_name GROUP BY column_name; 

WAQ  to find total salary paid by each department.
--------------------------------------------------

mysql> select department, sum(salary) from employee_s group by department;
+------------+-------------+
| department | sum(salary) |
+------------+-------------+
| IT         |   208000.00 |
| HR         |   105000.00 |
| Finance    |   132000.00 |
| Sales      |    95000.00 |
+------------+-------------+
4 rows in set (0.00 sec)


WAQ to find num of employees in each department.
------------------------------------------------

mysql> select department, count(*) from employee_s group by department;
+------------+----------+
| department | count(*) |
+------------+----------+
| IT         |        4 |
| HR         |        2 |
| Finance    |        2 |
| Sales      |        2 |
+------------+----------+
4 rows in set (0.00 sec)


mysql> select department, count(department) from employee_s group by department;
+------------+-------------------+
| department | count(department) |
+------------+-------------------+
| IT         |                 4 |
| HR         |                 2 |
| Finance    |                 2 |
| Sales      |                 2 |
+------------+-------------------+
4 rows in set (0.00 sec)


*************************************************************

when null values comes then:

mysql> select * from pystudent;
+------+---------+------+----------+
| id   | name    | age  | city     |
+------+---------+------+----------+
|  101 | bhavna  |   30 | chennai  |
|  102 | bhavna  | NULL | Hydrabad |
|  103 | bhavna  | NULL | Hydrabad |
|  102 | bhavna  |   20 | Hydrabad |
|  103 | thapaji |   21 | nepal    |
|  108 | riya    |   25 | devas    |
+------+---------+------+----------+
6 rows in set (0.02 sec)

mysql> select age, count(*) from pystudent group by age;
+------+----------+
| age  | count(*) |
+------+----------+
|   30 |        1 |
| NULL |        2 |
|   20 |        1 |
|   21 |        1 |
|   25 |        1 |
+------+----------+
5 rows in set (0.00 sec)

mysql> select age, count(age) from pystudent group by age;
+------+------------+
| age  | count(age) |
+------+------------+
|   30 |          1 |
| NULL |          0 |
|   20 |          1 |
|   21 |          1 |
|   25 |          1 |
+------+------------+
5 rows in set (0.00 sec)


NOTE:  is commonly used for :
=====

num of orders per customer

num of products per category

num of students per course

==============================================

count(*): will count all the rows.

count(column): ignores null.
==============================================


WAQ  to find avg salary of each department.

mysql> select department, avg(salary) from employee_s group by department;


mysql>  select department, salary from employee_s;
+------------+----------+
| department | salary   |
+------------+----------+
| IT         | 40000.00 |
| IT         | 55000.00 |
| IT         | 85000.00 |
| HR         | 35000.00 |
| HR         | 70000.00 |
| Finance    | 42000.00 |
| Finance    | 90000.00 |
| Sales      | 30000.00 |
| Sales      | 65000.00 |
| IT         | 28000.00 |
+------------+----------+
10 rows in set (0.00 sec)

+------------+--------------+
| department | avg(salary)  |
+------------+--------------+
| IT         | 52000.000000 |
| HR         | 52500.000000 |
| Finance    | 66000.000000 |
| Sales      | 47500.000000 |
+------------+--------------+
4 rows in set (0.00 sec)



************************************************************

mysql> select city, avg(age) from pystudent group by city;

+----------+----------+
| city     | avg(age) |
+----------+----------+
| chennai  |  30.0000 |
| Hydrabad |  20.0000 |
| nepal    |  21.0000 |
| devas    |  25.0000 |
+----------+----------+
4 rows in set (0.00 sec)



*************************************************************

WAQ TO FIND lowest and higest salary in each department.


mysql> select department, max(salary), MIN(salary) from employee_s group by department;

+------------+-------------+-------------+
| department | max(salary) | MIN(salary) |
+------------+-------------+-------------+
| IT         |    85000.00 |    28000.00 |
| HR         |    70000.00 |    35000.00 |
| Finance    |    90000.00 |    42000.00 |
| Sales      |    65000.00 |    30000.00 |
+------------+-------------+-------------+
4 rows in set (0.00 sec)
**************************************************************



GROUP BY with multiple columns:
===============================

mysql>  select * from employee_s;
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
| emp_id | emp_name    | email            | phone      | department | designation     | age | salary   | experience | joining_year | status   | bonus    |
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
|      1 | Amit Sharma | amit@gmail.com   | 9876500001 | IT         | Developer       |  25 | 40000.00 |          4 |         2022 | Active   |  5000.00 |
|      2 | Priya Verma | priya@gmail.com  | 9876500002 | IT         | Tester          |  30 | 55000.00 |          8 |         2018 | Active   |  8000.00 |
|      3 | Rahul Singh | rahul@gmail.com  | 9876500003 | IT         | Team Lead       |  40 | 85000.00 |         15 |         2011 | Active   | 15000.00 |
|      4 | Neha Patel  | neha@gmail.com   | 9876500004 | HR         | HR Executive    |  28 | 35000.00 |          5 |         2021 | Active   |  3000.00 |
|      5 | Vikas Gupta | vikas@gmail.com  | 9876500005 | HR         | HR Manager      |  38 | 70000.00 |         12 |         2014 | Inactive |     0.00 |
|      6 | Sneha Jain  | sneha@gmail.com  | 9876500006 | Finance    | Accountant      |  27 | 42000.00 |          6 |         2020 | On Leave |  8000.00 |
|      7 | Rohit Mehta | rohit@gmail.com  | 9876500007 | Finance    | Finance Manager |  45 | 90000.00 |         20 |         2006 | Active   | 18000.00 |
|      8 | Kavita Rao  | kavita@gmail.com | 9876500008 | Sales      | Sales Executive |  24 | 30000.00 |          3 |         2023 | Active   |  2000.00 |
|      9 | Arjun Joshi | arjun@gmail.com  | 9876500009 | Sales      | Sales Manager   |  35 | 65000.00 |         10 |         2016 | On Leave | 12000.00 |
|     10 | Pooja Yadav | pooja@gmail.com  | 9876500010 | IT         | Developer       |  22 | 28000.00 |          1 |         2025 | Inactive |     0.00 |
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
10 rows in set (0.00 sec)




mysql> select  department, designation, count(*) from employee_s group by department,  designation;
+------------+-----------------+----------+
| department | designation     | count(*) |
+------------+-----------------+----------+
| IT         | Developer       |        2 |
| IT         | Tester          |        1 |
| IT         | Team Lead       |        1 |
| HR         | HR Executive    |        1 |
| HR         | HR Manager      |        1 |
| Finance    | Accountant      |        1 |
| Finance    | Finance Manager |        1 |
| Sales      | Sales Executive |        1 |
| Sales      | Sales Manager   |        1 |
+------------+-----------------+----------+
9 rows in set (0.00 sec)


NOTE: The above example create a group for every unique combination of department and designation .



**********************************************************


WAQ TO FIND TOTAL SALES CITY WISE
------------------------------------

mysql> SELECT * FROM grporder;
+---------+----------+--------+-----------------+----------+
| orderid | cname    | city   | productcatagory | amount   |
+---------+----------+--------+-----------------+----------+
|     111 | DEEPIKA  | MUMBAI | ELECTRONICS     | 15000.00 |
|     112 | RASHMIKA | MUMBAI | CLOTHS          |  5000.00 |
|     113 | KATAPPA  | INDORE | CLOTHS          |  6000.00 |
|     114 | VAIBHAV  | INDORE | ELECTRONICS     | 12000.00 |
+---------+----------+--------+-----------------+----------+
4 rows in set (0.00 sec)


mysql> SELECT city, sum(amount) from grporder group by city;
+--------+-------------+
| city   | sum(amount) |
+--------+-------------+
| MUMBAI |    20000.00 |
| INDORE |    18000.00 |
+--------+-------------+
2 rows in set (0.00 sec)



WAQ TO FIND TOTAL SALES FOR EACH CITY AND PRODUCT CATAGORY.
------------------------------------------------------------

mysql> SELECT city, productcatagory, sum(amount) from grporder group by city, productcatagory;
+--------+-----------------+-------------+
| city   | productcatagory | sum(amount) |
+--------+-----------------+-------------+
| MUMBAI | ELECTRONICS     |    15000.00 |
| MUMBAI | CLOTHS          |     5000.00 |
| INDORE | CLOTHS          |     6000.00 |
| INDORE | ELECTRONICS     |    12000.00 |
+--------+-----------------+-------------+