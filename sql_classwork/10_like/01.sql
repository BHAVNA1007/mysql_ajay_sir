LIKE: 

it is mainly used when we dont no the exact value but want to find values that startwith, endwith,  contain or follow a perticular pattern.


select column1, column2 from tablename where columnname like 'pattern';



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
5 rows in set (0.04 sec)



mysql> select * from employeebatch where name like 'A%';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
+----+------+--------+------------+----------+------+
1 row in set (0.00 sec)



The above query finds employess whose name startswith a/A

wildcards in like:

mysql mainly provids 2 important vild card characters for like

1.   %

it means any number of characters it can be 0, 1, or many characters

2. _ (underscore):

it means exactly one character



Q.  Write a query to display all the employess whose name end with A.


mysql> select * from employeebatch where name like '%A';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)


mysql> select * from employeebatch where name like '%i%';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


here %i% means before i 0 or more characters are posible and after i 0 or more characters are posible




2. underscore(_): Exactly Characters

mysql> select * from employeebatch where name like '_';
Empty set (0.00 sec)


mysql> select * from employeebatch where name like '__';
Empty set (0.00 sec)


mysql> select * from employeebatch where name like '___';
Empty set (0.00 sec)


mysql> select * from employeebatch where name like '____';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
3 rows in set (0.00 sec)



mysql> select * from employeebatch where name like 'a_it';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
+----+------+--------+------------+----------+------+
1 row in set (0.00 sec)




Q. Write a query to find names startswith a and ends with t.


mysql> select * from employeebatch where name like 'a%t';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
+----+------+--------+------------+----------+------+
1 row in set (0.00 sec)


LIKE WITH END:

mysql> select * from employeebatch where name like 'r%' and city='indore';
+----+------+--------+------------+---------+-------+
| id | age  | city   | department | salary  | name  |
+----+------+--------+------------+---------+-------+
|  1 |   25 | indore | IT         | 4500.00 | Rahul |
+----+------+--------+------------+---------+-------+
1 row in set (0.00 sec)




Q. write a query for name starts with a or starts with r .

mysql> select * from employeebatch where name like 'a%' or name like 'r%';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)





Q. find employees whose name do not start with a

mysql> select * from employeebatch where name not like 'a%';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
4 rows in set (0.00 sec)




Q. write a query TO find age starts with 2. 

mysql> select * from employeebatch where age like '2%';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
4 rows in set (0.00 sec)




NOTE : like is primarily used with character or string data but mysql can perform implicite conversion in some situations when used with numeric columns. 


LIKE WITH EMAIL: 

select * from employee where email like '%@gmail.com';




Q. WAQ to give list of employees whose mail conatains infobeans.


select * from employee where email like '%infobeans%';




LIKE WITH MOBILE NUMBER:

select * from employee where mobile like '98%';

select * from employee where mobile like '98________';


LIKE VS = :

IN CASE of = exact match will happen.

BUT IN CASE of LIKE pattern matching will be there.

mysql> select * from employeebatch where name like 'priya';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
1 row in set (0.00 sec)


mysql> select * from employeebatch where name = 'priya';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
1 row in set (0.00 sec)


IN VS LIKE:

IN is used when we have knwon list of exact values

where city in('bhopal', 'indore')

like.......pattern


*******************************************************

mysql> create table product10(pid int, name varchar(20), discount varchar(20));
Query OK, 0 rows affected (0.05 sec)


mysql> insert into product10 values(1, 'laptop', '30%'), (2, 'mobile', '30%'), (3, 'watch', '50%');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select * from product10;
+------+--------+----------+
| pid  | name   | discount |
+------+--------+----------+
|    1 | laptop | 30%      |
|    2 | mobile | 30%      |
|    3 | watch  | 50%      |
+------+--------+----------+
3 rows in set (0.00 sec)


mysql> select * from product10 where discount like '30%';
+------+--------+----------+
| pid  | name   | discount |
+------+--------+----------+
|    1 | laptop | 30%      |
|    2 | mobile | 30%      |
+------+--------+----------+
2 rows in set (0.00 sec)



NOTE: if we want to search for the actual % character then in that case we can escap it using \% in the same we scap (_) underscore also.


mysql> select * from product10;
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



mysql> select * from product10 where  description like '%20%';
+------+---------+----------+----------------------------+
| pid  | name    | discount | description                |
+------+---------+----------+----------------------------+
|    4 | mobile1 | 20%      | we are giving 20% discount |
+------+---------+----------+----------------------------+
1 row in set (0.00 sec)