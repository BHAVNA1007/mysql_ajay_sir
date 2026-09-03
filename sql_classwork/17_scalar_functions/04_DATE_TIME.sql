3.date and time functions:
==========================


1. NOW()
=========
What does it do?
NOW() returns the current date and current time.
NOW() contains both.

Syntax:

NOW()


mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-09-03 14:29:03 |
+---------------------+
1 row in set (0.01 sec)
The exact value depends on when you execute it.



USING ALIAS:
============

mysql> select now() as current_date_time;
+---------------------+
| current_date_time   |
+---------------------+
| 2026-09-03 14:30:19 |
+---------------------+
1 row in set (0.00 sec)



2. CURDATE()
=============
CURDATE() returns only the current date.

mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2026-09-03 |
+------------+
1 row in set (0.00 sec)


ANOTHER WAY:  CURRENT_DATE()
=============
CURRENT_DATE() is another way to get the current date.

mysql> select current_date() as todays_date;
+-------------+
| todays_date |
+-------------+
| 2026-09-03  |
+-------------+
1 row in set (0.00 sec)


3. CURTIME()
============
CURTIME() returns only the current time.

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 14:34:38  |
+-----------+
1 row in set (0.00 sec)

ANOTHER WAY:  CURRENT_TIME()
===========

mysql> SELECT CURRENT_TIME() AS curr_time;
+-----------+
| curr_time |
+-----------+
| 14:37:54  |
+-----------+
1 row in set (0.00 sec)



4. DATE()
==========
Now lets start extracting parts from a date/time value.

DATE() extracts only the date part from a DATETIME value.

mysql> SELECT DATE('2026-09-03 14:32:10') as date;
+------------+
| date       |
+------------+
| 2026-09-03 |
+------------+
1 row in set (0.00 sec)


DATE() WITH NOW()
===============
DATE() removes the time. thats why we can use it with NOW()
DATE() extracts the date portion from a date-time value.
mysql> select date(now()) as date_only;
+------------+
| date_only  |
+------------+
| 2026-09-03 |
+------------+
1 row in set (0.00 sec)





5. TIME()
==========
TIME() does the opposite of DATE().

It extracts only the time portion.

mysql> SELECT TIME('2026-09-03 14:32:10') as ONLY_TIME;
+-----------+
| ONLY_TIME |
+-----------+
| 14:32:10  |
+-----------+

TIME() WITH NOW():
==========
mysql> select TIME(now()) as ONLY_TIME;
+-----------+
| ONLY_TIME |
+-----------+
| 14:47:42  |
+-----------+
1 row in set (0.00 sec)




6. YEAR()
=========

YEAR() extracts the year from a date or datetime value.

mysql> SELECT YEAR(now()) as only_year;
+-----------+
| only_year |
+-----------+
|      2026 |
+-----------+
1 row in set (0.00 sec)


mysql> SELECT YEAR('2026-09-03 14:32:10') as ONLY_Year;
+-----------+
| ONLY_Year |
+-----------+
|      2026 |
+-----------+
1 row in set (0.00 sec)


mysql> SELECT YEAR(MFG_Date)
    -> FROM products
    -> WHERE YEAR(MFG_Date) > 2023;
+----------------+
| YEAR(MFG_Date) |
+----------------+
|           2024 |
|           2025 |
|           2024 |
|           2025 |
|           2025 |
+----------------+
5 rows in set (0.00 sec)




7. MONTH()
==========
MONTH() extracts the month number from a date.

mysql> SELECT MFG_Date, MONTH(MFG_Date)
    -> FROM products;
+------------+-----------------+
| MFG_Date   | MONTH(MFG_Date) |
+------------+-----------------+
| 2021-03-18 |               3 |
| 2021-09-28 |               9 |
| 2022-04-23 |               4 |
| 2023-09-27 |               9 |
| 2022-10-17 |              10 |
| 2024-11-27 |              11 |
| 2025-10-11 |              10 |
| 2023-12-21 |              12 |
| 2022-02-28 |               2 |
| 2021-07-09 |               7 |
| 2022-07-09 |               7 |
| 2024-01-15 |               1 |
| 2025-12-25 |              12 |
| 2025-10-15 |              10 |
+------------+-----------------+
14 rows in set (0.00 sec)


mysql> select month(now()) as only_month;
+------------+
| only_month |
+------------+
|          9 |
+------------+
1 row in set (0.00 sec)





8. MONTHNAME()
==============
Since you want to learn the important Date & Time functions one by one, next is MONTHNAME().
MONTHNAME() returns the name of the month instead of its number.


mysql> select monthname(now()) as month_name;
+------------+
| month_name |
+------------+
| September  |
+------------+
1 row in set (0.00 sec)




mysql> select monthname(MFG_DATE) from products WHERE MFG_DATE > 7;
+---------------------+
| monthname(MFG_DATE) |
+---------------------+
| March               |
| September           |
| April               |
| September           |
| October             |
| November            |
| October             |
| December            |
| February            |
| July                |
| July                |
| January             |
| December            |
| October             |
+---------------------+
14 rows in set, 1 warning (0.00 sec)





mysql> select monthname(MFG_DATE) from products WHERE MONTH(MFG_DATE) > 7;
+---------------------+
| monthname(MFG_DATE) |
+---------------------+
| September           |
| September           |
| October             |
| November            |
| October             |
| December            |
| December            |
| October             |
+---------------------+






9. DAY():
======

DAY() extracts the day of the month.

mysql> SELECT DAY(NOW()) AS DAY;
+------+
| DAY  |
+------+
|    3 |
+------+
1 row in set (0.00 sec)




10. DAYNAME()
=============

DAYNAME() returns the name of the day of the week.

mysql> SELECT DAYNAME(NOW()) AS DAY;
+----------+
| DAY      |
+----------+
| Thursday |
+----------+
1 row in set (0.00 sec)




mysql> select DAYNAME(MFG_DATE) from products;
+-------------------+
| DAYNAME(MFG_DATE) |
+-------------------+
| Thursday          |
| Tuesday           |
| Saturday          |
| Wednesday         |
| Monday            |
| Wednesday         |
| Saturday          |
| Thursday          |
| Monday            |
| Friday            |
| Saturday          |
| Monday            |
| Thursday          |
| Wednesday         |
+-------------------+
14 rows in set (0.00 sec)



DAYOFWEEK() :5 (1=Sunday, 2=Monday...)
===========

mysql> SELECT DAYOFWEEK('2026-09-03');
+-------------------------+
| DAYOFWEEK('2026-09-03') |
+-------------------------+
|                       5 |
+-------------------------+
1 row in set (0.01 sec)



11. DAYOFMONTH()
================
DAYOFMONTH() returns the day number from a date.

mysql> SELECT DAYOFMONTH(NOW());
+-------------------+
| DAYOFMONTH(NOW()) |
+-------------------+
|                 3 |
+-------------------+
1 row in set (0.00 sec)



mysql> SELECT DAYOFMONTH('2024-08-15') AS DAY;
+------+
| DAY  |
+------+
|   15 |
+------+
1 row in set (0.00 sec)


DAY() and DAYOFMONTH() give the same result:
**************************************************


12. DAYOFYEAR()
===============

DAYOFYEAR() returns the day number within the year.

mysql> SELECT DAYOFYEAR(NOW()) AS CUR_DAY_OF_YEAR_IS;
+--------------------+
| CUR_DAY_OF_YEAR_IS |
+--------------------+
|                246 |
+--------------------+
1 row in set (0.02 sec)




13 . WEEK()
============
WEEK() returns the week number of a date.
the result is 51 under MySQLs default WEEK() mode.
It returns a number representing the week of the year.
WEEK() does not return the week number within the month. It returns the week number within the year.

mysql> SELECT WEEK(NOW()) AS RESULT;
+--------+
| RESULT |
+--------+
|     35 |
+--------+
1 row in set (0.00 sec)



14. QUARTER()
=============
QUARTER() returns which quarter of the year a date belongs to.

There are 4 quarters:

Q1 → Jan, Feb, Mar
Q2 → Apr, May, Jun
Q3 → Jul, Aug, Sep
Q4 → Oct, Nov, Dec

mysql> SELECT QUARTER(NOW()) AS RESULT;
+--------+
| RESULT |
+--------+
|      3 |
+--------+
1 row in set (0.00 sec)





15. HOUR() :only the hour
=========== 

HOUR() extracts the hour from a time or datetime value.

mysql> SELECT HOUR(NOW()) AS RESULT;
+--------+
| RESULT |
+--------+
|     15 |
+--------+
1 row in set (0.00 sec)




16. MINUTE()
============

MINUTE() extracts the minute.

mysql> select minute(now()) as result;
+--------+
| result |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)


mysql> select minute(now()) as min, hour(now()) as hour;
+------+------+
| min  | hour |
+------+------+
|    2 |   16 |
+------+------+
1 row in set (0.00 sec)




17. SECOND()
============
SECOND() extracts the seconds from a time/datetime value.


mysql> select second(now()) as sec;
+------+
| sec  |
+------+
|   23 |
+------+
1 row in set (0.00 sec)

mysql> SELECT HOUR(NOW()) AS hour, minute(now()) as min, second(now()) as sec;
+------+------+------+
| hour | min  | sec  |
+------+------+------+
|   16 |    7 |   14 |
+------+------+------+
1 row in set (0.00 sec)


****************
Date Arithmetic
****************


18. DATE_ADD()
==============
This is a very important function because it lets you add days, months, years, hours, etc. to a date.



mysql> select date_add(date(now()), interval 10 day) as result;
+------------+
| result     |
+------------+
| 2026-09-13 |
+------------+
1 row in set (0.00 sec)



mysql> select date_add(now(), interval 10 day) as result;
+---------------------+
| result              |
+---------------------+
| 2026-09-13 16:18:01 |
+---------------------+
1 row in set (0.00 sec)



mysql> select date_add('2026-09-13', interval 10 day) as result;
+------------+
| result     |
+------------+
| 2026-09-23 |
+------------+
1 row in set (0.00 sec)



19. DATE_SUB()

It is the opposite of DATE_ADD() — it subtracts a specified amount of time.

mysql> select date_sub(date(now()), interval 10 day);
+----------------------------------------+
| date_sub(date(now()), interval 10 day) |
+----------------------------------------+
| 2026-08-24                             |
+----------------------------------------+
1 row in set (0.00 sec)




mysql> select date_sub(date(now()), interval 1 month);
+-----------------------------------------+
| date_sub(date(now()), interval 1 month) |
+-----------------------------------------+
| 2026-08-03                              |
+-----------------------------------------+
1 row in set (0.00 sec)





mysql> select date_sub(now(), interval 1 hour);
+----------------------------------+
| date_sub(now(), interval 1 hour) |
+----------------------------------+
| 2026-09-03 19:46:27              |
+----------------------------------+
1 row in set (0.00 sec)



-- Shorthand with +/-


mysql> SELECT '2026-09-03' + INTERVAL 1 YEAR;
+--------------------------------+
| '2026-09-03' + INTERVAL 1 YEAR |
+--------------------------------+
| 2027-09-03                     |
+--------------------------------+
1 row in set (0.00 sec)




-- Difference between two dates:

20. DATEDIFF():
===============

mysql> SELECT DATEDIFF('2026-12-25', '2026-09-03');
+--------------------------------------+
| DATEDIFF('2026-12-25', '2026-09-03') |
+--------------------------------------+
|                                  113 |
+--------------------------------------+
1 row in set (0.00 sec)



mysql> SELECT abs(DATEDIFF(date(now()), '2027-01-07'));
+------------------------------------------+
| abs(DATEDIFF(date(now()), '2027-01-07')) |
+------------------------------------------+
|                                      126 |
+------------------------------------------+
1 row in set (0.02 sec)


21. TIMEDIFF():
==============

mysql> SELECT TIMEDIFF('14:30:00', '10:00:00');
+----------------------------------+
| TIMEDIFF('14:30:00', '10:00:00') |
+----------------------------------+
| 04:30:00                         |
+----------------------------------+
1 row in set (0.00 sec)



mysql> SELECT TIMEDIFF(TIME(NOW()), '10:00:00');
+-----------------------------------+
| TIMEDIFF(TIME(NOW()), '10:00:00') |
+-----------------------------------+
| 10:54:29                          |
+-----------------------------------+
1 row in set (0.00 sec)




22. TIMESTAMPDIFF: TIMESTAMPDIFF is very handy — you can specify the unit (SECOND, MINUTE, HOUR, DAY, MONTH, YEAR).
==================

mysql> SELECT TIMESTAMPDIFF(MONTH, '2026-01-01', '2026-09-03');
+--------------------------------------------------+
| TIMESTAMPDIFF(MONTH, '2026-01-01', '2026-09-03') |
+--------------------------------------------------+
|                                                8 |
+--------------------------------------------------+
1 row in set (0.00 sec)



mysql> SELECT TIMESTAMPDIFF(MONTH,date(now()), '2027-01-07');
+------------------------------------------------+
| TIMESTAMPDIFF(MONTH,date(now()), '2027-01-07') |
+------------------------------------------------+
|                                              4 |
+------------------------------------------------+
1 row in set (0.00 sec)



mysql> SELECT TIMESTAMPDIFF(DAY, '2026-01-01', '2026-09-03');
+------------------------------------------------+
| TIMESTAMPDIFF(DAY, '2026-01-01', '2026-09-03') |
+------------------------------------------------+
|                                            245 |
+------------------------------------------------+
1 row in set (0.00 sec)




--- age in years

mysql> SELECT TIMESTAMPDIFF(YEAR, '2000-07-01', CURDATE());
+----------------------------------------------+
| TIMESTAMPDIFF(YEAR, '2000-07-01', CURDATE()) |
+----------------------------------------------+
|                                           26 |
+----------------------------------------------+
1 row in set (0.00 sec)





Formatting Dates:
================

mysql> SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') AS RESULT;
+------------+
| RESULT     |
+------------+
| 2026-09-03 |
+------------+
1 row in set (0.00 sec)



mysql> SELECT DATE_FORMAT(NOW(), '%Y/%m/%d') AS RESULT;
+------------+
| RESULT     |
+------------+
| 2026/09/03 |
+------------+
1 row in set (0.00 sec)



mysql> SELECT DATE_FORMAT(NOW(), '%W, %M %e, %Y') AS RESULT;
+-----------------------------+
| RESULT                      |
+-----------------------------+
| Thursday, September 3, 2026 |
+-----------------------------+
1 row in set (0.00 sec)


mysql> SELECT DATE_FORMAT('2020-02-02', '%W, %M %e, %Y') AS RESULT;
+--------------------------+
| RESULT                   |
+--------------------------+
| Sunday, February 2, 2020 |
+--------------------------+
1 row in set (0.00 sec)



mysql> SELECT DATE_FORMAT(NOW(), '%H:%i %p');
+--------------------------------+
| DATE_FORMAT(NOW(), '%H:%i %p') |
+--------------------------------+
| 21:36 PM                       |
+--------------------------------+
1 row in set (0.00 sec)

mysql> SELECT DATE_FORMAT(NOW(), '%h:%i %p');
+--------------------------------+
| DATE_FORMAT(NOW(), '%h:%i %p') |
+--------------------------------+
| 09:37 PM                       |
+--------------------------------+
1 row in set (0.00 sec)




Converting Strings to Dates:
===========================

mysql> SELECT STR_TO_DATE('03-09-2026', '%d-%m-%Y');
+---------------------------------------+
| STR_TO_DATE('03-09-2026', '%d-%m-%Y') |
+---------------------------------------+
| 2026-09-03                            |
+---------------------------------------+
1 row in set (0.00 sec)




mysql> SELECT STR_TO_DATE('September 3, 2026', '%M %e, %Y');
+-----------------------------------------------+
| STR_TO_DATE('September 3, 2026', '%M %e, %Y') |
+-----------------------------------------------+
| 2026-09-03                                    |
+-----------------------------------------------+
1 row in set (0.00 sec)





Converting Between Types
=======================

mysql> select CAST(NOW() AS DATE);
+---------------------+
| CAST(NOW() AS DATE) |
+---------------------+
| 2026-09-03          |
+---------------------+
1 row in set (0.00 sec)














==========================================


SUMMARY
++++++++

MySQL Date and Time Functions

Heres a practical rundown of the most commonly used ones, grouped by purpose.

Getting Current Date/Time
sql
SELECT NOW();           -- 2026-09-03 14:32:10 (current date + time)
SELECT CURDATE();       -- 2026-09-03 (current date only)
SELECT CURTIME();       -- 14:32:10 (current time only)
SELECT SYSDATE();       -- similar to NOW(), but evaluated at execution time, not query start
SELECT UTC_TIMESTAMP(); -- current UTC date and time

Note: NOW() is fixed for the entire query execution, while SYSDATE() can change if the query runs long (matters for triggers/procedures).

Extracting Parts of a Date
sql
SELECT YEAR('2026-09-03');     -- 2026
SELECT MONTH('2026-09-03');    -- 9
SELECT DAY('2026-09-03');      -- 3
SELECT HOUR('14:32:10');       -- 14
SELECT MINUTE('14:32:10');     -- 32
SELECT SECOND('14:32:10');     -- 10
SELECT DAYNAME('2026-09-03');  -- Thursday
SELECT MONTHNAME('2026-09-03');-- September
SELECT DAYOFWEEK('2026-09-03');-- 5 (1=Sunday, 2=Monday...)
SELECT DAYOFYEAR('2026-09-03');-- day number in the year
SELECT WEEK('2026-09-03');     -- week number of the year
SELECT QUARTER('2026-09-03');  -- 3

Or use EXTRACT() for a more flexible syntax:

sql
SELECT EXTRACT(YEAR_MONTH FROM '2026-09-03 14:32:10'); -- 202609
SELECT EXTRACT(HOUR FROM '14:32:10');                    -- 14
Date Arithmetic
sql
-- Add/subtract intervals
SELECT DATE_ADD('2026-09-03', INTERVAL 10 DAY);   -- 2026-09-13
SELECT DATE_SUB('2026-09-03', INTERVAL 1 MONTH);  -- 2026-08-03
SELECT DATE_ADD(NOW(), INTERVAL 2 HOUR);          -- current time + 2 hours

-- Shorthand with +/-
SELECT '2026-09-03' + INTERVAL 1 YEAR;  -- 2027-09-03

-- Difference between two dates
SELECT DATEDIFF('2026-12-25', '2026-09-03');       -- 113 (days between)
SELECT TIMEDIFF('14:30:00', '10:00:00');           -- 04:30:00
SELECT TIMESTAMPDIFF(MONTH, '2026-01-01', '2026-09-03'); -- 8
SELECT TIMESTAMPDIFF(YEAR, '2000-05-15', CURDATE()); -- age in years

TIMESTAMPDIFF is very handy — you can specify the unit (SECOND, MINUTE, HOUR, DAY, MONTH, YEAR).

Formatting Dates
sql
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');           -- 2026-09-03
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y');           -- 03/09/2026
SELECT DATE_FORMAT(NOW(), '%W, %M %e, %Y');      -- Thursday, September 3, 2026
SELECT DATE_FORMAT(NOW(), '%h:%i %p');           -- 02:32 PM

Common format specifiers:

Specifier	    Meaning	                     Example
%Y	            4-digit year	             2026
%y	            2-digit year	             26
%m	            Month (01-12)	             09
%M	            Month name	                 September
%d	            Day (01-31)	                 03
%W	            Weekday name	             Thursday
%H	            Hour (00-23)	             14
%h	            Hour (01-12)	             02
%i	            Minutes	                     32
%s	            Seconds	                     10
%p	            AM/PM	                     PM