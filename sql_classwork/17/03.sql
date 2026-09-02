2.numeric functions:


1. ABS() — Absolute Value:
==========================
ABS() removes the negative sign from a number.

Syntax:

ABS(number)

mysql> select ABS(-50) AS result;
+--------+
| result |
+--------+
|     50 |
+--------+
1 row in set (0.00 sec)



mysql> SELECT ABS(-25.75) as result;
+--------+
| result |
+--------+
|  25.75 |
+--------+
1 row in set (0.00 sec)





2. ROUND() — Rounding Numbers ⭐

ROUND() is used to round a number to a specified number of decimal places.

Syntax:

ROUND(number, decimal_places)

mysql> SELECT ROUND(45.6789, 2);
+-------------------+
| ROUND(45.6789, 2) |
+-------------------+
|             45.68 |
+-------------------+
1 row in set (0.00 sec)


What if we do not give decimal places?
====================================

mysql> SELECT ROUND(45.67);
+--------------+
| ROUND(45.67) |
+--------------+
|           46 |
+--------------+
1 row in set (0.02 sec)
It rounds to the nearest whole number.



Negative numbers:
=================

mysql> SELECT ROUND(-45.67);
+---------------+
| ROUND(-45.67) |
+---------------+
|           -46 |
+---------------+
1 row in set (0.00 sec)



mysql> SELECT ROUND(45678.567, 2) AS salary;
+----------+
| salary   |
+----------+
| 45678.57 |
+----------+
1 row in set (0.00 sec)






3. CEIL() / CEILING()
=====================

These functions return the smallest integer greater than or equal to the number.

In simple words: always go UP.



mysql> SELECT CEIL(12.1);
+------------+
| CEIL(12.1) |
+------------+
|         13 |
+------------+
1 row in set (0.00 sec)



mysql> SELECT CEIL(12.9);
+------------+
| CEIL(12.9) |
+------------+
|         13 |
+------------+
1 row in set (0.00 sec)


With a negative number:
=======================

mysql> SELECT CEIL(-12.9);
+-------------+
| CEIL(-12.9) |
+-------------+
|         -12 |
+-------------+
1 row in set (0.00 sec)



CEIL() and CEILING()
======================
They are equivalent in MySQL


mysql> select CEILING(12.3);
+---------------+
| CEILING(12.3) |
+---------------+
|            13 |
+---------------+
1 row in set (0.00 sec)



4. FLOOR()
=============
FLOOR() does the opposite of CEIL().

It returns the largest integer less than or equal to the number.

In simple words: always go DOWN.


mysql> SELECT FLOOR(5.2);
+------------+
| FLOOR(5.2) |
+------------+
|          5 |
+------------+
1 row in set (0.00 sec)




mysql> SELECT FLOOR(5.9);
+------------+
| FLOOR(5.9) |
+------------+
|          5 |
+------------+
1 row in set (0.00 sec)




negative numbers;
=================


mysql> SELECT FLOOR(-5.2);
+-------------+
| FLOOR(-5.2) |
+-------------+
|          -6 |
+-------------+
1 row in set (0.00 sec)




5. TRUNCATE() :
===============


TRUNCATE() removes decimal digits without rounding.

Syntax:

TRUNCATE(number, decimal_places)

mysql> SELECT TRUNCATE(12.5678, 2);
+----------------------+
| TRUNCATE(12.5678, 2) |
+----------------------+
|                12.56 |
+----------------------+
1 row in set (0.00 sec)



----------------------------
SELECT ROUND(12.5678, 2);       Rounds the number
-- 12.57

SELECT TRUNCATE(12.5678, 2);     Cuts off extra digits
-- 12.56
------------------------------


mysql> SELECT TRUNCATE(12345.67, -2);
+------------------------+
| TRUNCATE(12345.67, -2) |
+------------------------+
|                  12300 |
+------------------------+
1 row in set (0.00 sec)



mysql> SELECT TRUNCATE(12345.67, -3);
+------------------------+
| TRUNCATE(12345.67, -3) |
+------------------------+
|                  12000 |
+------------------------+
1 row in set (0.00 sec)





6. MOD() :
==========

MOD() returns the remainder after division.

Syntax:

MOD(dividend, divisor)

mysql> SELECT MOD(10, 3);
+------------+
| MOD(10, 3) |
+------------+
|          1 |
+------------+
1 row in set (0.00 sec)




mysql> SELECT MOD(20, 5);
+------------+
| MOD(20, 5) |
+------------+
|          0 |
+------------+
1 row in set (0.00 sec)



% operator
==========

MySQL also allows:

mysql> SELECT 17 % 4;
+--------+
| 17 % 4 |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)



mysql> select * from for_functions;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)



mysql> select TreatmentCost from for_functions where TreatmentCost % 2 = 0;
+---------------+
| TreatmentCost |
+---------------+
|       5000.00 |
|       1200.00 |
+---------------+
2 rows in set (0.00 sec)



mysql> select TreatmentCost from for_functions where TreatmentCost % 2 = 1;
Empty set (0.00 sec)



7. POWER() / POW()
==================

Both functions calculate a number raised to a power.

Syntax :

POWER(number, exponent)

The first argument is the base.

The second argument is the exponent.



mysql> SELECT POWER(2, 3);
+-------------+
| POWER(2, 3) |
+-------------+
|           8 |
+-------------+
1 row in set (0.00 sec)



mysql> SELECT POWER(10, 3);
+--------------+
| POWER(10, 3) |
+--------------+
|         1000 |
+--------------+
1 row in set (0.00 sec)




mysql> SELECT POW(2, 3);
+-----------+
| POW(2, 3) |
+-----------+
|         8 |
+-----------+
1 row in set (0.00 sec)





8. SQRT() — Square Root
=======================

SQRT() returns the square root of a number.

Syntax:

SQRT(number)


mysql> SELECT SQRT(25);
+----------+
| SQRT(25) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)



mysql> SELECT SQRT(100.00);
+--------------+
| SQRT(100.00) |
+--------------+
|           10 |
+--------------+
1 row in set (0.00 sec)




9. SIGN() 
==========

SIGN() tells us whether a number is negative, zero, or positive.

Syntax:

SIGN(number)

mysql> SELECT SIGN(50);
+----------+
| SIGN(50) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)



mysql> SELECT SIGN(0);
+---------+
| SIGN(0) |
+---------+
|       0 |
+---------+
1 row in set (0.00 sec)



mysql> SELECT SIGN(-50);
+-----------+
| SIGN(-50) |
+-----------+
|        -1 |
+-----------+
1 row in set (0.00 sec)




ABS() gives the absolute value.

SIGN() only tells you the direction/sign.




10. RAND() — Random Number
===========================

RAND() generates a random decimal number between 0 and 1.

Basic syntax:

SELECT RAND();


mysql> SELECT RAND();
+--------------------+
| RAND()             |
+--------------------+
| 0.9256558063678963 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT RAND();
+--------------------+
| RAND()             |
+--------------------+
| 0.8461976068524621 |
+--------------------+
1 row in set (0.00 sec)

So the result changes each time.

RAND() normally returns:

0 ≤ result < 1

That means it can produce 0, but it will be less than 1.


Random integer from 1 to 100
============================

mysql> SELECT FLOOR(1 + RAND() * 100);
+-------------------------+
| FLOOR(1 + RAND() * 100) |
+-------------------------+
|                      74 |
+-------------------------+
1 row in set (0.00 sec)




11. GREATEST() 
==============

GREATEST() returns the largest value from multiple values.

Syntax:

GREATEST(value1, value2, value3, ...)


mysql> select greatest(10, 25, 15);
+----------------------+
| greatest(10, 25, 15) |
+----------------------+
|                   25 |
+----------------------+
1 row in set (0.00 sec)



mysql> SELECT GREATEST(12.5, 15.7, 9.8);
+---------------------------+
| GREATEST(12.5, 15.7, 9.8) |
+---------------------------+
|                      15.7 |
+---------------------------+
1 row in set (0.00 sec)



mysql> SELECT GREATEST(-12.5, -15.7, -9.8);
+------------------------------+
| GREATEST(-12.5, -15.7, -9.8) |
+------------------------------+
|                         -9.8 |
+------------------------------+
1 row in set (0.00 sec)



GREATEST() vs MAX()

This distinction is very important.

GREATEST() compares values within one row/expression:

MAX() finds the largest value from multiple rows:


mysql> select * from for_functions;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)


mysql> select MAX(TreatmentCost) from for_functions;
+--------------------+
| MAX(TreatmentCost) |
+--------------------+
|            5000.00 |
+--------------------+
1 row in set (0.00 sec)




12. LEAST()
=============

LEAST() is the opposite of GREATEST().

It returns the smallest value from multiple values.

Syntax:

LEAST(value1, value2, value3, ...)


mysql> select least(10, 25, 5, 18);
+----------------------+
| least(10, 25, 5, 18) |
+----------------------+
|                    5 |
+----------------------+
1 row in set (0.00 sec)





13. MIN() 
=========

MIN() returns the smallest value from a column, usually across multiple rows.

Suppose we have:

mysql> select * from for_functions;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)

mysql> select MIN(TreatmentCost) from for_functions;
+--------------------+
| MIN(TreatmentCost) |
+--------------------+
|            1200.00 |
+--------------------+
1 row in set (0.00 sec)


LEAST() → smallest among supplied values
MIN()   → smallest value in a column/result set



14. MAX()
==========

MAX() is the opposite of MIN().

It returns the largest value from a column across rows.



mysql> select * from for_functions;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)




mysql> select MAX(TreatmentCost) from for_functions;
+--------------------+
| MAX(TreatmentCost) |
+--------------------+
|            5000.00 |
+--------------------+
1 row in set (0.00 sec)




15. PI()
========

PI() returns the mathematical constant π (pi).


mysql> SELECT PI();
+----------+
| PI()     |
+----------+
| 3.141593 |
+----------+
1 row in set (0.00 sec)



Area of a circle = π × r²

mysql> SELECT PI() * POWER(5, 2) AS area;
+-------------------+
| area              |
+-------------------+
| 78.53981633974483 |
+-------------------+
1 row in set (0.00 sec)





16. EXP()
==========

EXP() calculates e raised to the given power.

Syntax:

EXP(number)


mysql> SELECT EXP(1);
+-------------------+
| EXP(1)            |
+-------------------+
| 2.718281828459045 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT EXP(2);
+------------------+
| EXP(2)           |
+------------------+
| 7.38905609893065 |
+------------------+
1 row in set (0.00 sec)





18. LOG10()

LOG10() returns the base-10 logarithm of a number.

Syntax

LOG10(number)


mysql> SELECT LOG10(100);
+------------+
| LOG10(100) |
+------------+
|          2 |
+------------+
1 row in set (0.00 sec)



mysql> SELECT LOG10(1000);
+-------------+
| LOG10(1000) |
+-------------+
|           3 |
+-------------+
1 row in set (0.00 sec)





19. RADIANS()
==============

RADIANS() converts an angle from degrees → radians.

Syntax

RADIANS(degrees)

mysql> SELECT RADIANS(180);
+-------------------+
| RADIANS(180)      |
+-------------------+
| 3.141592653589793 |
+-------------------+
1 row in set (0.00 sec)




mysql> SELECT RADIANS(90);
+--------------------+
| RADIANS(90)        |
+--------------------+
| 1.5707963267948966 |
+--------------------+
1 row in set (0.00 sec)






20. DEGREES()
=============

DEGREES() does the opposite of RADIANS().

It converts:

radians → degrees

Syntax:

DEGREES(radians)

mysql> SELECT DEGREES(PI());
+---------------+
| DEGREES(PI()) |
+---------------+
|           180 |
+---------------+
1 row in set (0.00 sec)


mysql> SELECT DEGREES(PI() / 2);
+-------------------+
| DEGREES(PI() / 2) |
+-------------------+
|                90 |
+-------------------+
1 row in set (0.00 sec)
