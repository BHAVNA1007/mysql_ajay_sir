DELETE :
IS A DML command which is use to remove existing record from a table.

SYNTAX: 

DELETE FROM tablename WHERE condition;


WHERE is not mendatory without where all rows will be deleted.

mysql> delete from employeeup where  employee_id = 3;
Query OK, 1 row affected (0.03 sec)

mysql> select * from employeeup;
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary    | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai |  90205.50 |          2 |   25 | 2023-06-10   | Active   |
|           2 | Rahul         | IT         | Bhopal |  94334.30 |          4 |   29 | 2021-04-15   | Inactive |
|           4 | Neha          | Finance    | goa    | 111055.30 |          5 |   30 | 2020-01-10   | Inactive |
|           5 | Vikas         | hr         | bhopal |  99186.12 |          8 |   35 | 2018-03-12   | Inactive |
|           6 | Sneha         | HR         | Indore |  78246.00 |          3 |   27 | 2022-07-18   | Inactive |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
5 rows in set (0.00 sec)




WAQ TO delete all the employees who belong to hr department

mysql> delete from employeeup where  department = 'HR';
Query OK, 2 rows affected (0.01 sec)

mysql> select * from employeeup;
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary    | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai |  90205.50 |          2 |   25 | 2023-06-10   | Active   |
|           2 | Rahul         | IT         | Bhopal |  94334.30 |          4 |   29 | 2021-04-15   | Inactive |
|           4 | Neha          | Finance    | goa    | 111055.30 |          5 |   30 | 2020-01-10   | Inactive |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
3 rows in set (0.00 sec)



DELETE IT employees having more then 3 years of experience.

mysql> delete from employeeup where  department = 'IT'  AND  experience > 3;
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeeup;
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary    | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai |  90205.50 |          2 |   25 | 2023-06-10   | Active   |
|           4 | Neha          | Finance    | goa    | 111055.30 |          5 |   30 | 2020-01-10   | Inactive |
+-------------+---------------+------------+--------+-----------+------------+------+--------------+----------+
2 rows in set (0.00 sec)




WAQ TO delete employees who are not from IT OR HR

mysql> delete from employeeup where  department not in('HR', 'IT');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeeup;
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
| employee_id | employee_name | department | city   | salary   | experience | age  | joining_date | status |
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
|           1 | Amit          | IT         | Mumbai | 90205.50 |          2 |   25 | 2023-06-10   | Active |
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
1 row in set (0.00 sec)



WAQ to delete employees who joined before 2020

mysql> delete from employeeup where  joining_date < '2020-01-01';
Query OK, 0 rows affected (0.00 sec)

mysql> select * from employeeup;
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
| employee_id | employee_name | department | city   | salary   | experience | age  | joining_date | status |
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
|           1 | Amit          | IT         | Mumbai | 90205.50 |          2 |   25 | 2023-06-10   | Active |
+-------------+---------------+------------+--------+----------+------------+------+--------------+--------+
1 row in set (0.00 sec)




waq to delete the employees with the lowest salary

mysql> delete from employeeup order by salary limit 1;
Query OK, 1 row affected (0.02 sec)

mysql> select * from employeeup;
Empty set (0.00 sec)




waq to delete the employees with the Higest salary

mysql> delete from employeeup order by salary DESC limit 1;
Query OK, 0 rows affected (0.00 sec)




WAQ TO DELETE LOWEST PAID IT EMPLOYEES.

mysql> delete from employeeup where department = 'IT' order by salary ASC limit 1;




WAQ to delete IT OR HR employees whose salary below 60000

delete from employeeup where department in('IT', 'HR') AND  salary < 60000;

**************************************************************


DEFFRENCE BETWEEN DELETE AND TRUNCATE.


-------------------------

DELETE - DML 

TRUNCATE - DDL

----------------

DELETE CAN USE WHERE

TRUNCATE CAN NOT USE WHERE

-------------------

DELETE CAN DELETE SELECTED ROWS ALSO

TRUNCATE IT REMOVES ALL ROWS.


-------------------------

DELETE WE CAN USE CONDITIONS

TRUNCATE NO CONDITIONS

-----------------------


DELETE IT CAN USE ORDER BY, LIMIT ETC

TRUNCATE   CAN NOT USE ANYTHING

-----------------------------

DELETE IT FOLLOWS ROW BY ROW DELETION SYMANTICS.

TRUNCATE IT DEALLOCATES TABLE DATA MORE DIRECTLY.

---------------------------

DELETE IT CAN BE ROOLED BACK WHEN USED WITHIN A TRANSACTION UNDER APPROPRIATE TRANSACTIONAL CONDITION.

TRUNCATE USES IMPLICITE COMMIT SO NO ROLL BACK.

-----------------------------

DELETE DOSE NOT RESET AUTO_INCREMENT.

TRUNCATE RESET AUTO_INCREMENT IT MEANS NEXT TIME WHEN WE ARE GOING TO INSERT DATA IT START FROM 1.

-------------------------------------

****************************************************************************************************************

DELETE VS DROP

--------------------------

DELETE - DML

DROP - DDL

---------------

DELETE - IT REMOVE ROWS.

DROP - IT REMOVE DATABASE OBJECT ITSELF.

---------------------

DELETE - AFTER DELETE TABLE STRUCTURE REMAINS.
 
DROP - AFTER DROP TABLE STRUCTURE REMOVE.
----------------------

DELETE - IN DELETE COLUMN, CONSTRAINS, AND INDEX WILL REMAIN.

DROP - BUT IN DROP ALL THREE WILL BE REMOVE.

------------------

DELETE - WHERE ALLOWED

DROP - NOT ALLOWED

---------------

DELETE - IN DELETE SELECTED OR ALL ROWS WILL BE DELETED.

DROP - BUT IN DROP IT IS NOT POSIIBLE.

--------------

DELETE - ROLL BACK POSSILBE

DROP - ALUTO COMMIT THATS WHY ROLL BACK NOT POSIIBLE.

----------------

DELETE - AUTO_INCREMENT NOT RESET

DROP - OBJECT WILL BE REMOVE SO, NO CONCEPT OF AUTO_INCREMENT.

---------------


********************************************
H.W

CAN WE USE OFFSET WITH DELETE.
********************************************




TCL - TRANSACTION CONTROL LANGUAGE:
=====================================

TCL COMMANDS ARE USE TO MANAGE TRANSACTIONS IN A DATABASE.

A TRANSACTION IS A GROUP OF SQL STATEMENTS THAT SHOULD BE TREATED AS ONE LOGICAL UNIT OF WORK.


COMMON COMMAND OF TCL:
=========================

START TRANSACTION
COMMIT
ROLLBACK
SAVEPOINT
ROLLBACK TO SAVEPOINT
RELEASE SAVEPOINT

SYNTAX: 

start transaction;

sql statement 1;

sql statement 1;

sql statement 1;

commit;

OR

begin;

sql statements;

commit;



COMMIT: COMMIT permanentally saves all changes made during the current transaction.




mysql> create table accounts(accid int primary key, accname varchar(20), balance decimal(10,2));
Query OK, 0 rows affected (0.05 sec)

mysql> desc accounts;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| accid   | int           | NO   | PRI | NULL    |       |
| accname | varchar(20)   | YES  |     | NULL    |       |
| balance | decimal(10,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into accounts values(101, 'rahul', 10000), (102, 'amit', 5000)
;
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from accounts;
+-------+---------+----------+
| accid | accname | balance  |
+-------+---------+----------+
|   101 | rahul   | 10000.00 |
|   102 | amit    |  5000.00 |
+-------+---------+----------+
2 rows in set (0.00 sec)



mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update accounts set balance = balance - 2000 where accid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 5000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

mysql> update accounts set balance = balance + 2000 where accid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 7000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 7000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

___________________________________________

ROLLBACK : is used to undo changes made during the current transaction. 

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update accounts set balance = balance - 3000 where accid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 4000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

mysql> update accounts set balance = balance + 3000 where accid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+----------+
| accid | accname | balance  |
+-------+---------+----------+
|   101 | rahul   | 11000.00 |
|   102 | amit    |  4000.00 |
+-------+---------+----------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 7000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)


now we are on our initial state revert all changes.
no changes commit yet. 

_______________________________________________________

here transactio starts:

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 7000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

mysql> update accounts set balance = balance + 2000 where accid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+----------+
| accid | accname | balance  |
+-------+---------+----------+
|   101 | rahul   | 10000.00 |
|   102 | amit    |  7000.00 |
+-------+---------+----------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)


here transaction end

mysql> select * from accounts;
+-------+---------+---------+
| accid | accname | balance |
+-------+---------+---------+
|   101 | rahul   | 8000.00 |
|   102 | amit    | 7000.00 |
+-------+---------+---------+
2 rows in set (0.00 sec)

HERE REVERT POSSIBLE. BEACAUSE WE STARTED HERE TRANSACTION.

______________________________________


HERE WE CAN NOT START SO

mysql> update accounts set balance = balance + 2000 where accid = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from accounts;
+-------+---------+----------+
| accid | accname | balance  |
+-------+---------+----------+
|   101 | rahul   | 10000.00 |
|   102 | amit    |  7000.00 |
+-------+---------+----------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from accounts;
+-------+---------+----------+
| accid | accname | balance  |
+-------+---------+----------+
|   101 | rahul   | 10000.00 |
|   102 | amit    |  7000.00 |
+-------+---------+----------+
2 rows in set (0.00 sec)

CAN NOT REVERT, ROLLBACK NOT WORKS HERE BECASUSE BE CAN NOT START TRANSACTION.
_______________________________________






mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into accounts values(105, 'rashmika', 50000, 'hyd');
Query OK, 1 row affected (0.00 sec)

mysql> ALTER TABLE accounts add age int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into accounts values(106, 'katappa', 1150000, 'hyd', 30);
Query OK, 1 row affected (0.01 sec)

mysql> select * from accounts;
+-------+----------+------------+---------+------+
| accid | accname  | balance    | address | age  |
+-------+----------+------------+---------+------+
|   101 | rahul    |   10000.00 | NULL    | NULL |
|   102 | amit     |    7000.00 | NULL    | NULL |
|   103 | thapaji  |   15000.00 | NULL    | NULL |
|   104 | dipu     |  150000.00 | chennai | NULL |
|   105 | rashmika |   50000.00 | hyd     | NULL |
|   106 | katappa  | 1150000.00 | hyd     |   30 |
+-------+----------+------------+---------+------+
6 rows in set (0.00 sec)

mysql> select * from accounts;
+-------+----------+------------+---------+------+
| accid | accname  | balance    | address | age  |
+-------+----------+------------+---------+------+
|   101 | rahul    |   10000.00 | NULL    | NULL |
|   102 | amit     |    7000.00 | NULL    | NULL |
|   103 | thapaji  |   15000.00 | NULL    | NULL |
|   104 | dipu     |  150000.00 | chennai | NULL |
|   105 | rashmika |   50000.00 | hyd     | NULL |
|   106 | katappa  | 1150000.00 | hyd     |   30 |
+-------+----------+------------+---------+------+
6 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from accounts;
+-------+----------+------------+---------+------+
| accid | accname  | balance    | address | age  |
+-------+----------+------------+---------+------+
|   101 | rahul    |   10000.00 | NULL    | NULL |
|   102 | amit     |    7000.00 | NULL    | NULL |
|   103 | thapaji  |   15000.00 | NULL    | NULL |
|   104 | dipu     |  150000.00 | chennai | NULL |
|   105 | rashmika |   50000.00 | hyd     | NULL |
|   106 | katappa  | 1150000.00 | hyd     |   30 |
+-------+----------+------------+---------+------+
6 rows in set (0.00 sec)




















