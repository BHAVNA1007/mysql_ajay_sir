1. What is an Index in MySQL?
==============================

An index is a data structure that helps MySQL find rows faster.

Think about a book.
Suppose you have a 1,000-page book and want to find:

"Normalization"

Without an index : You may have to search page by page.
================

Page 1
Page 2
Page 3
...
Page 500
...



With an index :  Normalization → Page 750
===============
You directly go near page 750.

MySQL indexes work with the same basic idea.



mysql> CREATE DATABASE indexing_practice;
Query OK, 1 row affected (0.07 sec)

mysql> USE indexing_practice;
Database changed
mysql> CREATE TABLE employees (
    ->     employee_id INT PRIMARY KEY,
    ->     employee_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     salary INT,
    ->     city VARCHAR(30),
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO employees
    -> (employee_id, employee_name, department, salary, city, email)
    -> VALUES
    -> (1, 'Amit', 'IT', 50000, 'Bhopal', 'amit@gmail.com'),
    -> (2, 'Riya', 'HR', 45000, 'Indore', 'riya@gmail.com'),
    -> (3, 'Rahul', 'IT', 60000, 'Bhopal', 'rahul@gmail.com'),
    -> (4, 'Neha', 'Finance', 55000, 'Delhi', 'neha@gmail.com'),
    -> (5, 'Pooja', 'HR', 48000, 'Indore', 'pooja@gmail.com'),
    -> (6, 'Vikas', 'IT', 70000, 'Pune', 'vikas@gmail.com'),
    -> (7, 'Anjali', 'Finance', 65000, 'Bhopal', 'anjali@gmail.com'),
    -> (8, 'Rohit', 'IT', 52000, 'Indore', 'rohit@gmail.com');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> desc employees;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| employee_id   | int          | NO   | PRI | NULL    |       |
| employee_name | varchar(50)  | YES  |     | NULL    |       |
| department    | varchar(30)  | YES  |     | NULL    |       |
| salary        | int          | YES  |     | NULL    |       |
| city          | varchar(30)  | YES  |     | NULL    |       |
| email         | varchar(100) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

mysql> select * from employees;
+-------------+---------------+------------+--------+--------+------------------+
| employee_id | employee_name | department | salary | city   | email            |
+-------------+---------------+------------+--------+--------+------------------+
|           1 | Amit          | IT         |  50000 | Bhopal | amit@gmail.com   |
|           2 | Riya          | HR         |  45000 | Indore | riya@gmail.com   |
|           3 | Rahul         | IT         |  60000 | Bhopal | rahul@gmail.com  |
|           4 | Neha          | Finance    |  55000 | Delhi  | neha@gmail.com   |
|           5 | Pooja         | HR         |  48000 | Indore | pooja@gmail.com  |
|           6 | Vikas         | IT         |  70000 | Pune   | vikas@gmail.com  |
|           7 | Anjali        | Finance    |  65000 | Bhopal | anjali@gmail.com |
|           8 | Rohit         | IT         |  52000 | Indore | rohit@gmail.com  |
+-------------+---------------+------------+--------+--------+------------------+
8 rows in set (0.00 sec)



1. SUPPOSE WE RUN:

SELECT * FROM employees WHERE employee_name = 'Rahul':

AT a conceptual level, if there is no suitable INDEX on employee_name , MYSQL may need to examine many rows to find the matching row.


*******************************************
FOR SMALL TABLE IT DOES NOT MATTER MUCH 

BUT  IF WE HAVE 1000000000  ROWS TABLE 

Searching becomes increasingly expensive.
==============================================

That is where INDEXES becomes importand.


CREATE INDEX:
=============

CREATE INDEX index_name
ON table_name(column_name);

create an index on employee_name.

mysql> CREATE INDEX idx_employee_name ON employees(employee_name);

Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0


CREATE INDEX
      ↓
idx_employee_name (This is simply the name we gave to the index.   idx_columnname)
      ↓
employees(employee_name)


Check the Index:
================

mysql> SHOW INDEX FROM employees;

+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name          | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employees |          0 | PRIMARY           |            1 | employee_id   | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employees |          1 | idx_employee_name |            1 | employee_name | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.02 sec)



we see here 

PRIMARY
idx_employee_name

WHY PRIMARY :
===========
 employee_id int primary key : A primary key is automatically indexed in MySQL.



Table
  ↓
Actual row data

Index
  ↓
Search-friendly structure
  ↓
Helps MySQL locate rows (corresponding table rows)

The exact internal implementation depends on the storage engine; for normal MySQL/InnoDB tables, indexes are B-tree-based structures.



7. Unique Index:
================

CREATE UNIQUE INDEX idx_email
ON employees(email);


| Index        | `Non_unique` |
| ------------ | -----------: |
| Normal index |            1 |
| Unique index |            0 |



mysql> INSERT INTO employees
    -> (employee_id, employee_name, department, salary, city, email)
    -> VALUES
    -> (9, 'Karan', 'IT', 55000, 'Indore', 'rahul@gmail.com');

--ERROR 1062 (23000): Duplicate entry 'rahul@gmail.com' for key 'employees.idx_email'

UNIQUE constraint vs UNIQUE index
==================================

UNIQUE constraint: Business/data rule: this value must be unique
UNIQUE index: Create an index structure that also enforces uniqueness

They are closely related, but their purpose is different.




composite indexes:
=================
A composite index is an index created on two or more columns. It is useful for queries that filter, sort, or otherwise access data using the indexed columns, particularly according to the indexs leading-column order.

A UNIQUE index does two things:

Creates an index.
Prevents duplicate values in that indexed column.

CREATE INDEX idx_dept_city
ON employees(department, city);


Why do we need a Composite Index?
===================================

Imagine our application frequently asks:

SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Bhopal';

We are searching using two columns together:

department + city
A composite index can be designed specifically for this type of search:

Key_name       Seq_in_index       Column_name
------------------------------------------------
idx_dept_city       1             department
idx_dept_city       2             city

there is one index  : idx_dept_city 

but it contains two columns:  department, city

mysql> CREATE INDEX idx_city_dept
    -> ON employees(city, department);
--Query OK, 0 rows affected (0.06 sec)
--Records: 0  Duplicates: 0  Warnings: 0


Key_name          Seq_in_index    Column_name
------------------------------------------------
idx_dept_city          1          department
idx_dept_city          2          city

idx_city_dept          1          city
idx_city_dept          2          department


This is a perfect example of why Seq_in_index is important.



Prefix Indexes in MySQL
========================

CREATE INDEX index_name
ON table_name(column_name(N));

A prefix index means we index only the first N characters of a string column instead of the entire value.

This is useful when a column contains long strings, such as URLs, descriptions, or large text values.


mysql> CREATE TABLE users (
    ->     id INT PRIMARY KEY,
    ->     username VARCHAR(100),
    ->     email VARCHAR(200)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE INDEX idx_email_prefix
    -> ON users(email(10));
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW INDEX FROM users;
+-------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name         | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| users |          0 | PRIMARY          |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| users |          1 | idx_email_prefix |            1 | email       | A         |           0 |       10 |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.01 sec)





DROP INDEX:
===========

SYNTAX:
=======
DROP INDEX index_name ON table_name;


This removes only the index.

t does not delete:

the table
the rows
the column



mysql> DROP INDEX idx_email_prefix ON users;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW INDEX FROM users;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| users |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.00 sec)


now see that idx_email_prefix is gone.