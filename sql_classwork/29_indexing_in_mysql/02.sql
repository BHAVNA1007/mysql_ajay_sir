EXPLAIN in MySQL
=================

Now we reach one of the most important topics in indexing.

EXPLAIN helps us understand how MySQL plans to execute a query.

It can tell us things like:

Which index MySQL plans to use
Whether MySQL is scanning the whole table
How many rows it expects to examine
Which access method it is using


Basic syntax
=============
Put EXPLAIN before your SELECT:



mysql> EXPLAIN SELECT * FROM employees where salary = 60000;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |    12.50 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.02 sec)


First create an indexmysql>
       EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE employee_id = 3;
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)
=====================

Make sure we have a salary index:


const ⭐

MySQL can find at most one matching row using a Primary Key or UNIQUE index.

mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE employee_name = 'Rahul';
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys     | key               | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_employee_name | idx_employee_name | 203     | const |    1 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)





mysql> EXPLAIN SELECT * FROM employees where salary = 60000;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |    12.50 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

here null beause it is invisible




1. const ⭐

MySQL can find at most one matching row using a Primary Key or UNIQUE index.

Our table: employee_id = PRIMARY KEY

       EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE employee_id = 3;
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+-----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)




2. ref ⭐

You already saw this one.


       EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE employee_name = 'Rahul';
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys     | key               | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_employee_name | idx_employee_name | 203     | const |    1 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+-------------------+-------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)




3. eq_ref ⭐⭐⭐

This usually appears when MySQL accesses exactly one matching row through a Primary Key or UNIQUE key, often in a join.

For example, imagine:

employees.department_id
        ↓
departments.department_id (PRIMARY KEY)

When MySQL uses the primary key of departments to find the corresponding department row for each employee, eq_ref can appear.

We will study this properly when we connect indexes + JOINs.



4. range ⭐  

range means MySQL is using an index to search a range of values.

mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE salary > 50000;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |    33.33 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

50000 ───────────── 60000
       ↑       ↑
     search this range




 5. ALL ❌

You already encountered this:

EXPLAIN
SELECT *
FROM employees
WHERE salary = 60000;

Your output:

type = ALL

This means:

MySQL is scanning the entire table for this access.    













1. key_len

key_len tells us how many bytes of the index MySQL is using.

Your query was:

SELECT *
FROM employees
WHERE employee_name = 'Rahul';

Your output showed:

key = idx_employee_name
key_len = 203

Your column is:

employee_name VARCHAR(50)

If your table uses utf8mb4, one character can require up to 4 bytes.

So approximately:

50 × 4 = 200 bytes

Plus additional bytes used for the columns length/NULL handling can bring it to 203 bytes.

So 203 is not the number of characters.

key_len = number of bytes of the index portion MySQL uses.

Interview point ⭐

A larger key_len does not automatically mean a better or worse index. It tells you how much of the indexed key is being used.

2. ref

Your output:

ref = const

Why?

Your condition is:

WHERE employee_name = 'Rahul'

'Rahul' is a constant value.

So MySQL is essentially doing:

index column
     ↓
employee_name = constant
     ↓
'Rahul'

Therefore:

ref = const
Simple meaning

ref shows what value or column is being compared with the indexed column to find matching rows.

For simple conditions like:

WHERE employee_name = 'Rahul'

you commonly see:

ref = const
3. filtered

Your output:

filtered = 100.00

This represents the estimated percentage of rows that remain after applying the table condition.

For your query:

WHERE employee_name = 'Rahul'

MySQL estimated:

rows = 1
filtered = 100%

Meaning approximately:

1 estimated row examined
        ↓
100% satisfy the remaining filter



WHERE employee_name = 'Rahul'
             ↓
     possible index?
             ↓
     idx_employee_name
             ↓
       selected it
             ↓
       key = idx_employee_name
             ↓
       estimated rows = 1
             ↓
       filtered = 100%












EXPLAIN + Composite Indexes
============================


1. Query using the first column:
=============================

mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE department = 'IT';
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key           | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_dept_city | idx_dept_city | 123     | const |    4 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)



2. Query using both column:
===========================


mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE department = 'IT'
    -> AND city = 'Bhopal';
+----+-------------+-----------+------------+------+-----------------------------+---------------+---------+-------------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys               | key           | key_len | ref         | rows | filtered | Extra |
+----+-------------+-----------+------------+------+-----------------------------+---------------+---------+-------------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_dept_city,idx_city_dept | idx_dept_city | 246     | const,const |    2 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+-----------------------------+---------------+---------+-------------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)



3. Query using only city:
=========================

mysql> EXPLAIN
    -> SELECT *
    -> FROM employees
    -> WHERE city = 'Bhopal';
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key           | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | idx_city_dept | idx_city_dept | 123     | const |    3 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)