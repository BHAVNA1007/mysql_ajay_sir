
Conversion Functions in MySQL
=============================
Conversion functions are used to convert a value from one data type to another.


The two most important functions for you are:

1. CAST()
2. CONVERT()



1. CAST()
=========

Syntax:
-------

CAST(expression AS data_type)

It converts an expression into the specified data type.

mysql> select cast('100' as SIGNED) AS result;
+--------+
| result |
+--------+
|    100 |
+--------+
1 row in set (0.00 sec)

'100'       → STRING
SIGNED      → INTEGER
100         → INTEGER


mysql> select cast(123 as decimal(10,2)) as result;
+--------+
| result |
+--------+
| 123.00 |
+--------+
1 row in set (0.00 sec)


Number → CHAR
=============

mysql> select cast(100 as Char);
+-------------------+
| cast(100 as Char) |
+-------------------+
| 100               |
+-------------------+
1 row in set (0.00 sec)



String → DATE
==============

mysql> select cast('2026-09-04' as date) as date;
+------------+
| date       |
+------------+
| 2026-09-04 |
+------------+
1 row in set (0.00 sec)

mysql> select cast(date(now()) as date) as date;
+------------+
| date       |
+------------+
| 2026-09-04 |
+------------+
1 row in set (0.00 sec)




======================================

CAST(value AS data_type)

Think:

"Take this value and CAST it into another data type."

Common CAST() targets


Target	        Meaning

SIGNED	       Integer
UNSIGNED	   Non-negative integer
DECIMAL	       Decimal number
CHAR	       Character/string
DATE	       Date
DATETIME	   Date + time
TIME	       Time
YEAR	       Year
========================================





2. CONVERT()
============
CONVERT() is another important MySQL conversion function. Its purpose is very similar to CAST().


mysql> SELECT CONVERT('5000', SIGNED) as result;
+--------+
| result |
+--------+
|   5000 |
+--------+
1 row in set (0.00 sec)



CAST() vs CONVERT()
=====================


| `CAST()`                          | `CONVERT()`                            |
| --------------------------------- | -------------------------------------- |
| `CAST('123.45' AS DECIMAL(10,2))` | `CONVERT('123.45', DECIMAL(10,2))`     |
| Uses `AS`                         | Uses `,`                               |
| Standard SQL style                | MySQL-specific syntax is commonly used |

Both can perform the same basic data-type conversion.




3. CONVERT() — Character Set Conversion
=====================================

There is another form of CONVERT() that is different from ordinary data-type conversion:

CONVERT(expression USING charset)

mysql> SELECT CONVERT('Hello' USING utf8mb4);
+--------------------------------+
| CONVERT('Hello' USING utf8mb4) |
+--------------------------------+
| Hello                          |
+--------------------------------+
1 row in set (0.00 sec)





| Function    | Syntax                         | Main use                 |
| ----------- | ------------------------------ | ------------------------ |
| `CAST()`    | `CAST(value AS type)`          | Data-type conversion     |
| `CONVERT()` | `CONVERT(value, type)`         | Data-type conversion     |
| `CONVERT()` | `CONVERT(value USING charset)` | Character-set conversion |
