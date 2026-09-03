The most important ones are:

Function	      Purpose

IF()	          Choose between two results
IFNULL()	      Replace NULL with another value
NULLIF()	      Return NULL when two values are equal
COALESCE()	      Return the first non-NULL value
CASE	          Handle multiple conditions

**************************************************************



1. IF() Function
=================
Syntax:

IF(condition, value_if_true, value_if_false)

Think of it as:

IF this condition is true → do this, otherwise → do that.


mysql> SELECT IF(10>5, 'YES', 'NO');
+-----------------------+
| IF(10>5, 'YES', 'NO') |
+-----------------------+
| YES                   |
+-----------------------+
1 row in set (0.02 sec)



mysql> SELECT cname, amount, IF(amount > 10000, 'high', 'low') as category from grporder;
+----------+----------+----------+
| cname    | amount   | category |
+----------+----------+----------+
| DEEPIKA  | 15000.00 | high     |
| RASHMIKA |  5000.00 | low      |
| KATAPPA  |  6000.00 | low      |
| VAIBHAV  | 12000.00 | high     |
+----------+----------+----------+
4 rows in set (0.00 sec)

************************************************************



2. IFNULL()
===========

IFNULL() is used when you want to replace a NULL value with another value.

Syntax:

IFNULL(value, replacement_value)


mysql> SELECT name, age, IFNULL(age, 'no value') as result from pystudent;
+---------+------+----------+
| name    | age  | result   |
+---------+------+----------+
| bhavna  |   30 | 30       |
| bhavna  | NULL | no value |
| bhavna  | NULL | no value |
| bhavna  |   20 | 20       |
| thapaji |   21 | 21       |
| riya    |   25 | 25       |
+---------+------+----------+
6 rows in set (0.00 sec)



mysql> SELECT IFNULL(null, 100) AS RESULT;
+--------+
| RESULT |
+--------+
|    100 |
+--------+
1 row in set (0.00 sec)

***********************************************



3. NULLIF() :
============

Syntax:

NULLIF(value1, value2)

It returns NULL if the two values are equal; otherwise, it returns the first value.



mysql> select nullif(10, 10);
+----------------+
| nullif(10, 10) |
+----------------+
|           NULL |
+----------------+
1 row in set (0.00 sec)




mysql> select nullif(10, 20);
+----------------+
| nullif(10, 20) |
+----------------+
|             10 |
+----------------+
1 row in set (0.00 sec)




mysql> select nullif(null, 20);
+------------------+
| nullif(null, 20) |
+------------------+
|             NULL |
+------------------+
1 row in set (0.00 sec)




mysql> select nullif(10, null);
+------------------+
| nullif(10, null) |
+------------------+
|               10 |
+------------------+
1 row in set (0.00 sec)


***********************************************************





3. COALESCE()
=============

COALESCE() returns the first non-NULL value from a list of values.

Syntax:

COALESCE(value1, value2, value3, ...)




mysql> SELECT COALESCE(NULL, NULL, 100, 200);
+--------------------------------+
| COALESCE(NULL, NULL, 100, 200) |
+--------------------------------+
|                            100 |
+--------------------------------+
1 row in set (0.00 sec)




mysql> SELECT COALESCE(NULL, 'Hello', 'World');
+----------------------------------+
| COALESCE(NULL, 'Hello', 'World') |
+----------------------------------+
| Hello                            |
+----------------------------------+
1 row in set (0.00 sec)

============================================================





4. CASE :
=========

CASE is used when you need to check multiple conditions and return different results.

Basic syntax: 
-------------


CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN condition3 THEN result3
    ELSE result4
END


SELECT
    ->     CASE
    ->         WHEN 45 >= 80 THEN 'Excellent'
    ->         WHEN 45 >= 60 THEN 'Good'
    ->         WHEN 45 >= 40 THEN 'Pass'
    ->         ELSE 'Fail'
    ->     END;

    output: pass

mysql> SELECT * FROM GRPORDER;
+---------+----------+--------+-----------------+----------+
| orderid | cname    | city   | productcatagory | amount   |
+---------+----------+--------+-----------------+----------+
|     111 | DEEPIKA  | MUMBAI | ELECTRONICS     | 15000.00 |
|     112 | RASHMIKA | MUMBAI | CLOTHS          |  5000.00 |
|     113 | KATAPPA  | INDORE | CLOTHS          |  6000.00 |
|     114 | VAIBHAV  | INDORE | ELECTRONICS     | 12000.00 |
+---------+----------+--------+-----------------+----------+
4 rows in set (0.00 sec)




CASE column
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    WHEN value3 THEN result3
    ELSE result4
END

mysql> SELECT cname,  amount,CASE
    -> when amount > 10000 then 'high'
    -> else 'Low'
    -> end as status
    -> from GRPORDER;
+----------+----------+--------+
| cname    | amount   | status |
+----------+----------+--------+
| DEEPIKA  | 15000.00 | high   |
| RASHMIKA |  5000.00 | Low    |
| KATAPPA  |  6000.00 | Low    |
| VAIBHAV  | 12000.00 | high   |
+----------+----------+--------+
4 rows in set (0.00 sec)



