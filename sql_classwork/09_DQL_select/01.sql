mysql> use batch18
Database changed


mysql> create table employeebatch(id int auto_increment primary key, age int, city varchar(40), department varchar(30), salary decimal(10,2));
Query OK, 0 rows affected (0.07 sec)


mysql> desc employeebatch;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| age        | int           | YES  |     | NULL    |                |
| city       | varchar(40)   | YES  |     | NULL    |                |
| department | varchar(30)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.03 sec)



mysql> alter table employeebatch add column name varchar(30);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0



mysql> desc employeebatch;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| age        | int           | YES  |     | NULL    |                |
| city       | varchar(40)   | YES  |     | NULL    |                |
| department | varchar(30)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
| name       | varchar(30)   | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)



mysql> insert into employeebatch(age, city, department, salary, name) values(25, 'indore', 'IT', 4500, 'Rahul'),
    -> (27, 'bhopal', 'hr', 40000, 'amit'),
    -> (28, 'indore', 'IT', 55000, 'priya'),
    -> (35, 'pune', 'finance', 60000, 'neha'),
    -> (22, 'bhopal', 'IT', 35000, 'ravi');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0



SELECT COMMAND: 

the select command is use to retrive or read data from one or more tables in mysql it is the most important command in DQL.

SELECT dose not change the data it only fatch the data from the database.

select * : it means select all the columns.
select specific columns: instead of retriving everything specify the required columns.



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
5 rows in set (0.00 sec)

mysql> select name, city from employeebatch;
+-------+--------+
| name  | city   |
+-------+--------+
| Rahul | indore |
| amit  | bhopal |
| priya | indore |
| neha  | pune   |
| ravi  | bhopal |
+-------+--------+
5 rows in set (0.00 sec)

NOTE: the order in which we write column determine the order in the result.

mysql> select salary, city, name from employeebatch;
+----------+--------+-------+
| salary   | city   | name  |
+----------+--------+-------+
|  4500.00 | indore | Rahul |
| 40000.00 | bhopal | amit  |
| 55000.00 | indore | priya |
| 60000.00 | pune   | neha  |
| 35000.00 | bhopal | ravi  |
+----------+--------+-------+
5 rows in set (0.00 sec)



SELECT WITH AN EXPRESSION: SELECT can also perform calculations

mysql> select name, salary, salary*12 from employeebatch;
+-------+----------+-----------+
| name  | salary   | salary*12 |
+-------+----------+-----------+
| Rahul |  4500.00 |  54000.00 |
| amit  | 40000.00 | 480000.00 |
| priya | 55000.00 | 660000.00 |
| neha  | 60000.00 | 720000.00 |
| ravi  | 35000.00 | 420000.00 |
+-------+----------+-----------+
5 rows in set (0.00 sec)


COLUMN ALIAS AS: in the above example the calculted column name salary*12 is not readable we can give an alias name (another name) using alias.


mysql> select name, salary*12 as annual_salary from  employeebatch;
+-------+---------------+
| name  | annual_salary |
+-------+---------------+
| Rahul |      54000.00 |
| amit  |     480000.00 |
| priya |     660000.00 |
| neha  |     720000.00 |
| ravi  |     420000.00 |
+-------+---------------+
5 rows in set (0.00 sec)


mysql> select name as employee_name, salary as monthly_salary from employeebatch;
+---------------+----------------+
| employee_name | monthly_salary |
+---------------+----------------+
| Rahul         |        4500.00 |
| amit          |       40000.00 |
| priya         |       55000.00 |
| neha          |       60000.00 |
| ravi          |       35000.00 |
+---------------+----------------+
5 rows in set (0.00 sec)




mysql> select city from  employeebatch;
+--------+
| city   |
+--------+
| indore |
| bhopal |
| indore |
| pune   |
| bhopal |
+--------+
5 rows in set (0.00 sec)


SELECT DISTINCT: from the above example suppose we want to see destict city 


mysql> select distinct city from  employeebatch;
+--------+
| city   |
+--------+
| indore |
| bhopal |
| pune   |
+--------+
3 rows in set (0.00 sec)




mysql> select city, department from employeebatch;
+--------+------------+
| city   | department |
+--------+------------+
| indore | IT         |
| bhopal | hr         |
| indore | IT         |
| pune   | finance    |
| bhopal | IT         |
+--------+------------+
5 rows in set (0.00 sec)

mysql> select distinct city, department from employeebatch;
+--------+------------+
| city   | department |
+--------+------------+
| indore | IT         |
| bhopal | hr         |
| pune   | finance    |
| bhopal | IT         |
+--------+------------+
4 rows in set (0.00 sec)

NOTE: IN the above example mysql consider the combination of the city+department

for example:

indore it
bhopal hr
indore it

here the duplicate indore + it combination will appear only once.

SELECT WITH WHERE CLAUSE: 

WHERE clause is used to filter the rows. 

mysql> select * from employeebatch where salary > 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)


diffrent operator can be used:

>=
<=
>
<
!=


mysql> select * from employeebatch where salary > 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)

mysql> select * from employeebatch where salary >= 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)

mysql> select * from employeebatch where salary != 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)

mysql> select * from employeebatch where salary < 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


WHERE WITH EQUALITY:  =

mysql> select * from employeebatch where city = 'indore';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)



WHERE WITH AND: 

IN CASE of AND both conditions must be TRUE.

mysql> select * from employeebatch where city = 'indore' AND salary > 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
1 row in set (0.00 sec)


mysql> select * from employeebatch where city = 'indore' AND salary > 50000 AND department = 'hr';
Empty set (0.00 sec)


WHERE WITH OR:

IN CASE of  OR atleast ONE CONDITION MUST be TRUE.

mysql> select * from employeebatch where city = 'indore' OR salary > 50000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


WHERE WITH NOT : 

mysql> select * from employeebatch where not city = 'indore';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
3 rows in set (0.00 sec)


ANOTHER WAY TO WRITE NOT : (<>)

mysql> select * from employeebatch where city <> 'indore';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
3 rows in set (0.00 sec)


USING (!=)

mysql> select * from employeebatch where city != 'indore';
+----+------+--------+------------+----------+------+
| id | age  | city   | department | salary   | name |
+----+------+--------+------------+----------+------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit |
|  4 |   35 | pune   | finance    | 60000.00 | neha |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi |
+----+------+--------+------------+----------+------+
3 rows in set (0.00 sec)


SELECT WITH BETWEEN : 

IT is used when we want value within a range.

between is inclusive (which ever is given is include)


mysql> select * from employeebatch where salary between 40000 and 55000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)



SELECT WITH NOT BETWEEN:

mysql> select * from employeebatch where salary not between 40000 and 55000;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
3 rows in set (0.00 sec)


IN OPERATOR :

IS used to check weather a value matches any value in a given list of values.

It is specially useful when we want to replace multiple or conditions with a sorter and cleaner condition. 


select column1, column2, from tablename where columnname in(value1, value2, value3...);


mysql> select * from employeebatch where city='indore' or city='bhopal' or city='pune';
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)


mysql> select * from employeebatch where city in('indore','bhopal', 'pune');
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  2 |   27 | bhopal | hr         | 40000.00 | amit  |
|  3 |   28 | indore | IT         | 55000.00 | priya |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
|  5 |   22 | bhopal | IT         | 35000.00 | ravi  |
+----+------+--------+------------+----------+-------+
5 rows in set (0.00 sec)


IN WITH NUMBERS:

mysql> select * from employeebatch where age in(25,30,35);
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  1 |   25 | indore | IT         |  4500.00 | Rahul |
|  4 |   35 | pune   | finance    | 60000.00 | neha  |
+----+------+--------+------------+----------+-------+
2 rows in set (0.00 sec)


NOT IN :

mysql> select * from employeebatch where city not in('indore','bhopal');
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)

the above query returns the employees whose city is neither indore not bhopal. 


mysql> select * from employeebatch where city <> 'indore' and city <> 'bhopal';
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)


mysql> select * from employeebatch where city != 'indore' and city != 'bhopal';
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)


NOTE:
*****

IN WORKS LIKE MULTIPLE OR .

NOT IN WORKS LIKE MULTIPLE AND.


IN WITH WHERE + AND:

WE can combine in with other conditions.


mysql> select * from employeebatch where city in('indore','bhopal') and age > 27;
+----+------+--------+------------+----------+-------+
| id | age  | city   | department | salary   | name  |
+----+------+--------+------------+----------+-------+
|  3 |   28 | indore | IT         | 55000.00 | priya |
+----+------+--------+------------+----------+-------+
1 row in set (0.00 sec)

the above query give the list of employees whose city is either indore or bhopal and their age must be greater the 27.


mysql> select * from employeebatch where city not in('indore') and age > 27;
+----+------+------+------------+----------+------+
| id | age  | city | department | salary   | name |
+----+------+------+------------+----------+------+
|  4 |   35 | pune | finance    | 60000.00 | neha |
+----+------+------+------------+----------+------+
1 row in set (0.00 sec)




