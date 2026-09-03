NULL means unknown/missing value.

So MySQL cannot determine the actual result.



5.null handling functions:
=========================

1. ISNULL():
=============
ISNULL checks whether an expression is NULL

SYNTAX:
========
ISNULL(expression)

It returns:
============
ISNULL(NULL) → 1  → Yes, it is NULL
ISNULL(50)   → 0  → No, it is not NULL




mysql> select isnull(null);
+--------------+
| isnull(null) |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)



mysql> select isnull('BHAVNA');
+------------------+
| isnull('BHAVNA') |
+------------------+
|                0 |
+------------------+
1 row in set (0.00 sec)





NULL in calculations
====================
If you perform arithmetic with NULL, the result is generally NULL.



mysql> SELECT 100*NULL;
+----------+
| 100*NULL |
+----------+
|     NULL |
+----------+
1 row in set (0.00 sec)


mysql> SELECT 100+NULL;
+----------+
| 100+NULL |
+----------+
|     NULL |
+----------+
1 row in set (0.00 sec)




How do we handle this?
=====================

This is where COALESCE() and IFNULL() become very useful.

mysql> SELECT 100 + IFNULL(NULL, 0);
+-----------------------+
| 100 + IFNULL(NULL, 0) |
+-----------------------+
|                   100 |
+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT 100 + IFNULL(20, 0);
+---------------------+
| 100 + IFNULL(20, 0) |
+---------------------+
|                 120 |
+---------------------+



mysql> SELECT 100 + COALESCE('Bhavna', 0);
+-----------------------------+
| 100 + COALESCE('Bhavna', 0) |
+-----------------------------+
|                         100 |
+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT 100 + COALESCE(100, 0);
+------------------------+
| 100 + COALESCE(100, 0) |
+------------------------+
|                    200 |
+------------------------+
1 row in set (0.00 sec)





| Feature         | `ISNULL()`                             | `IS NULL`                                          |
| --------------- | -------------------------------------- | -------------------------------------------------- |
| Type            | **Function**                           | **Operator / condition**                           |
| Syntax          | `ISNULL(expression)`                   | `expression IS NULL`                               |
| Purpose         | Checks whether a value is `NULL`       | Checks whether a value is `NULL`                   |
| Result          | Returns **1 or 0**                     | Returns **TRUE/FALSE** (displayed as 1/0 in MySQL) |
| Common use      | In `SELECT`, expressions, calculations | Especially in `WHERE` conditions                   |
| Example         | `SELECT ISNULL(NULL);`                 | `SELECT NULL IS NULL;`                             |
| Result          | `1`                                    | `1`                                                |
| Table filtering | Possible, but less common              | **Most commonly used**                             |
| Example         | `WHERE ISNULL(bonus)`                  | `WHERE bonus IS NULL`                              |





4. NULL and comparison operators:
********************************

mysql> select 10 = null;
+-----------+
| 10 = null |
+-----------+
|      NULL |
+-----------+
1 row in set (0.00 sec)

You might expect FALSE, but the result is actually: NULL
WHY: Because NULL means UNKNOWN

10 = NULL     → NULL  INSTEAD: WE USE  value IS NULL.
10 <> NULL    → NULL
10 > NULL     → NULL
10 < NULL     → NULL



THE RULE IS:

WHERE COLUMN = NULL   (never use it is a wrong way to identify the null values).

WHERE COLUMN IS NULL (is a correct way to find null values).

WHERE COLUMN IS NOT NULL (is a correct way to find not null values).



NULL-handling concept: COUNT() and NULL
=======================================


COUNT(column):  counts only non-NULL values.

→ ignores NULL

But:

COUNT(*)

→ counts all rows, including rows containing NULL.



GROUP BY does not ignore NULL.

Instead:

All NULL values are treated as one group.




===============================================================================================================================




| Function / Concept       | Purpose                                        | Syntax                       | Example                           | Result           |
| ------------------------ | ---------------------------------------------- | ---------------------------- | --------------------------------- | ---------------- |
| ISNULL()                 | Checks whether a value is `NULL`               | ISNULL(expression)           | `ISNULL(NULL)`                    | 1                |
| IS NULL                  | Tests whether a value is `NULL`                | expression IS NULL           | `NULL IS NULL`                    | 1 (TRUE)         |
| IS NOT NULL              | Tests whether a value is NOT `NULL`            | expression IS NOT NULL       | `100 IS NOT NULL`                 | 1 (TRUE)         |
| IFNULL()                 | Replaces `NULL` with another value             | IFNULL(value, replacement)   | `IFNULL(NULL, 100)`               | 100              |
| COALESCE()               | Returns the **first non-NULL** value           | COALESCE(v1,v2,...)          | `COALESCE(NULL, NULL, 50, 100)`   | 50               |
| NULLIF()                 | Returns `NULL` if two values are equal         | NULLIF(v1,v2)                | `NULLIF(10,10)`                   | NULL             |
| Arithmetic with NULL     | NULL usually makes the arithmetic result NULL  | value + NULL                 | `100 + NULL`                      | NULL             |
| Comparison with NULL     | Comparisons with NULL produce `NULL` (unknown) | value = NULL                 | `10 = NULL`                       | NULL             |
| COUNT(column)            | Counts only **non-NULL** values                | COUNT(column)                | `COUNT(bonus)`                    | Ignores NULL     |
| COUNT(*)                 | Counts **all rows**, including NULL values     | COUNT(*)                     | `COUNT(*)`                        | Counts every row |
| SUM()                    | Ignores NULL values                            | SUM(column)                  | `SUM(100,NULL,200)`               | 300              |
| AVG()                    | Ignores NULL values                            | AVG(column)                  | `AVG(100,NULL,200)`               | 150              |
| MIN()                    | Ignores NULL values                            | MIN(column)                  | `MIN(100,NULL,200)`               | 100              |
| MAX()                    | Ignores NULL values                            | MAX(column)                  | `MAX(100,NULL,200)`               | 200              |
| GROUP BY  + NULL         | NULL values form their **own group**           | GROUP BY column              | Departments: `IT, NULL, IT, NULL` | NULL group = 2   |
