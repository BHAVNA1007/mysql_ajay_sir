How to Decide Which Column Needs an Index ⭐⭐⭐

This is one of the most important real-world indexing questions.

“I look at the applications frequently executed queries, especially columns used in WHERE, JOIN, ORDER BY, and GROUP BY. I also consider selectivity, table size, write frequency, existing indexes, and then use EXPLAIN to verify whether the index actually improves the execution plan.”



Advantages and Disadvantages of Indexes:
=========================================

Advantages
===========

Faster data retrieval

WHERE email = 'amit@gmail.com'

Can help with:

WHERE
JOIN
ORDER BY
GROUP BY

Can enforce uniqueness with a UNIQUE index.



Disadvantages:
===============
Consumes storage

INSERT can become slower

MySQL has to update the relevant indexes when inserting a row.

UPDATE can become slower

Especially when an indexed column changes.

DELETE can become slower

Index entries also need to be removed.

Too many indexes can be harmful

They increase storage and maintenance overhead and can give the optimizer more choices to evaluate.

⭐ Interview question

Q: If indexes make queries faster, why dont we create indexes on every column?

Answer:

“Because indexes consume storage and add overhead to INSERT, UPDATE, and DELETE operations. Therefore, we should create indexes based on actual query patterns and verify their usefulness with execution plans.”




Indexes with WHERE, ORDER BY, and GROUP BY:
===========================================


mysql> select * from employees where department = 'IT';
+-------------+---------------+------------+--------+--------+-----------------+
| employee_id | employee_name | department | salary | city   | email           |
+-------------+---------------+------------+--------+--------+-----------------+
|           1 | Amit          | IT         |  50000 | Bhopal | amit@gmail.com  |
|           3 | Rahul         | IT         |  60000 | Bhopal | rahul@gmail.com |
|           8 | Rohit         | IT         |  52000 | Indore | rohit@gmail.com |
|           6 | Vikas         | IT         |  70000 | Pune   | vikas@gmail.com |
+-------------+---------------+------------+--------+--------+-----------------+
4 rows in set (0.00 sec)



An index on department can help MySQL locate matching rows more efficiently.

CREATE INDEX idx_department
ON employees(department);



Then check the plan:
====================

mysql> explain select * from employees where department = 'IT';
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key           | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_dept_city | idx_dept_city | 123     | const |    4 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)



mysql> explain select * from employees order by salary;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |   100.00 | Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
1 row in set, 1 warning (0.00 sec)

mysql> ALTER TABLE employees
    -> ALTER INDEX idx_salary VISIBLE;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> explain select * from employees order by salary;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |   100.00 | Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
1 row in set, 1 warning (0.00 sec)




mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE salary >= 50000
    -> ORDER BY salary;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | idx_salary    | NULL | NULL    | NULL |    8 |    75.00 | Using where; Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
1 row in set, 1 warning (0.05 sec)


Do not think:

Index exists → MySQL will use it.

Think:

Index exists → MySQL may consider it → optimizer decides whether using it is beneficial.

And EXPLAIN lets us see that decision.



2. Index + ORDER BY:
====================


mysql> select * from employees order by salary;
+-------------+---------------+------------+--------+--------+------------------+
| employee_id | employee_name | department | salary | city   | email            |
+-------------+---------------+------------+--------+--------+------------------+
|           2 | Riya          | HR         |  45000 | Indore | riya@gmail.com   |
|           5 | Pooja         | HR         |  48000 | Indore | pooja@gmail.com  |
|           1 | Amit          | IT         |  50000 | Bhopal | amit@gmail.com   |
|           8 | Rohit         | IT         |  52000 | Indore | rohit@gmail.com  |
|           4 | Neha          | Finance    |  55000 | Delhi  | neha@gmail.com   |
|           3 | Rahul         | IT         |  60000 | Bhopal | rahul@gmail.com  |
|           7 | Anjali        | Finance    |  65000 | Bhopal | anjali@gmail.com |
|           6 | Vikas         | IT         |  70000 | Pune   | vikas@gmail.com  |
+-------------+---------------+------------+--------+--------+------------------+
8 rows in set (0.00 sec)



An index on salary can potentially help MySQL with ordering:


CREATE INDEX idx_salary
ON employees(salary);


Then:
=====

mysql> show index from employees;
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
| Table     | Non_unique | Key_name          | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment             | Visible | Expression |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
| employees |          0 | PRIMARY           |            1 | employee_id   | A         |           8 |     NULL |   NULL |      | BTREE      |         |                           | YES     | NULL       |
| employees |          0 | idx_email         |            1 | email         | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_employee_name |            1 | employee_name | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_salary        |            1 | salary        | A         |           8 |     NULL |   NULL | YES  | BTREE      |         | Index for salary searches | YES     | NULL       |
| employees |          1 | idx_dept_city     |            1 | department    | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_dept_city     |            2 | city          | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_city_dept     |            1 | city          | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_city_dept     |            2 | department    | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
8 rows in set (0.01 sec)




mysql> EXPLAIN SELECT * FROM employees ORDER BY salary;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |   100.00 | Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
1 row in set, 1 warning (0.00 sec)


Look at the Extra column.
-------------------------
Using filesort : This means MySQL NEEDS AN additional sorting operation


Do not memorize:

“Index always makes ORDER BY faster.”

That is not guaranteed.

The optimizer considers the complete query and whether using the index is actually cheaper.



3. Index + GROUP BY:
====================

mysql> select department, count(*) from employees group by department;
+------------+----------+
| department | count(*) |
+------------+----------+
| Finance    |        2 |
| HR         |        2 |
| IT         |        4 |
+------------+----------+
3 rows in set (0.01 sec)



An index on department may help.


CREATE INDEX idx_department
ON employees(department);


mysql> show index from employees;
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
| Table     | Non_unique | Key_name          | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment             | Visible | Expression |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
| employees |          0 | PRIMARY           |            1 | employee_id   | A         |           8 |     NULL |   NULL |      | BTREE      |         |                           | YES     | NULL       |
| employees |          0 | idx_email         |            1 | email         | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_employee_name |            1 | employee_name | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_salary        |            1 | salary        | A         |           8 |     NULL |   NULL | YES  | BTREE      |         | Index for salary searches | YES     | NULL       |
| employees |          1 | idx_dept_city     |            1 | department    | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_dept_city     |            2 | city          | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_city_dept     |            1 | city          | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
| employees |          1 | idx_city_dept     |            2 | department    | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |                           | YES     | NULL       |
+-----------+------------+-------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------------------+---------+------------+
8 rows in set (0.00 sec)


mysql> drop index idx_dept_city on employees;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> EXPLAIN SELECT department, count(*) from employees group by department;
+----+-------------+-----------+------------+-------+---------------+---------------+---------+------+------+----------+------------------------------+
| id | select_type | table     | partitions | type  | possible_keys | key           | key_len | ref  | rows | filtered | Extra                        |
+----+-------------+-----------+------------+-------+---------------+---------------+---------+------+------+----------+------------------------------+
|  1 | SIMPLE      | employees | NULL       | index | idx_city_dept | idx_city_dept | 246     | NULL |    8 |   100.00 | Using index; Using temporary |
+----+-------------+-----------+------------+-------+---------------+---------------+---------+------+------+----------+------------------------------+
1 row in set, 1 warning (0.02 sec)



real-world case: Composite Index:
=================================
mysql> SELECT *
    -> FROM employees
    -> WHERE department = 'IT'
    -> ORDER BY city;
+-------------+---------------+------------+--------+--------+-----------------+
| employee_id | employee_name | department | salary | city   | email           |
+-------------+---------------+------------+--------+--------+-----------------+
|           1 | Amit          | IT         |  50000 | Bhopal | amit@gmail.com  |
|           3 | Rahul         | IT         |  60000 | Bhopal | rahul@gmail.com |
|           8 | Rohit         | IT         |  52000 | Indore | rohit@gmail.com |
|           6 | Vikas         | IT         |  70000 | Pune   | vikas@gmail.com |
+-------------+---------------+------------+--------+--------+-----------------+
4 rows in set (0.01 sec)


mysql> create index idx_dept_city on employees(department, city);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT department, count(*) from employees group by department;
+----+-------------+-----------+------------+-------+-----------------------------+---------------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type  | possible_keys               | key           | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+-------+-----------------------------+---------------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | index | idx_city_dept,idx_dept_city | idx_dept_city | 246     | NULL |    8 |   100.00 | Using index |
+----+-------------+-----------+------------+-------+-----------------------------+---------------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)






5. But do not create indexes blindly
====================================

Imagine this query:

SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Bhopal'
ORDER BY salary;

Which index is best?

We cannot answer simply by saying:

department
city
salary

We need to consider:

How frequently the query runs
Number of rows
Selectivity
Existing indexes
Column order
WHERE conditions
ORDER BY
Actual EXPLAIN output

This is how real database optimization works.



=======================================================================


MY table has only 8 rows.

MySQL can compare these two approaches:

Approach 1 — use index

salary index
     ↓
read rows in salary order
     ↓
go to the table for each row

Approach 2 — table scan + sort

read 8 rows
     ↓
sort them
     ↓
return result

For a tiny table, the second approach can be cheaper.

That is why you get:

type = ALL
Extra = Using filesort



Do not think:

Index exists → MySQL will use it.

Think:

Index exists → MySQL may consider it → optimizer decides whether using it is beneficial.

And EXPLAIN lets us see that decision.











