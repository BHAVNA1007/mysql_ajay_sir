is null / is not null:

mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.06 sec)

mysql> update employeebatch set city = null where id = 2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+-----



mysql> select * from employeebatch where city=null;
Empty set (0.00 sec)


mysql> select * from employeebatch where city='null';
Empty set (0.00 sec)



NOTE:   NULL means there is no value or value is unknown or value has not been provided


it is not the same as following:::

0
''
'NULL'
'false'

is null: is use to find the rows where a column contains null.


mysql> select * from employeebatch where city is null;
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  2 |   27 | NULL | hr         | 40000.00 | amit |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)



mysql> select * from employeebatch where city is not null;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
4 rows in set (0.00 sec)


mysql> select name from employeebatch where city is not null;
+-------+
| name  |
+-------+
| Rahul |
| priya |
| neha  |
| ravi  |
+-------+


is null with AND: 
******************

mysql> select * from employeebatch where city is null and salary > 35000;
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  2 |   27 | NULL | hr         | 40000.00 | amit |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)


operator presedence with and, or, not:

when we use multiple conditions inside where  mysql has to dicide which condition is to evaluate first.


mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)


mysql> select * from employeebatch where city = 'indore' or city = 'bhopal' and salary > 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)



in mysql the precedence is 

1.  not
2.  and
3.  or


it means whenever we write where 

a or b and c 

then 

it will be interpreted as 

where a or (b and c) 


mysql> select * from employeebatch where city = 'indore' or (city = 'bhopal' and salary > 50000);
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)


WAQ to fatch employees  who are from indore or bhopal, and their salary must be greter then 40000.



mysql> update employeebatch set salary = 45000 where id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeebatch;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)

mysql> select * from employeebatch where (city = 'indore' or city = 'bhopal') and salary > 40000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)



WAQ whose city is not indore.


mysql> select * from employeebatch where not city = 'indore';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
2 rows in set (0.00 sec)



mysql> select * from employeebatch where not city = 'indore' or city is null;
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | NULL   | hr         | 40000.00 | amit |
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
3 rows in set (0.00 sec)



mysql> select * from employeebatch where city <> 'indore';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
2 rows in set (0.00 sec)



WAQ to give me employees who are neither from indore nor bhopal.


wrong result produce:

mysql> select * from employeebatch where not city ='indore'  or city = 'bhopal';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
2 rows in set (0.00 sec)


correct result is:

mysql> select * from employeebatch where not (city ='indore'  or city = 'bhopal');

+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)


not with and:

WAQ TO Give me employees who are not from indore, bhopal and earning more then 50000.

mysql> select * from employeebatch where not city ='indore'and salary > 50000;
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)


correct query:
mysql> select * from employeebatch where not (city ='indore' or city ='bhopal') and salary > 50000;
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)



mysql> select * from employeebatch where city ='indore' or city ='bhopal' and salary > 40000 and age>25;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+--

the above query converted like 

mysql> select * from employeebatch where city ='indore' or (city ='bhopal' and salary > 40000 and age>25);


*****************************************************

i want city indore or bhopal , and salary > 20000 and age > 21

mysql> select * from employeebatch where (city = 'indore' or city = 'bhopal') and salary > 20000 and age > 21;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


*****************************************
where not a or b and c

the above query converted like

where (not a) or (b and c)
******************************************

order by:
is used to sort the rows return by a select query

Syntax:

select column1, column2 from tablename order by columnname;

by default mysql sorts column in assending order (ASC)

NOTE:  order by does not change the actual data stored in the table. it only changes the order in which the result is displayed.




mysql> select * from employeebatch order by salary asc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)



mysql> select * from employeebatch order by salary;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)



mysql> select * from employeebatch order by salary desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)

NOTE: we can select spefic column also.



 ysql> select name from employeebatch order by salary desc;
+-------+
| name  |
+-------+
| neha  |
| priya |
| Rahul |
| amit  |
| ravi  |
+-------+
5 rows in set (0.00 sec)




mysql> select * from employeebatch order by name;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.02 sec)




mysql> select * from employeebatch order by name desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)




mysql> select * from employeebatch order by city;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)




mysql> select * from employeebatch order by city desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)



WAQ to select all the IT employees and display thm from high salary to low salary.


mysql> select * from employeebatch where department = 'IT' order by salary desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


NOTE :  in the above query where decides which row we want and order by decides in which order we want this rows.



order by with multiple columns::


mysql> select * from employeebatch order by city, salary desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)



mysql> select * from employeebatch order by city desc, salary desc;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  1 |   25 | indore | IT         | 45000.00 | Rahul |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
|  2 |   27 | NULL   | hr         | 40000.00 | amit  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)
