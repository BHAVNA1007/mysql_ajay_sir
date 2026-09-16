Common Indexing Mistakes 🔥
============================



1. “If an index exists, will MySQL always use it?”

❌ No.

The optimizer decides whether using the index is beneficial.



We just saw this with your query:
==================================

mysql> EXPLAIN SELECT * FROM employees ORDER BY salary;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |   100.00 | Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+----------------+
1 row in set, 1 warning (0.00 sec)




Even though you have idx_salary, MySQL showed:

key = NULL
type = ALL
Extra = Using filesort



because your table has only 8 rows and a table scan + sort can be cheaper.


-----------------------------------------
No. MySQLs optimizer decides whether to use an index based on the query, available indexes, statistics, data distribution, and estimated cost.
-----------------------------------------

*****************************************
*****************************************


2. “Should we create an index on every column?”

❌ No.

Indexes have costs:

More indexes
     ↓
More storage
     ↓
More work during INSERT
UPDATE
DELETE

So we create indexes based on actual query patterns.

********************************************
********************************************

3. “Can two indexes have the same columns?”

Yes, but they may be redundant.


For example:

CREATE INDEX idx_dept
ON employees(department);

and:

CREATE INDEX idx_dept_city
ON employees(department, city);

The second index starts with:

department

So the single-column idx_dept may be redundant depending on the workload.

⚠️ Do not automatically delete it. First verify actual query usage.


===================================================
====================================================


5. “Can a UNIQUE index contain NULL?”

This is a classic MySQL interview question.

Yes, a UNIQUE index can allow multiple NULL values because NULL represents the absence of a value and is not considered equal to another NULL for uniqueness purposes.

For example:

mysql> create table test_unique (
    -> id INT PRIMARY KEY,
    -> email VARCHAR(100) UNIQUE
    -> );
Query OK, 0 rows affected (0.05 sec)




mysql> show index from test_unique;
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| test_unique |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| test_unique |          0 | email    |            1 | email       | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.03 sec)


Depending on the table definition, multiple rows can have:

NULL
NULL
NULL

But:

abc@gmail.com
abc@gmail.com

would violate the uniqueness requirement.

If you need the value to always exist and be unique:
====================================================

mysql> ALTER TABLE test_unique modify email VARCHAR(100) NOT NULL UNIQUE;
Query OK, 0 rows affected, 1 warning (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 1


mysql> show index from test_unique;
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| test_unique |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| test_unique |          0 | email    |            1 | email       | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| test_unique |          0 | email_2  |            1 | email       | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.01 sec)


===============================================================
===============================================================



6. “Does a Foreign Key have to be unique?”

❌ No.

For example:

employee_id | department_id
------------|--------------
1           | 101
2           | 101
3           | 101
4           | 102

Multiple employees can belong to the same department.

So:

Foreign Key → relationship
UNIQUE       → uniqueness

They are different concepts.


=============================================================
=============================================================



7. “Does Primary Key automatically have an index?”

✅ Yes.

employee_id INT PRIMARY KEY

automatically gets a Primary Key index in MySQL.

Therefore, do not create another unnecessary index:

CREATE INDEX idx_employee_id
ON employees(employee_id);

if the only purpose is to duplicate the existing Primary Key index.


==============================================================
==============================================================



8. “Does an index always improve performance?”

❌ No.

An index can improve certain read operations, but:

It consumes storage.
It adds maintenance overhead for writes.
The optimizer may decide not to use it.
An inappropriate index can provide little benefit.

So the correct mindset is:

Create index
      ↓
Test query
      ↓
EXPLAIN
      ↓
Analyze workload
      ↓
Keep / modify / remove


============================================================
=============================================================

Interviewer:

“I have a table with 10 rows. Should I create an index on every column to make queries faster?”

A strong answer:

“Not necessarily. For a very small table, a full table scan may be cheaper than using an index. Indexes should be designed based on query patterns, table size, selectivity, and write workload, and verified using execution plans.”

That is an interview-ready answer.

==============================================================
==============================================================


MySQL: Key vs Index

A key is mainly about a columns role/constraint, while an index is a data structure used to find rows efficiently.


| Key / Constraint  | Does MySQL create an index automatically?                                            |
| ----------------- | ------------------------------------------------------------------------------------ |
| **PRIMARY KEY**   | ✅ Yes                                                                                |
| **UNIQUE KEY**    | ✅ Yes                                                                                |
| **FOREIGN KEY**   | ✅ In InnoDB, a suitable index is required; MySQL creates one automatically if needed |
| **Candidate Key** | ❌ Not a separate MySQL object; if implemented as `UNIQUE`, then yes                  |
| **Alternate Key** | ❌ Not a separate MySQL object; usually implemented with `UNIQUE`                     |
| **Super Key**     | ❌ Not a separate MySQL object                                                        |
| **Composite Key** | Depends on how you define it                                                         |
| **Normal INDEX**  | ✅ It is explicitly an index, not a separate key constraint                            |





CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);




MySQL will have indexes for:

employee_id       → PRIMARY KEY index
email             → UNIQUE index
department_id     → FK-supporting index (if needed)



One very important distinction

Do not say:

“Foreign Key is an index.”

❌ That is not correct.

Say:

“A Foreign Key is a referential constraint. In InnoDB, the foreign-key columns need a suitable index, which MySQL creates automatically if necessary.”

And:

“A Primary Key is a constraint that automatically creates a primary index.”

So keys and indexes are related, but they are not the same thing.












==============================================================
==============================================================




Real-World Index Optimization 🔥
=============================

Now lets practice how a developer actually decides which index to create.

Imagine our employees table has 1 million rows.

The application frequently runs:

SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Bhopal';


Step 1: Check the query
==================

The query searches using:

department
city

So we consider a composite index:

CREATE INDEX idx_dept_city
ON employees(department, city);



Step 2: Check with EXPLAIN
==================

EXPLAIN
SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Bhopal';

We look at:

type
possible_keys
key
rows
Extra

Before the index, you might see something like:

type = ALL
key  = NULL
rows = 1000000

Meaning MySQL may scan a very large number of rows.

After creating the appropriate index, you may see:

key = idx_dept_city

and potentially a much smaller estimated row count.

Step 3: Do not create unnecessary indexes
========================================


Suppose we already have:

idx_dept_city
(department, city)

Then do not immediately create:

CREATE INDEX idx_dept
ON employees(department);

The composite index already starts with department, so it may already support queries filtering by department.

Whether the separate index is useful depends on the actual workload.

Step 4: Consider query patterns
=================================

Suppose your application has these queries:

Query A
WHERE department = 'IT'
Query B
WHERE department = 'IT'
AND city = 'Bhopal'

A single:

(department, city)

index can potentially support both because department is the leftmost column.

But if your application frequently does:

WHERE city = 'Bhopal'

then:

(department, city)

is not the appropriate leftmost structure for that city-only lookup.

You might consider:

(city, department)

depending on the workload.


Step 5: Always verify
======================


The real-world process is:

Slow query
    ↓
Understand WHERE / JOIN / ORDER BY
    ↓
Check existing indexes
    ↓
Consider index
    ↓
EXPLAIN
    ↓
Test performance
    ↓
Keep / modify / remove




--------------------------------------------------
---------------------------------------------------
----------------------------------------------------
----------------------------------------------------


⭐ Interview-ready answer

Q: How would you optimize a slow query using indexes?

“First, I would identify the slow query and examine its WHERE, JOIN, ORDER BY, and GROUP BY conditions. Then I would check the existing indexes and use EXPLAIN to understand the execution plan. Based on the query pattern and data distribution, I would consider an appropriate single-column or composite index, then test the query again to verify the improvement.”

One important rule to remember

Do not optimize based only on the SQL statement.

Consider:
---------

Query frequency
Table size
Data distribution
Existing indexes
Read vs. write workload
EXPLAIN
Actual execution time

That is how indexing is handled in real projects.

Next and final main topic

We have only Point 20 remaining: Final Interview + Cross-Question Round.

That will cover the indexing questions an interviewer can ask—from basic → intermediate → tricky → real-world scenarios.