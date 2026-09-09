The View is like a window through which you look at the employees table.


              WINDOW
                 ↓
        ┌─────────────────┐
        │  it_employees   │
        │      VIEW       │
        └────────┬────────┘
                 │
                 ↓
        ┌─────────────────┐
        │    employees    │
        │   REAL TABLE    │
        └─────────────────┘

Change the real table → View shows the changed data.



mysql> create database views_practice;
--Query OK, 1 row affected (0.03 sec)


mysql> use views_practice
--Database changed


mysql> CREATE TABLE employees (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     salary DECIMAL(10,2),
    ->     city VARCHAR(30)
    -> );
--Query OK, 0 rows affected (0.04 sec)



mysql> desc employees;

--+------------+---------------+------+-----+---------+-------+
--| Field      | Type          | Null | Key | Default | Extra |
--+------------+---------------+------+-----+---------+-------+
--| emp_id     | int           | NO   | PRI | NULL    |       |
--| emp_name   | varchar(50)   | YES  |     | NULL    |       |
--| department | varchar(30)   | YES  |     | NULL    |       |
--| salary     | decimal(10,2) | YES  |     | NULL    |       |
--| city       | varchar(30)   | YES  |     | NULL    |       |
--+------------+---------------+------+-----+---------+-------+
--5 rows in set (0.03 sec)


mysql> INSERT INTO employees VALUES
    -> (1, 'Amit', 'IT', 60000, 'Indore'),
    -> (2, 'Rahul', 'HR', 50000, 'Bhopal'),
    -> (3, 'Priya', 'IT', 75000, 'Indore'),
    -> (4, 'Neha', 'Finance', 80000, 'Delhi'),
    -> (5, 'Vikas', 'IT', 65000, 'Bhopal'),
    -> (6, 'Sneha', 'HR', 55000, 'Indore');
--Query OK, 6 rows affected (0.01 sec)
--Records: 6  Duplicates: 0  Warnings: 0


mysql> select * from employees;

--+--------+----------+------------+----------+--------+
--| emp_id | emp_name | department | salary   | city   |
--+--------+----------+------------+----------+--------+
--|      1 | Amit     | IT         | 60000.00 | Indore |
--|      2 | Rahul    | HR         | 50000.00 | Bhopal |
--|      3 | Priya    | IT         | 75000.00 | Indore |
--|      4 | Neha     | Finance    | 80000.00 | Delhi  |
--|      5 | Vikas    | IT         | 65000.00 | Bhopal |
--|      6 | Sneha    | HR         | 55000.00 | Indore |
--+--------+----------+------------+----------+--------+
--6 rows in set (0.01 sec)



Creating  View
===============

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;




mysql> CREATE VIEW it_employees AS
    -> SELECT emp_id, emp_name, salary
    -> FROM employees
    -> WHERE department = 'IT';

--Query OK, 0 rows affected (0.02 sec)


mysql> SELECT * FROM it_employees;

--+--------+----------+----------+
--| emp_id | emp_name | salary   |
--+--------+----------+----------+
--|      1 | Amit     | 60000.00 |
--|      3 | Priya    | 75000.00 |
--|      5 | Vikas    | 65000.00 |
--+--------+----------+----------+
--3 rows in set (0.01 sec)

The View gives us a virtual representation of the result of a query.


Notice that we didnt write:
--------------------------
SELECT * FROM employees
WHERE department = 'IT';

Instead, we can simply write:
----------------------------
SELECT * FROM it_employees;



Thats one major purpose of a View: encapsulating/reusing a query as a database object.


The View does not normally create an independent copy of these rows.

Instead, MySQL keeps the definition of the View and uses that definition when you query the View.

So when you do:

SELECT * FROM it_employees;

the View gives you the result based on its underlying query.



How do we use a View?
=====================

the View almost like a table when reading data.

1. see all data
----------------

mysql> SELECT * FROM it_employees;

--+--------+----------+----------+
--| emp_id | emp_name | salary   |
--+--------+----------+----------+
--|      1 | Amit     | 90000.00 |
--|      3 | Priya    | 75000.00 |
--|      5 | Vikas    | 65000.00 |
--+--------+----------+----------+
--3 rows in set (0.00 sec)


2. select specific columns
--------------------------

mysql> SELECT emp_name, salary
    -> FROM it_employees;


--+----------+----------+
--| emp_name | salary   |
--+----------+----------+
--| Amit     | 90000.00 |
--| Priya    | 75000.00 |
--| Vikas    | 65000.00 |
--+----------+----------+
--3 rows in set (0.00 sec)


3. use where
------------

mysql> select * from it_employees where salary > 70000;

--+--------+----------+----------+
--| emp_id | emp_name | salary   |
--+--------+----------+----------+
--|      1 | Amit     | 90000.00 |
--|      3 | Priya    | 75000.00 |
--+--------+----------+----------+
--2 rows in set (0.00 sec)



View vs Table:
==============

table: contains the actual data.
view : like a window showing selected data from the table.


| Table                         | View                                       |
| ----------------------------- | ------------------------------------------ |
| Stores actual data            | Shows data from one or more tables         |
| Is a physical data object     | Is a virtual table                         |
| Can exist independently       | Usually depends on its underlying table(s) |
| Can contain all kinds of data | Contains the result defined by its query   |


Another example with another view:
----------------------------------

mysql> CREATE VIEW high_salary AS
    -> SELECT *
    -> FROM employees
    -> WHERE salary > 70000;

--Query OK, 0 rows affected (0.02 sec)


mysql> SELECT * FROM high_salary;

--+--------+----------+------------+----------+--------+
--| emp_id | emp_name | department | salary   | city   |
--+--------+----------+------------+----------+--------+
--|      1 | Amit     | IT         | 90000.00 | Indore |
--|      3 | Priya    | IT         | 75000.00 | Indore |
--|      4 | Neha     | Finance    | 80000.00 | Delhi  |
--+--------+----------+------------+----------+--------+
--3 rows in set (0.01 sec)


we delete priya from the employees table:

mysql> delete from employees where emp_id = 3;

--Query OK, 1 row affected (0.01 sec)



mysql> SELECT * FROM high_salary;

--+--------+----------+------------+----------+--------+
--| emp_id | emp_name | department | salary   | city   |
--+--------+----------+------------+----------+--------+
--|      1 | Amit     | IT         | 90000.00 | Indore |
--|      4 | Neha     | Finance    | 80000.00 | Delhi  |
--+--------+----------+------------+----------+--------+
--2 rows in set (0.00 sec)


So:

Change table → View reflects the change 
Delete from table → View reflects the deletion 
Add matching data to table → View can show it 


mysql> insert into employees
    -> values(7, 'karan', 'IT', 70000, 'Indore');

--Query OK, 1 row affected (0.01 sec)



mysql> select * from it_employees;

--+--------+----------+----------+
--| emp_id | emp_name | salary   |
--+--------+----------+----------+
--|      1 | Amit     | 90000.00 |
--|      5 | Vikas    | 65000.00 |
--|      7 | karan    | 70000.00 |
--+--------+----------+----------+
--3 rows in set (0.01 sec)





mysql> update it_employees
    -> set salary = 100000
    -> where emp_id = 1;

--Query OK, 1 row affected (0.03 sec)
--Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from employees;

--+--------+----------+------------+-----------+--------+
--| emp_id | emp_name | department | salary    | city   |
--+--------+----------+------------+-----------+--------+
--|      1 | Amit     | IT         | 100000.00 | Indore |
--|      2 | Rahul    | HR         |  50000.00 | Bhopal |
--|      4 | Neha     | Finance    |  80000.00 | Delhi  |
--|      5 | Vikas    | IT         |  65000.00 | Bhopal |
--|      6 | Sneha    | HR         |  55000.00 | Indore |
--|      7 | karan    | IT         |  70000.00 | Indore |
--+--------+----------+------------+-----------+--------+
--6 rows in set (0.00 sec)


mysql> select * from it_employees;

--+--------+----------+-----------+
--| emp_id | emp_name | salary    |
--+--------+----------+-----------+
--|      1 | Amit     | 100000.00 |
--|      5 | Vikas    |  65000.00 |
--|      7 | karan    |  70000.00 |
--+--------+----------+-----------+
--3 rows in set (0.00 sec)



why did both change?
---------------------

Remember our window example .

The View is looking at the real table.

***************************************************************************************

In **MySQL**, views can be understood mainly in these types:

### 1. Simple View

A view based on **one table** and usually does not contain complex operations like joins, grouping, or aggregation.

```sql
CREATE VIEW employee_view AS
SELECT employee_id, name, salary
FROM employees;
```

**Use:** To show only selected columns/rows from a table.

---

### 2. Complex View

A view that uses more complex SQL operations such as:

* Multiple tables
* `JOIN`
* `GROUP BY`
* Aggregate functions (`SUM()`, `AVG()`, `COUNT()`)
* `HAVING`
* Subqueries

Example:

```sql
CREATE VIEW dept_salary AS
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

---

### 3. Updatable View

A view through which you can perform:

```sql
INSERT
UPDATE
DELETE
```

and the changes are reflected in the underlying base table, **provided the view satisfies MySQL updatability rules**.

Example:

```sql
CREATE VIEW emp_view AS
SELECT employee_id, name, salary
FROM employees;
```

Then:

```sql
UPDATE emp_view
SET salary = 50000
WHERE employee_id = 101;
```

The corresponding row in `employees` is updated.

---

### 4. Non-Updatable View

A view through which you **cannot directly modify the underlying table**.

Views containing things such as `GROUP BY`, aggregate functions, `DISTINCT`, certain subqueries, `UNION`, etc. are generally non-updatable.

Example:

```sql
CREATE VIEW salary_summary AS
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

You can `SELECT` from it, but you cannot normally update the individual employee salary through this view.

---

### Important clarification

You may also hear **"materialized view"** mentioned. **MySQL does not have native materialized views like Oracle/PostgreSQL.** A normal MySQL view stores the **query definition**, not the result data physically.

So for your MySQL study, remember:

**Views →**

1. Simple View
2. Complex View
3. Updatable View
4. Non-Updatable View

And **updatable/non-updatable** is about whether the view can be modified, while **simple/complex** describes how the view's query is constructed.

