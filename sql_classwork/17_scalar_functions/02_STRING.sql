String Functions:
=================


ASCII:

Returns the ASCII value for the specific character.

The ASCII() function returns the ASCII value for the specific character.
ASCII(character)


mysql> select PatientName, ascii(PatientName) as num_code_of_first_char from for_functions;
+-------------+------------------------+
| PatientName | num_code_of_first_char |
+-------------+------------------------+
| Michael     |                     77 |
| David       |                     68 |
+-------------+------------------------+
2 rows in set (0.00 sec)



ORD() Function:
===================
Returns the numeric value of the first character.

mysql> SELECT ORD(PatientName)  as unicodeOfFirstChar from for_functions;
+--------------------+
| unicodeOfFirstChar |
+--------------------+
|                 77 |
|                 68 |
+--------------------+
2 rows in set (0.00 sec)


*************************************************************
The error is because MySQL does not have a UNICODE() function.

You may be thinking of SQL Server, where UNICODE() exists.
*************************************************************


CHAR:

Returns the character based on the ASCII code

mysql> SELECT CHAR(65 USING utf8mb4) AS `Character`;
+-----------+
| Character |
+-----------+
| A         |
+-----------+
1 row in set (0.00 sec)

So don't conclude that CHAR() doesn't work in MySQL. It does work. The difference is how MySQL represents the returned binary string.


LOCATE() Function: LOCATE() is used to find the position of a substring inside a string.
===================

LOCATE('what_to_find', 'where_to_find')

mysql> SELECT LOCATE('t', 'Customer');
+-------------------------+
| LOCATE('t', 'Customer') |
+-------------------------+
|                       4 |
+-------------------------+
1 row in set (0.00 sec)

mysql> SELECT LOCATE('come', 'Welcome');
+---------------------------+
| LOCATE('come', 'Welcome') |
+---------------------------+
|                         4 |
+---------------------------+
1 row in set (0.00 sec)


if substring not found:  returns 0
========================

mysql> SELECT LOCATE('x', 'Customer');
+-------------------------+
| LOCATE('x', 'Customer') |
+-------------------------+
|                       0 |
+-------------------------+
1 row in set (0.00 sec)

0 means the value was not found.


4. Find from a specific position:
=================================

LOCATE(search_string, string, starting_position)

mysql> SELECT LOCATE('a', 'Banana', 3);
+--------------------------+
| LOCATE('a', 'Banana', 3) |
+--------------------------+
|                        4 |
+--------------------------+
1 row in set (0.00 sec)




mysql> SELECT name, LOCATE('a', name) AS position
    -> FROM product10;
+---------+----------+
| name    | position |
+---------+----------+
| laptop  |        2 |
| mobile  |        0 |
| watch   |        2 |
| mobile1 |        0 |
| laptop2 |        2 |
+---------+----------+
5 rows in set (0.01 sec)


************************************************************

4. concat() Funcation:
========================

What does CONCAT() do?

CONCAT() is used to join two or more strings together and return them as one string.
You manually provide the separator

CONCAT(string1, string2, string3, ...)

mysql> SELECT CONCAT('W3Schools', '.com');
+-----------------------------+
| CONCAT('W3Schools', '.com') |
+-----------------------------+
| W3Schools.com               |
+-----------------------------+
1 row in set (0.00 sec)

note:
There is no space automatically.


if you want a space:
Add strings together (separate each string with a space character):

mysql> select concat('SQL', ' ', ' ', 'fun!');
+---------------------------------+
| concat('SQL', ' ', ' ', 'fun!') |
+---------------------------------+
| SQL  fun!                       |
+---------------------------------+
1 row in set (0.00 sec)


mysql> select concat('SQL', ', ', 'fun!');
+-----------------------------+
| concat('SQL', ', ', 'fun!') |
+-----------------------------+
| SQL, fun!                   |
+-----------------------------+
1 row in set (0.00 sec)


Important:
============== 
CONCAT() and NULL:

mysql> SELECT CONCAT('Hello', NULL, 'World');
+--------------------------------+
| CONCAT('Hello', NULL, 'World') |
+--------------------------------+
| NULL                           |
+--------------------------------+
1 row in set (0.00 sec)

Why?
====

Because in MySQL, if any argument passed to CONCAT() is NULL, the result is NULL.


mysql> SELECT CONCAT('Bhavna', NULL);
+------------------------+
| CONCAT('Bhavna', NULL) |
+------------------------+
| NULL                   |
+------------------------+
1 row in set (0.00 sec)


How can we handle this?
===========================

Use COALESCE() or IFNULL():

mysql> SELECT CONCAT('Bhavna', ' ', COALESCE(NULL, ''));
+-------------------------------------------+
| CONCAT('Bhavna', ' ', COALESCE(NULL, '')) |
+-------------------------------------------+
| Bhavna                                    |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('Bhavna', ' ', ifnull(NULL, ''));
+-----------------------------------------+
| CONCAT('Bhavna', ' ', ifnull(NULL, '')) |
+-----------------------------------------+
| Bhavna                                  |
+-----------------------------------------+
1 row in set (0.00 sec)


Concat With + :  Add 2 strings together
===============

The + operator allows you to add two or more strings together.

Note: See also the CONCAT() and CONCAT_WS() functions.

mysql> select 'bhavna' + 'potphode';
+-----------------------+
| 'bhavna' + 'potphode' |
+-----------------------+
|                     0 |
+-----------------------+
1 row in set, 2 warnings (0.00 sec)


mysql> SELECT PatientName + Age from for_functions;
+-------------------+
| PatientName + Age |
+-------------------+
|                25 |
|                40 |
+-------------------+
2 rows in set, 2 warnings (0.00 sec)

mysql> SELECT PatientName + AdmissionStatus from for_functions;
+-------------------------------+
| PatientName + AdmissionStatus |
+-------------------------------+
|                             0 |
|                             0 |
+-------------------------------+
2 rows in set, 4 warnings (0.00 sec)



CONCAT_WS() Function: The CONCAT_WS() function adds two or more strings together with a separator.
=====================
The first argument is always the separator.

CONCAT_WS(separator, string1, string2, ...., string_n)

mysql> select concat_ws('.', 'www', 'mysql', 'com');
+---------------------------------------+
| concat_ws('.', 'www', 'mysql', 'com') |
+---------------------------------------+
| www.mysql.com                         |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT_WS('>',  PatientName, Age) from for_functions;
+-----------------------------------+
| CONCAT_WS('>',  PatientName, Age) |
+-----------------------------------+
| Michael>25                        |
| David>40                          |
+-----------------------------------+
2 rows in set (0.00 sec)



mysql> SELECT CONCAT_WS(' ',  PatientName, Age, AdmissionStatus) as fullinfor from for_functions;
+---------------------+
| fullinfor           |
+---------------------+
| Michael 25 Admitted |
| David 40 Admitted   |
+---------------------+
2 rows in set (0.00 sec)



mysql> select * from  product10;
+------+---------+----------+----------------------------+
| pid  | name    | discount | description                |
+------+---------+----------+----------------------------+
|    1 | laptop  | 30%      | NULL                       |
|    2 | mobile  | 30%      | NULL                       |
|    3 | watch   | 50%      | NULL                       |
|    4 | mobile1 | 20%      | we are giving 20% discount |
|    4 | laptop2 | 40%      | we are giving 40% discount |
+------+---------+----------+----------------------------+
5 rows in set (0.00 sec)


mysql> select CONCAT_WS(' ', name,  description) as with_null from product10;
+------------------------------------+
| with_null                          |
+------------------------------------+
| laptop                             |
| mobile                             |
| watch                              |
| mobile1 we are giving 20% discount |
| laptop2 we are giving 40% discount |
+------------------------------------+
5 rows in set (0.00 sec)




CONCAT_WS() skips NULL values.
==============================

mysql> select CONCAT_WS(' ', 'Priya', NULL, 'Patel');
+----------------------------------------+
| CONCAT_WS(' ', 'Priya', NULL, 'Patel') |
+----------------------------------------+
| Priya Patel                            |
+----------------------------------------+
1 row in set (0.00 sec)




Very Important: NULL separator
==============================

There is one special case.

If the separator itself is NULL:

mysql> SELECT CONCAT_WS(NULL, 'A', 'B');
+---------------------------+
| CONCAT_WS(NULL, 'A', 'B') |
+---------------------------+
| NULL                      |
+---------------------------+
1 row in set (0.00 sec)




mysql> select * from  product10;
+------+---------+----------+----------------------------+
| pid  | name    | discount | description                |
+------+---------+----------+----------------------------+
|    1 | laptop  | 30%      | NULL                       |
|    2 | mobile  | 30%      | NULL                       |
|    3 | watch   | 50%      | NULL                       |
|    4 | mobile1 | 20%      | we are giving 20% discount |
|    4 | laptop2 | 40%      | we are giving 40% discount |
+------+---------+----------+----------------------------+
5 rows in set (0.00 sec)


mysql> select CONCAT_WS(NULL, name,  description) as with_null from product10;
+-----------+
| with_null |
+-----------+
| NULL      |
| NULL      |
| NULL      |
| NULL      |
| NULL      |
+-----------+
5 rows in set (0.00 sec)




3. LENGTH() Function:
=====================

What does LENGTH() do?

LENGTH() returns the number of bytes used by a string.

Syntax:

LENGTH(string)

For normal English characters, 1 character usually = 1 byte, so LENGTH() often looks like it is counting characters.

mysql> select length('bhavna');
+------------------+
| length('bhavna') |
+------------------+
|                6 |
+------------------+
1 row in set (0.00 sec)




Spaces are bytes too.
====================

mysql> SELECT LENGTH('   ') AS result;
+--------+
| result |
+--------+
|      3 |
+--------+
1 row in set (0.00 sec)


mysql> select * from  product10;
+------+---------+----------+----------------------------+
| pid  | name    | discount | description                |
+------+---------+----------+----------------------------+
|    1 | laptop  | 30%      | NULL                       |
|    2 | mobile  | 30%      | NULL                       |
|    3 | watch   | 50%      | NULL                       |
|    4 | mobile1 | 20%      | we are giving 20% discount |
|    4 | laptop2 | 40%      | we are giving 40% discount |
+------+---------+----------+----------------------------+
5 rows in set (0.00 sec)



mysql> SELECT LENGTH(description) as char_length from  product10;
+-------------+
| char_length |
+-------------+
|        NULL |
|        NULL |
|        NULL |
|          26 |
|          26 |
+-------------+
5 rows in set (0.00 sec)

mysql> SELECT LENGTH(description, name) as char_length from  product10;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'LENGTH'

Why the error?
==============
LENGTH() accepts only ONE argument:




4. CHAR_LENGTH():
==================

This one is closely related to LENGTH(), so it is important to understand the difference clearly.
It accepts only one argument, just like LENGTH().

Syntax:

CHAR_LENGTH(string)

It returns the number of characters in a string.


mysql> select char_length('bhavna');
+-----------------------+
| char_length('bhavna') |
+-----------------------+
|                     6 |
+-----------------------+
1 row in set (0.00 sec)



*********************************
CHAR_LENGTH() vs LENGTH()
*********************************

This is very important for interviews.

CHAR_LENGTH() :   Counts characters.

LENGTH()     : Counts bytes.

For normal English text, they usually give the same result:

mysql> SELECT LENGTH('Hello') as lenght_exp ,
    ->        CHAR_LENGTH('Hello') as char_length_exp;
+------------+-----------------+
| lenght_exp | char_length_exp |
+------------+-----------------+
|          5 |               5 |
+------------+-----------------+
1 row in set (0.00 sec)



mysql> select CHAR_LENGTH(null) as char_length_exp;
+-----------------+
| char_length_exp |
+-----------------+
|            NULL |
+-----------------+
1 row in set (0.00 sec)

Just like LENGTH(NULL)



LEFT() Function:
================

The LEFT() function extracts a number of characters from a string (starting from left).

It takes 2 arguments:
---------------------

string → the original text
number_of_characters → how many characters you want

Syntax
LEFT(string, number_of_chars)


mysql> select left('SQL Tutorial', 3) as extractString;
+---------------+
| extractString |
+---------------+
| SQL           |
+---------------+
1 row in set (0.00 sec)



with 0 result is Empty string:

mysql> select left('SQL Tutorial', 0) as extractString;
+---------------+
| extractString |
+---------------+
|               |
+---------------+
1 row in set (0.00 sec)


Extract 5 characters from the text in the "PatientName" column (starting from left):

mysql> SELECT Left(PatientName, 5) as extractString from for_functions;
+---------------+
| extractString |
+---------------+
| Micha         |
| David         |
+---------------+
2 rows in set (0.00 sec)



negative values result in an empty string in MySQL.

mysql> SELECT LEFT('MySQL', -9);
+-------------------+
| LEFT('MySQL', -9) |
+-------------------+
|                   |
+-------------------+
1 row in set (0.00 sec)



RIGHT() function:
=================

The RIGHT() function extracts a number of characters from a string (starting from right).

Syntax:

RIGHT(string, number_of_chars)

mysql> SELECT Right(PatientName, 5) as extractString from for_functions;
+---------------+
| extractString |
+---------------+
| chael         |
| David         |
+---------------+
2 rows in set (0.00 sec)

mysql> select right(name, 2) as right_exp from  product10;
+-----------+
| right_exp |
+-----------+
| op        |
| le        |
| ch        |
| e1        |
| p2        |
+-----------+
5 rows in set (0.00 sec)



with 0 result is empty string:

mysql> select right(name, 0) as right_exp from  product10;
+-----------+
| right_exp |
+-----------+
|           |
|           |
|           |
|           |
|           |
+-----------+
5 rows in set (0.00 sec)


LOWER() Function:
=================

The LOWER() function converts a string to lower-case.
It accepts one argument.

Syntax:

LOWER(text)

mysql> select *  from for_functions;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.01 sec)

mysql> select LOWER(PatientName) AS lower_case from for_functions;
+------------+
| lower_case |
+------------+
| michael    |
| david      |
+------------+
2 rows in set (0.00 sec)


********************
LOWER() vs LCASE() : Both convert text to lowercase.
********************

mysql> select patientName, LCASE(PatientName) AS L_case from for_functions;
+-------------+---------+
| patientName | L_case  |
+-------------+---------+
| Michael     | michael |
| David       | david   |
+-------------+---------+
2 rows in set (0.00 sec)


UPPER() function:
=================

The UPPER() function converts a string to upper-case.
It accepts one argument.
UPPER() does not modify the actual data.

Syntax:

UPPER(string)

mysql> select patientName, UPPER(PatientName) AS upper_case from for_functions;
+-------------+------------+
| patientName | upper_case |
+-------------+------------+
| Michael     | MICHAEL    |
| David       | DAVID      |
+-------------+------------+
2 rows in set (0.00 sec)


******************
UPPER() vs UCASE()
******************
MySQL provides both: Both perform uppercase conversion.

mysql> select patientName, UCASE(PatientName) AS u_case from for_functions;
+-------------+---------+
| patientName | u_case  |
+-------------+---------+
| Michael     | MICHAEL |
| David       | DAVID   |
+-------------+---------+
2 rows in set (0.00 sec)



TRIM() Function:
================

The TRIM() function removes the space character OR other specified characters from the start or end of a string.

By default, the TRIM() function removes leading and trailing spaces from a string.

Syntax:

TRIM([characters FROM ]string)

mysql> select TRIM('#! ' FROM '  #yeeee!!!!    ') as trimmedStringt;
+------------------+
| trimmedStringt   |
+------------------+
|   #yeeee!!!!     |
+------------------+
1 row in set (0.00 sec)



mysql> select trim('abc' from 'abcHelloabc');
+--------------------------------+
| trim('abc' from 'abcHelloabc') |
+--------------------------------+
| Hello                          |
+--------------------------------+
1 row in set (0.00 sec)




mysql> select TRIM(BOTH '#' FROM '###Hello###');
+-----------------------------------+
| TRIM(BOTH '#' FROM '###Hello###') |
+-----------------------------------+
| Hello                             |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> select TRIM('#' FROM '###Hello###');
+------------------------------+
| TRIM('#' FROM '###Hello###') |
+------------------------------+
| Hello                        |
+------------------------------+
1 row in set (0.00 sec)

mysql> select TRIM(TRAILING '#' FROM '###Hello###');
+---------------------------------------+
| TRIM(TRAILING '#' FROM '###Hello###') |
+---------------------------------------+
| ###Hello                              |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> select TRIM(LEADING '#' FROM '###Hello###');
+--------------------------------------+
| TRIM(LEADING '#' FROM '###Hello###') |
+--------------------------------------+
| Hello###                             |
+--------------------------------------+
1 row in set (0.00 sec)



LTRIM() Function:
=================

The LTRIM() function removes leading spaces from a string.
It takes only one argument.


Syntax:

LTRIM(string)

mysql> select LTRIM('      hello kaise ho') as leftTrimmedString;
+-------------------+
| leftTrimmedString |
+-------------------+
| hello kaise ho    |
+-------------------+
1 row in set (0.00 sec)



RTRIM() Function:
=================

The RTRIM() function removes trailing spaces from a string.
It takes only one argument.

Syntax:

RTRIM(string)

mysql> select RTRIM('hello kaise ho          ') as leftTrimmedString;
+-------------------+
| leftTrimmedString |
+-------------------+
| hello kaise ho    |
+-------------------+
1 row in set (0.00 sec)



9. SUBSTRING(): 
================
SUBSTRING() is used to extract a part of a string, starting from a specific position.

It is more flexible than LEFT() and RIGHT() because you can choose where to start.

Syntax:

SUBSTRING(string, start_position, length)



mysql> SELECT name from  product10;
+---------+
| name    |
+---------+
| laptop  |
| mobile  |
| watch   |
| mobile1 |
| laptop2 |
+---------+
5 rows in set (0.00 sec)


mysql> select name, substring(name, 1, 3) as first_3_char from product10;
+---------+--------------+
| name    | first_3_char |
+---------+--------------+
| laptop  | lap          |
| mobile  | mob          |
| watch   | wat          |
| mobile1 | mob          |
| laptop2 | lap          |
+---------+--------------+
5 rows in set (0.00 sec)



with 0 result is (empty string):
================================

mysql> SELECT SUBSTRING('Hello', 0, 3);
+--------------------------+
| SUBSTRING('Hello', 0, 3) |
+--------------------------+
|                          |
+--------------------------+
1 row in set (0.00 sec)


mysql> select substring('Bhavna', 1, 3);
+---------------------------+
| substring('Bhavna', 1, 3) |
+---------------------------+
| Bha                       |
+---------------------------+
1 row in set (0.00 sec)


with null result is null:
==========================

mysql> select substring(null, 1);
+----------------------------------------+
| substring(null, 1)                     |
+----------------------------------------+
| NULL                                   |
+----------------------------------------+
1 row in set (0.00 sec)

mysql> select substring(null, 1, 3);
+----------------------------------------------+
| substring(null, 1, 3)                        |
+----------------------------------------------+
| NULL                                         |
+----------------------------------------------+
1 row in set (0.00 sec)



important SUBSTRING() feature: MySQL also supports negative positions.
=============================

mysql> SELECT SUBSTRING('Programming', -4);
+------------------------------+
| SUBSTRING('Programming', -4) |
+------------------------------+
| ming                         |
+------------------------------+
1 row in set (0.00 sec)





10. SUBSTR():
=============

SUBSTR() is an alternative name (synonym) for SUBSTRING() in MySQL.

So, both perform the same operation.

Syntax:

SUBSTR(string, start_position, length)



SUBSTRING() vs SUBSTR():
========================

There is no functional difference between these:


mysql> select substr('Database', 3, 4);
+--------------------------+
| substr('Database', 3, 4) |
+--------------------------+
| taba                     |
+--------------------------+
1 row in set (0.00 sec)



mysql> select substr('Database', 5);
+-----------------------+
| substr('Database', 5) |
+-----------------------+
| base                  |
+-----------------------+
1 row in set (0.00 sec)



mysql> select substr('Database', -3);
+------------------------+
| substr('Database', -3) |
+------------------------+
| ase                    |
+------------------------+
1 row in set (0.00 sec)


*****************************
LEFT → beginning

RIGHT → end

SUBSTR → choose the position
*****************************




11. MID():
=========

MID() is another synonym of SUBSTRING() in MySQL.

It is used to extract a portion of a string starting from a specified position.

Syntax:

MID(string, start_position, length)


mysql> SELECT MID('Database', 0);
+--------------------+
| MID('Database', 0) |
+--------------------+
|                    |
+--------------------+
1 row in set (0.00 sec)



mysql> SELECT MID('Database', 5);
+--------------------+
| MID('Database', 5) |
+--------------------+
| base               |
+--------------------+
1 row in set (0.00 sec)



mysql> SELECT MID(NULL, 2, 3);
+----------------------------------+
| MID(NULL, 2, 3)                  |
+----------------------------------+
| NULL                             |
+----------------------------------+
1 row in set (0.00 sec)



mysql> SELECT MID('Computer', 3, 4);
+-----------------------+
| MID('Computer', 3, 4) |
+-----------------------+
| mput                  |
+-----------------------+
1 row in set (0.00 sec)



mysql> SELECT MID('Computer', -3);
+---------------------+
| MID('Computer', -3) |
+---------------------+
| ter                 |
+---------------------+
1 row in set (0.00 sec)



12. REPLACE():
===============

REPLACE() is used to find specific text inside a string and replace it with another text.

Syntax:

REPLACE(string, old_string, new_string)


mysql> select REPLACE('I like Java', 'Java', 'Python');
+------------------------------------------+
| REPLACE('I like Java', 'Java', 'Python') |
+------------------------------------------+
| I like Python                            |
+------------------------------------------+
1 row in set (0.00 sec)


REPLACE() replaces all occurrences of the matching text.

mysql> select REPLACE('banana', 'a', 'o');
+-----------------------------+
| REPLACE('banana', 'a', 'o') |
+-----------------------------+
| bonono                      |
+-----------------------------+
1 row in set (0.00 sec)



mysql> select REPLACE('Bhavna Potphode',' ', '-') as replace_by_hyfun;
+------------------+
| replace_by_hyfun |
+------------------+
| Bhavna-Potphode  |
+------------------+
1 row in set (0.00 sec)



mysql> select name, replace(name, 'laptop2', 'smart_watch') as replace_laptop2 from product10;
+---------+-----------------+
| name    | replace_laptop2 |
+---------+-----------------+
| laptop  | laptop          |
| mobile  | mobile          |
| watch   | watch           |
| mobile1 | mobile1         |
| laptop2 | smart_watch     |
+---------+-----------------+
5 rows in set (0.00 sec)




13. REVERSE():
==============

REVERSE() is used to reverse the characters in a string.

Syntax:

REVERSE(string)

It takes only one argument.


mysql> select reverse('bhavna');
+-------------------+
| reverse('bhavna') |
+-------------------+
| anvahb            |
+-------------------+
1 row in set (0.00 sec)


mysql> select reverse('bhavna');
+-------------------+
| reverse('bhavna') |
+-------------------+
| anvahb            |
+-------------------+
1 row in set (0.00 sec)


mysql> select reverse(12345);
+----------------+
| reverse(12345) |
+----------------+
| 54321          |
+----------------+
1 row in set (0.00 sec)


mysql> select reverse('12345');
+------------------+
| reverse('12345') |
+------------------+
| 54321            |
+------------------+
1 row in set (0.00 sec)


mysql> select name, reverse(name) as reverse_name from product10;
+---------+--------------+
| name    | reverse_name |
+---------+--------------+
| laptop  | potpal       |
| mobile  | elibom       |
| watch   | hctaw        |
| mobile1 | 1elibom      |
| laptop2 | 2potpal      |
+---------+--------------+
5 rows in set (0.00 sec)

REVERSE() accepts only one argument



INSTR() function:
=================

INSTR() is used to find the position of a substring inside a string.

Syntax:

INSTR(string, substring)


The important differenceS are:
===============================
LOCATE() can take a third argument. INSTR() does not have this third argument.

LOCATE(substring, string)

INSTR(string, substring)
=================================


mysql> select instr('bhavna', 'av') as position;
+----------+
| position |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)



mysql> select instr('bhavna', 'batch1') as position;
+----------+
| position |
+----------+
|        0 |
+----------+
1 row in set (0.00 sec)





LPAD() function:  LPAD() means Left Padding.
================

It adds characters to the left side (beginning) of a string until the string reaches a specified length.

Syntax:

LPAD(string, length, pad_string)


mysql> select lpad('123', 5, '0') as result;
+--------+
| result |
+--------+
| 00123  |
+--------+
1 row in set (0.00 sec)



mysql> select lpad('bhavna', 8, '****') as result;
+----------+
| result   |
+----------+
| **bhavna |
+----------+
1 row in set (0.00 sec)



mysql> select lpad('xyzxyz', 6, 'ab');
+-------------------------+
| lpad('xyzxyz', 6, 'ab') |
+-------------------------+
| xyzxyz                  |
+-------------------------+
1 row in set (0.00 sec)





It truncates the original string from the right to make the result exactly 3 characters.

mysql> select lpad('xyzxyz', 3, 0) as result;
+--------+
| result |
+--------+
| xyz    |
+--------+
1 row in set (0.00 sec)




mysql> select lpad('xyzxyz', 3, null) as result;
+--------+
| result |
+--------+
| NULL   |
+--------+
1 row in set (0.00 sec)




mysql> select lpad('xyzxyz', 0, '*') as result;
+--------+
| result |
+--------+
|        |
+--------+
1 row in set (0.00 sec)




mysql> select lpad('xyzxyz', NULL, '*') as result;
+--------+
| result |
+--------+
| NULL   |
+--------+
1 row in set (0.00 sec)



RPAD() function: RPAD() means Right Padding.
=================

It adds characters to the right side (end) of a string until it reaches the specified length.

Syntax:

RPAD(string, length, pad_string)

mysql> select rpad('bhavna', 8, '****') as result;
+----------+
| result   |
+----------+
| bhavna** |
+----------+
1 row in set (0.00 sec)


mysql> select rpad('hello', 3, '*') as result;
+--------+
| result |
+--------+
| hel    |
+--------+
1 row in set (0.00 sec)



mysql> select rpad('xyzxyz', 0, '*') as result;
+--------+
| result |
+--------+
|        |
+--------+
1 row in set (0.00 sec)



SPACE() function: SPACE(n) returns a string containing n spaces.
=================
It creates exactly the number of spaces you specify.

Syntax:

SPACE(number_of_spaces)

SPACE() can be used alone, but its output is only blank spaces, so you usually cannot see anything in the MySQL output.

mysql> SELECT SPACE(3);
+----------+
| SPACE(3) |
+----------+
|          |
+----------+
1 row in set (0.00 sec)


SPACE() is usually useful inside another function,
especially used with CONCAT().

mysql> select concat('hello', space(5), 'world') as result;
+-----------------+
| result          |
+-----------------+
| hello     world |
+-----------------+
1 row in set (0.00 sec)


SPACE()creates spaces.
It is mainly useful when you need to insert spaces between strings.


REPEAT() function:
==================
REPEAT() repeats a string a specified number of times.

Syntax:

REPEAT(string, count)


mysql> select repeat('Bhavna', 3) as result;
+--------------------+
| result             |
+--------------------+
| BhavnaBhavnaBhavna |
+--------------------+
1 row in set (0.00 sec)



mysql> select repeat('*', 10) as result;
+------------+
| result     |
+------------+
| ********** |
+------------+
1 row in set (0.00 sec)




If count is 0:  result will be  empty string
=============
mysql> select repeat('*', 0) as result;
+--------+
| result |
+--------+
|        |
+--------+
1 row in set (0.00 sec)




INSERT() function:
=================
In MySQL, INSERT() is a string function that replaces part of a string with another string.

Syntax:

INSERT(string, position, length, new_string)


mysql> select insert('hello bhavna', 2, 1, 'KAISA') as result;
+------------------+
| result           |
+------------------+
| hKAISAllo bhavna |
+------------------+
1 row in set (0.00 sec)



mysql> select insert('hello bhavna', 2, 5, 'KAISA') as result;
+--------------+
| result       |
+--------------+
| hKAISAbhavna |
+--------------+
1 row in set (0.00 sec)



mysql> select insert('hello bhavna', 2, 7, 'KAISA') as result;
+------------+
| result     |
+------------+
| hKAISAavna |
+------------+
1 row in set (0.00 sec)




ELT() function:  ELT() means Element. Give me the string at this position
===============
It returns the string at a specific position from a list of strings.

Syntax:

ELT(index, string1, string2, string3, ...)

The first argument is the index number.


mysql> select elt(1, 'bhavna', 'Kiya', 'siya');
+----------------------------------+
| elt(1, 'bhavna', 'Kiya', 'siya') |
+----------------------------------+
| bhavna                           |
+----------------------------------+
1 row in set (0.00 sec)



mysql> select elt(0, 'bhavna', 'Kiya', 'siya');
+----------------------------------+
| elt(0, 'bhavna', 'Kiya', 'siya') |
+----------------------------------+
| NULL                             |
+----------------------------------+
1 row in set (0.00 sec)



mysql> select elt(5, 'bhavna', 'Kiya', 'siya');
+----------------------------------+
| elt(5, 'bhavna', 'Kiya', 'siya') |
+----------------------------------+
| NULL                             |
+----------------------------------+
1 row in set (0.00 sec)



ELT() vs LOCATE():
==================

ELT()  Selects an item by its index
LOCATE()  Finds where text occurs

ELT()    ELT(2,'A','B','C') → B    (Works with a list of strings)
LOCATE()   LOCATE('B','ABC') → 2   (earches inside a string)




FIELD() FUNCTION:
==================

FIELD() is closely related to ELT(), but it works in the opposite direction.

FIELD(search_value, value1, value2, value3, ...)


mysql> SELECT FIELD('Python', 'Java', 'Python', 'MySQL') AS RESULT;
+--------+
| RESULT |
+--------+
|      2 |
+--------+
1 row in set (0.00 sec)

Because Python is the 2nd item in the list.


ELT() → position → value
FIELD() → value → position



if the value is not found return 0
===================================


mysql> SELECT FIELD('C++', 'Java', 'Python', 'MySQL');
+-----------------------------------------+
| FIELD('C++', 'Java', 'Python', 'MySQL') |
+-----------------------------------------+
|                                       0 |
+-----------------------------------------+
1 row in set (0.00 sec)









FORMAT() function:
==================

FORMAT() formats a number with commas and a specified number of decimal places.

Syntax:

FORMAT(number, decimal_places)


mysql> SELECT FORMAT(1234567.89, 2);
+-----------------------+
| FORMAT(1234567.89, 2) |
+-----------------------+
| 1,234,567.89          |
+-----------------------+
1 row in set (0.00 sec)



mysql> SELECT FORMAT(1234567.891, 2);
+------------------------+
| FORMAT(1234567.891, 2) |
+------------------------+
| 1,234,567.89           |
+------------------------+
1 row in set (0.00 sec)


mysql> SELECT FORMAT(50000, 2);
+------------------+
| FORMAT(50000, 2) |
+------------------+
| 50,000.00        |
+------------------+
1 row in set (0.00 sec)






FIND_IN_SET()  function:
========================

It searches for a value inside a comma-separated list and returns its position.

Syntax:

FIND_IN_SET(search_string, string_list)


mysql> SELECT FIND_IN_SET('Python', 'Java,Python,MySQL');
+--------------------------------------------+
| FIND_IN_SET('Python', 'Java,Python,MySQL') |
+--------------------------------------------+
|                                          2 |
+--------------------------------------------+
1 row in set (0.00 sec)



mysql> SELECT FIND_IN_SET('C++', 'Java,Python,MySQL');
+-----------------------------------------+
| FIND_IN_SET('C++', 'Java,Python,MySQL') |
+-----------------------------------------+
|                                       0 |
+-----------------------------------------+
1 row in set (0.00 sec)




FIND_IN_SET() vs FIELD()
*************************

FIND_IN_SET() → one comma-separated list

FIELD() → separate values as arguments







=================================================================








SUMMARY
+++++++++++




| Function        | Purpose                                                   | Example                              | Result                                    |
| --------------- | --------------------------------------------------------- | ------------------------------------ | ----------------------------------------- |
| `CONCAT()`      | Joins strings                                             | `CONCAT('Hello',' SQL')`             | `Hello SQL`                               |
| `CONCAT_WS()`   | Joins strings with separator                              | `CONCAT_WS('-', 'A','B','C')`        | `A-B-C`                                   |
| `LENGTH()`      | String length in **bytes**                                | `LENGTH('Hello')`                    | `5`                                       |
| `CHAR_LENGTH()` | Number of **characters**                                  | `CHAR_LENGTH('Hello')`               | `5`                                       |
| `LOWER()`       | Converts to lowercase                                     | `LOWER('HELLO')`                     | `hello`                                   |
| `UPPER()`       | Converts to uppercase                                     | `UPPER('hello')`                     | `HELLO`                                   |
| `LEFT()`        | Gets characters from left                                 | `LEFT('Database',4)`                 | `Data`                                    |
| `RIGHT()`       | Gets characters from right                                | `RIGHT('Database',4)`                | `base`                                    |
| `SUBSTRING()`   | Extracts part of string                                   | `SUBSTRING('Database',1,4)`          | `Data`                                    |
| `SUBSTR()`      | Same as `SUBSTRING()`                                     | `SUBSTR('Database',1,4)`             | `Data`                                    |
| `MID()`         | Same as `SUBSTRING()`                                     | `MID('Database',1,4)`                | `Data`                                    |
| `REPLACE()`     | Replaces text                                             | `REPLACE('Hello SQL','SQL','MySQL')` | `Hello MySQL`                             |
| `TRIM()`        | Removes spaces/characters from ends                       | `TRIM('  Hello  ')`                  | `Hello`                                   |
| `LTRIM()`       | Removes left spaces                                       | `LTRIM('  Hello')`                   | `Hello`                                   |
| `RTRIM()`       | Removes right spaces                                      | `RTRIM('Hello  ')`                   | `Hello`                                   |
| `REVERSE()`     | Reverses string                                           | `REVERSE('SQL')`                     | `LQS`                                     |
| `REPEAT()`      | Repeats string                                            | `REPEAT('SQL',3)`                    | `SQLSQLSQL`                               |
| `LPAD()`        | Adds characters to left                                   | `LPAD('SQL',6,'0')`                  | `000SQL`                                  |
| `RPAD()`        | Adds characters to right                                  | `RPAD('SQL',6,'0')`                  | `SQL000`                                  |
| `POSITION()`    | Finds position of substring                               | `POSITION('SQL' IN 'MySQL')`         | `3`                                       |
| `LOCATE()`      | Finds position of substring                               | `LOCATE('SQL','MySQL')`              | `3`                                       |
| `INSTR()`       | Finds position of substring                               | `INSTR('MySQL','SQL')`               | `3`                                       |
| `ASCII()`       | ASCII value of first character                            | `ASCII('A')`                         | `65`                                      |
| `CHAR()`        | Converts numeric value to character/binary representation | `CHAR(65)`                           | Depends on MySQL character/binary context |
| `FORMAT()`      | Formats number as string                                  | `FORMAT(12345.678,2)`                | `12,345.68`                               |
