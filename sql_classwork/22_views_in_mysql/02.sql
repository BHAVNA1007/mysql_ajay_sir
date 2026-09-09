TYPES OF VIEW:
==============

1. Simple View
===============

Based on one table and a simple SELECT.

CREATE VIEW it_employees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE department = 'IT';

You have already done this.


2. View with WHERE

For example:

CREATE VIEW high_salary AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 70000;

This View shows only employees earning more than 70,000.



3. View with JOIN

Later we will have two tables:


4. View with GROUP BY
=====================

mysql> create view dept_salary as
    -> select department, AVG(salary) as avg_salary
    -> FROM employees
    -> GROUP BY department;
--Query OK, 0 rows affected (0.04 sec)



mysql> select * from dept_salary;

--+------------+--------------+
--| department | avg_salary   |
--+------------+--------------+
--| IT         | 78333.333333 |
--| HR         | 52500.000000 |
--| Finance    | 80000.000000 |
--+------------+--------------+
--3 rows in set (0.01 sec)


5. View with aggregate functions
================================
For example:

COUNT()
SUM()
AVG()
MAX()
MIN()


DELETE through a View
======================



mysql> DELETE FROM it_employees
    -> WHERE emp_id = 5;
--Query OK, 1 row affected (0.01 sec)

Delete this row from the real table through the View



mysql> SELECT * FROM employees;
--+--------+----------+------------+-----------+--------+
--| emp_id | emp_name | department | salary    | city   |
--+--------+----------+------------+-----------+--------+
--|      1 | Amit     | IT         | 100000.00 | Indore |
--|      2 | Rahul    | HR         |  50000.00 | Bhopal |
--|      4 | Neha     | Finance    |  80000.00 | Delhi  |
--|      6 | Sneha    | HR         |  55000.00 | Indore |
--|      7 | karan    | IT         |  70000.00 | Indore |
--+--------+----------+------------+-----------+--------+
--5 rows in set (0.00 sec)



mysql> SELECT * FROM it_employees;
--+--------+----------+-----------+
--| emp_id | emp_name | salary    |
--+--------+----------+-----------+
--|      1 | Amit     | 100000.00 |
--|      7 | karan    |  70000.00 |
--+--------+----------+-----------+
--2 rows in set (0.00 sec)




INSERT through a View:
----------------------

An INSERT through a View can work when MySQL can create a valid row in the underlying table from the values supplied through the View.

mysql> INSERT INTO it_employees
    -> VALUES (8, 'Karan', 70000);
Query OK, 1 row affected (0.01 sec)



mysql> select * from employees;
--+--------+----------+------------+-----------+--------+
--| emp_id | emp_name | department | salary    | city   |
--+--------+----------+------------+-----------+--------+
--|      1 | Amit     | IT         | 100000.00 | Indore |
--|      2 | Rahul    | HR         |  50000.00 | Bhopal |
--|      4 | Neha     | Finance    |  80000.00 | Delhi  |
--|      6 | Sneha    | HR         |  55000.00 | Indore |
--|      7 | karan    | IT         |  70000.00 | Indore |
--|      8 | Karan    | NULL       |  70000.00 | NULL   |
--+--------+----------+------------+-----------+--------+
--6 rows in set (0.00 sec)


WITH CHECK OPTION:
=================
WITH CHECK OPTION prevents INSERT or UPDATE through a View when the resulting row does not satisfy the View  WHERE condition.

Any INSERT or UPDATE through this View must still satisfy department = 'IT'.

mysql> create view it_employees_check AS
    -> SELECT emp_id, emp_name, department, salary, city
    -> FROM employees
    -> WHERE department = 'IT'
    -> WITH CHECK OPTION;
Query OK, 0 rows affected (0.03 sec)


mysql> SELECT * FROM it_employees_check;

--+--------+----------+------------+-----------+--------+
--| emp_id | emp_name | department | salary    | city   |
--+--------+----------+------------+-----------+--------+
--|      1 | Amit     | IT         | 100000.00 | Indore |
--|      7 | karan    | IT         |  70000.00 | Indore |
--+--------+----------+------------+-----------+--------+
--2 rows in set (0.00 sec)


mysql> UPDATE it_employees_check
    -> SET department = 'HR'
    -> WHERE emp_id = 1;

--ERROR 1369 (HY000): CHECK OPTION failed views_practice.it_employees_check


Why did MySQL reject it?
=========================

Your View says:

WHERE department = 'IT'
WITH CHECK OPTION

That means:

"This View only allows IT employees."




CREATE OR REPLACE VIEW
======================

If the View exists, replace its definition; if it does not exist, create it.
Suppose we have alredy this view 

mysql> create view employee_basic as
    -> select emp_id, emp_name, department, salary, city
    -> from employees;

--Query OK, 0 rows affected (0.01 sec)




later, we want to decide that we also want to show only IT employees.

THEN

Instead of dropping the view and creating it again, we can use :

mysql> create or replace view employee_basic as
    -> select emp_id, emp_name, department, salary, city
    -> from employees
    -> where department = 'IT';

--Query OK, 0 rows affected (0.01 sec)


mysql> SELECT * FROM employee_basic;

--+--------+----------+------------+-----------+--------+
--| emp_id | emp_name | department | salary    | city   |
--+--------+----------+------------+-----------+--------+
--|      1 | Amit     | IT         | 100000.00 | Indore |
--|      7 | karan    | IT         |  70000.00 | Indore |
--+--------+----------+------------+-----------+--------+
--2 rows in set (0.00 sec)

only The View definition has been replaced.


DROP VIEW:
==========

DROP VIEW is used when you no longer need a View and want to remove it.

Syntax

DROP VIEW view_name;



mysql> drop view employee_basic;
--Query OK, 0 rows affected (0.01 sec)


this removes the View, but it does not delete the original table or its data.

mysql> SELECT * FROM employee_basic;
--ERROR 1146 (42S02): Table 'views_practice.employee_basic' doesn't exist



SHOW CREATE VIEW
=================
It shows the definition of the View.

We have covered DROP VIEW. Now lets learn how to see the SQL definition of an existing View.

Syntax:

SHOW CREATE VIEW view_name;

mysql> SHOW CREATE VIEW it_employees_check;

--+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
--| View               | Create View                                                                                                                                                                                                                                                                                                                                                                     | character_set_client | collation_connection |
--+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
--| it_employees_check | CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `it_employees_check` AS select `employees`.`emp_id` AS `emp_id`,`employees`.`emp_name` AS `emp_name`,`employees`.`department` AS `department`,`employees`.`salary` AS `salary`,`employees`.`city` AS `city` from `employees` where (`employees`.`department` = 'IT') WITH CASCADED CHECK OPTION | cp850                | cp850_general_ci     |
--+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
--1 row in set (0.00 sec)


Why is this useful?
====================
Suppose you created a View a few days ago and forgot:

Which table it uses
Which columns it selects
What WHERE condition it has
Whether it has WITH CHECK OPTION





INFORMATION_SCHEMA.VIEWS
========================

INFORMATION_SCHEMA is a special area in MySQL that contains information about your database objects.

For Views, MySQL provides:
INFORMATION_SCHEMA.VIEWS


It can tell you things like:
============================
View name
Database name
The View definition
Whether it uses WITH CHECK OPTION
Security information


mysql> SELECT *
    -> FROM INFORMATION_SCHEMA.VIEWS;

    This may return many columns and rows. yes 111 rows



Instead, let make it easier:

mysql> SELECT TABLE_SCHEMA, TABLE_NAME, VIEW_DEFINITION
    -> FROM INFORMATION_SCHEMA.VIEWS
    -> WHERE TABLE_SCHEMA = 'views_practice';


--+----------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--| TABLE_SCHEMA   | TABLE_NAME         | VIEW_DEFINITION                                                                                                                                                                                                                                                                                                                                                     |
--+----------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--| views_practice | dept_salary        | select `views_practice`.`employees`.`department` AS `department`,avg(`views_practice`.`employees`.`salary`) AS `avg_salary` from `views_practice`.`employees` group by `views_practice`.`employees`.`department`                                                                                                                                                    |
--| views_practice | high_salary        | select `views_practice`.`employees`.`emp_id` AS `emp_id`,`views_practice`.`employees`.`emp_name` AS `emp_name`,`views_practice`.`employees`.`department` AS `department`,`views_practice`.`employees`.`salary` AS `salary`,`views_practice`.`employees`.`city` AS `city` from `views_practice`.`employees` where (`views_practice`.`employees`.`salary` > 70000)    |
--| views_practice | it_employees       | select `views_practice`.`employees`.`emp_id` AS `emp_id`,`views_practice`.`employees`.`emp_name` AS `emp_name`,`views_practice`.`employees`.`salary` AS `salary` from `views_practice`.`employees` where (`views_practice`.`employees`.`department` = 'IT')                                                                                                         |
--| views_practice | it_employees_check | select `views_practice`.`employees`.`emp_id` AS `emp_id`,`views_practice`.`employees`.`emp_name` AS `emp_name`,`views_practice`.`employees`.`department` AS `department`,`views_practice`.`employees`.`salary` AS `salary`,`views_practice`.`employees`.`city` AS `city` from `views_practice`.`employees` where (`views_practice`.`employees`.`department` = 'IT') |
--+----------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--4 rows in set (0.00 sec)




imple difference

We just learned:
=====================

SHOW CREATE VIEW it_employees_check;

This is mainly used to see the definition of one particular View.

Whereas:

SELECT ...
FROM INFORMATION_SCHEMA.VIEWS;

is useful when you want to inspect View information from the database metadata and can filter/search Views.


View with GROUP BY:
===================
GROUP BY combines employees belonging to the same department:

Suppose we want a View showing the average salary of each department.

mysql> CREATE VIEW dp_avg_salary AS
    -> SELECT department, AVG(salary) AS avg_salary
    -> FROM employees
    -> GROUP BY department;

--Query OK, 0 rows affected (0.01 sec)

mysql> select * from dp_avg_salary;

--+------------+--------------+
--| department | avg_salary   |
--+------------+--------------+
--| IT         | 85000.000000 |
--| HR         | 52500.000000 |
--| Finance    | 80000.000000 |
--| NULL       | 70000.000000 |
--+------------+--------------+
--4 rows in set (0.00 sec)

So the View gives us one result row per department, rather than one row per employee.


View containing GROUP BY is generally not updatable.

Why?

Because one View row can represent many real rows.

IT average salary
       ↓
Amit + Priya + other IT employees

if we change the average, MySQL doesn't know which employee's salary you want to change.


************************************************************


Aggregate Functions in a View
==============================
A View can also contain aggregate functions such as:

COUNT() → counts rows
SUM() → adds values
AVG() → calculates average
MAX() → highest value
MIN() → lowest value


COUNT(*) → counts rows
create a View that shows how many employees are in each department:

mysql> create view dp_employee_count as
    -> select department, count(*) AS emp_count
    -> FROM employees
    -> GROUP BY department;
Query OK, 0 rows affected (0.01 sec)



mysql> select * from dp_employee_count;
--+------------+-----------+
--| department | emp_count |
--+------------+-----------+
--| IT         |         2 |
--| HR         |         2 |
--| Finance    |         1 |
--| NULL       |         1 |
--+------------+-----------+
--4 rows in set (0.00 sec)

The View is storing the definition of the query, not a separate copy of these calculated results.


SUM():
======
total salary

mysql> CREATE VIEW dp_total_salary as
    -> select department, sum(salary) as total_salary
    -> from employees
    -> group by department;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from dp_total_salary;

--+------------+--------------+
--| department | total_salary |
--+------------+--------------+
--| IT         |    170000.00 |
--| HR         |    105000.00 |
--| Finance    |     80000.00 |
--| NULL       |     70000.00 |
--+------------+--------------+
--4 rows in set (0.00 sec)


MAX():
======
Highest salary

mysql> create view dp_max_salary as
    -> select department, max(salary) as highest_salary
    -> from employees
    -> group by department;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from dp_max_salary;

--+------------+----------------+
--| department | highest_salary |
--+------------+----------------+
--| IT         |      100000.00 |
--| HR         |       55000.00 |
--| Finance    |       80000.00 |
--| NULL       |       70000.00 |
--+------------+----------------+
--4 rows in set (0.00 sec)


MIN()
=====
LOWEST SALARY

mysql> CREATE VIEW dp_lowest_salary as
    -> select department, min(salary) as lowest_salary
    -> from employees
    -> group by department;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from dp_lowest_salary;

--+------------+---------------+
--| department | lowest_salary |
--+------------+---------------+
--| IT         |      70000.00 |
--| HR         |      50000.00 |
--| Finance    |      80000.00 |
--| NULL       |      70000.00 |
--+------------+---------------+
--4 rows in set (0.00 sec)


GROUP BY department
        +
Aggregate function
        ↓
Summary View

And these Views are generally non-updatable because they represent summaries rather than individual employee rows.

********************************************************************************************************************

Views with Calculated Expressions

A View does not have to show only existing columns. It can also show calculated values.

For example, 

suppose we want to show each employee salary after a 10% increase

mysql> CREATE VIEW employee_salary_hike AS
    -> select emp_id, emp_name, salary, salary*1.10 as new_salary
    -> from employees;
--Query OK, 0 rows affected (0.01 sec)


mysql> select * from employee_salary_hike;

--+--------+----------+-----------+-------------+
--| emp_id | emp_name | salary    | new_salary  |
--+--------+----------+-----------+-------------+
--|      1 | Amit     | 100000.00 | 110000.0000 |
--|      2 | Rahul    |  50000.00 |  55000.0000 |
--|      4 | Neha     |  80000.00 |  88000.0000 |
--|      6 | Sneha    |  55000.00 |  60500.0000 |
--|      7 | karan    |  70000.00 |  77000.0000 |
--|      8 | Karan    |  70000.00 |  77000.0000 |
--+--------+----------+-----------+-------------+
--6 rows in set (0.00 sec)


new_salary is not a real column in employees.
does not actually increase Amit salary.

It only calculates and displays what the salary would be after a 10% increase.

***************************************************************************

DISTINCT in a View :
===================

DISTINCT means :

Show only unique values; remove duplicates.
DISTINCT generally makes a View non-updatable.


mysql> create view employee_dp as
    -> select DISTINCT department
    -> from employees;

--Query OK, 0 rows affected (0.01 sec)


mysql> select * from employee_dp;

--+------------+
--| department |
--+------------+
--| IT         |
--| HR         |
--| Finance    |
--| NULL       |
--+------------+
--4 rows in set (0.00 sec)


A View using DISTINCT is not updatable.

Why?

Because the View may combine multiple rows into one unique result.

*****************************************************************

HAVING in a View :
==================
So HAVING filters the groups, not individual employees.


mysql> create view dp_avg_salary_with_having as
    -> select department, avg(salary) as avg_salary
    -> from employees
    -> GROUP BY department
    -> HAVING AVG(salary) > 60000;
--Query OK, 0 rows affected (0.03 sec)


mysql> select * from dp_avg_salary_with_having;

--+------------+--------------+
--| department | avg_salary   |
--+------------+--------------+
--| IT         | 85000.000000 |
--| Finance    | 80000.000000 |
--| NULL       | 70000.000000 |
--+------------+--------------+
--3 rows in set (0.00 sec)


GROUP BY
AVG()
HAVING

it is generally non-updatable.

That because the View represents department summaries, not individual employee rows.



ORDER BY in a View
==================

A View can contain ORDER BY to define the ordering of its result.


create a View showing employees from highest salary to lowest salary:

mysql> CREATE VIEW high_pay_employee as
    -> select emp_id, emp_name, department,  salary
    -> from employees
    -> ORDER BY salary DESC;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from  high_pay_employee;

--+--------+----------+------------+-----------+
--| emp_id | emp_name | department | salary    |
--+--------+----------+------------+-----------+
--|      1 | Amit     | IT         | 100000.00 |
--|      4 | Neha     | Finance    |  80000.00 |
--|      7 | karan    | IT         |  70000.00 |
--|      8 | Karan    | NULL       |  70000.00 |
--|      6 | Sneha    | HR         |  55000.00 |
--|      2 | Rahul    | HR         |  50000.00 |
--+--------+----------+------------+-----------+
--6 rows in set (0.00 sec)


LIMIT in a View:
================

LIMIT tells MySQL how many rows to return.

mysql> CREATE VIEW top_3_employee as
    -> select emp_id, emp_name, department, salary
    -> from employees
    -> order by salary desc limit 3;
Query OK, 0 rows affected (0.01 sec)



mysql> select * from top_3_employee;


--+--------+----------+------------+-----------+
--| emp_id | emp_name | department | salary    |
--+--------+----------+------------+-----------+
--|      1 | Amit     | IT         | 100000.00 |
--|      4 | Neha     | Finance    |  80000.00 |
--|      7 | karan    | IT         |  70000.00 |
--+--------+----------+------------+-----------+
--3 rows in set (0.00 sec)



Nested Views:
=============

This means:

A View can be created using another View.

You already have:

employees
   ↓
high_pay_employee  ← View

Now we can create another View from high_pay_employee.


mysql> CREATE VIEW top_2_employee as
    -> select emp_id, emp_name, salary
    -> from high_pay_employee
    -> limit 2;
Query OK, 0 rows affected (0.01 sec)



mysql> select * from top_2_employee;

--+--------+----------+-----------+
--| emp_id | emp_name | salary    |
--+--------+----------+-----------+
--|      1 | Amit     | 100000.00 |
--|      4 | Neha     |  80000.00 |
--+--------+----------+-----------+
--2 rows in set (0.00 sec)



View Dependencies
==================

A dependency means one database object depends on another object to work.

in the above example the
high_pay_employee depends on employees
top_2_employee depends on high_pay_employee

suppose we remove high_pay_salary  using

DROP VIEW employees_by_salary;

top_2_salary was using employees_by_salary, so its definition can no longer work correctly.

***************************************************************

View limitations
================

already covered:

GROUP BY → generally non-updatable
Aggregate functions → generally non-updatable
DISTINCT → non-updatable
Why summary/calculated Views cannot normally be updated

So we will not repeat View limitations.



************************************************************

View Security:
================

Views can help control what data a user is allowed to access

real table contains:

mysql> select * from employees;
+--------+----------+------------+-----------+--------+
| emp_id | emp_name | department | salary    | city   |
+--------+----------+------------+-----------+--------+
|      1 | Amit     | IT         | 100000.00 | Indore |
|      2 | Rahul    | HR         |  50000.00 | Bhopal |
|      4 | Neha     | Finance    |  80000.00 | Delhi  |
|      6 | Sneha    | HR         |  55000.00 | Indore |
|      7 | karan    | IT         |  70000.00 | Indore |
|      8 | Karan    | NULL       |  70000.00 | NULL   |
+--------+----------+------------+-----------+--------+
6 rows in set (0.00 sec)

if we do not want a particular user to see salary or other sensitive columns.

we can create a View that exposes only the columns they need:

mysql> CREATE VIEW employee_public AS
    -> SELECT emp_id, emp_name, department, city
    -> FROM employees;
Query OK, 0 rows affected (0.01 sec)


mysql> SELECT * FROM employee_public;
+--------+----------+------------+--------+
| emp_id | emp_name | department | city   |
+--------+----------+------------+--------+
|      1 | Amit     | IT         | Indore |
|      2 | Rahul    | HR         | Bhopal |
|      4 | Neha     | Finance    | Delhi  |
|      6 | Sneha    | HR         | Indore |
|      7 | karan    | IT         | Indore |
|      8 | Karan    | NULL       | NULL   |
+--------+----------+------------+--------+
6 rows in set (0.00 sec)

but the View itself does not expose the salary column.


MySQL Views have two important security modes:

SQL SECURITY DEFINER
SQL SECURITY INVOKER


DEFINER :	View creator/definer
INVOKER	: User using the View  /checks permissions based on the current user.



Normal View
→ mainly stores query definition
→ doesn't store separate result rows
→ doesn't automatically make queries faster

Performance can still be good if the base tables have appropriate indexes and the View/query is well designed.