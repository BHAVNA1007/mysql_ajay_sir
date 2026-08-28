MULTIPLE UPDATE: you can update multiple columns in the same statement 



update using comparision operator:


WAQ.   to give 5000 increment to IT employees having atleast 5 years of experience. 


WAQ. to give increment og 3000 to hr department or finance department.


UPDATE WITH IN:


give increment 4000 department using

WAQ : to give increment 10000 to all employees outside hr and finace department


WAQ : to increment of 7000 to all the employees whose salary  is between 60000 and 70000. 

WAQ: to move all the em[loyees] to it department whose name start with a


WAQ : to update all the employee city to goa who do not have any city

WAQ:


WAQ : TO GIVE 15% INCEMENT TO IT EMPLOYEES HAVING MORE THEN 5 YEAR OF EXPERIENCE AND SALARY BELOW 80000


WAQ: TO give increment to those employees who join before 2020.


CASE STATEMENT : case is a conditional expression in mysql use to return diffrent values based on different condition . it works similar to if else in programming language. 


CASE 
    WHEN condition1 then result1
    WHEN condition2 then result2
    WHEN condition3 then result3
    else result
END ;   

mysql> select employee_name, salary, case when salary >= 80000 then 'High' when salary >= 50000 then 'medium' else 'low' end  as salary_category from employeeup;
+---------------+-----------+-----------------+
| employee_name | salary    | salary_category |
+---------------+-----------+-----------------+
| Amit          |  78100.00 | medium          |
| Rahul         |  75900.00 | medium          |
| Priya         | 113268.10 | High            |
| Neha          |  97000.00 | High            |
| Vikas         |  83490.00 | High            |
| Sneha         |  69000.00 | medium          |
+---------------+-----------+-----------------+
6 rows in set (0.00 sec)


CASE WITH ORDER BY: is usefull when we want custom sorting instead of normal alphabetical or numerical sorting. 

select employee_name, department, salary, from employeeup  order by case when department ='IT' department = 'HR' then 2 when  department='Finance' then 3 when  department='sales' then 4 else 5 end;


WAQ to give 10 increment to it department 8% increment to hr and 7% finance

WAQ: to give increment of 15% whose exprerience greater then 8 y give incre 10% whose experience is greter then 5 give 7% whise exp greater 3 other wise 5%


update with limit;

WAQ: TO update status of 1 hr employee to inactive 


WAQ: to give 5000 increment to the lowest paid IT employee


WAQ: to incre the salary of emp by 10000 who is sec highest paid






********************************************************************


mysql> select * from employeeup;
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary   | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai | 87198.00 |          2 |   25 | 2023-06-10   | Active   |
|           2 | Rahul         | HR         | Bhopal | 65318.40 |          4 |   29 | 2021-04-15   | Inactive |
|           3 | Priya         | IT         | Indore | 93170.00 |          6 |   32 | 2019-08-20   | Active   |
|           4 | Neha          | Finance    | Delhi  | 72760.00 |          5 |   30 | 2020-01-10   | Inactive |
|           5 | Vikas         | IT         | Pune   | 99825.00 |          8 |   35 | 2018-03-12   | Active   |
|           6 | Sneha         | HR         | Indore | 71150.40 |          3 |   27 | 2022-07-18   | Inactive |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.03 sec)


mysql> update employeeup set salary = 50000 where employee_id = 1;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeeup;
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary   | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai | 50000.00 |          2 |   25 | 2023-06-10   | Active   |
|           2 | Rahul         | HR         | Bhopal | 65318.40 |          4 |   29 | 2021-04-15   | Inactive |
|           3 | Priya         | IT         | Indore | 93170.00 |          6 |   32 | 2019-08-20   | Active   |
|           4 | Neha          | Finance    | Delhi  | 72760.00 |          5 |   30 | 2020-01-10   | Inactive |
|           5 | Vikas         | IT         | Pune   | 99825.00 |          8 |   35 | 2018-03-12   | Active   |
|           6 | Sneha         | HR         | Indore | 71150.40 |          3 |   27 | 2022-07-18   | Inactive |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql> select  employee_id,salary from employeeup;
+-------------+----------+
| employee_id | salary   |
+-------------+----------+
|           1 | 50000.00 |
|           2 | 65318.40 |
|           3 | 93170.00 |
|           4 | 72760.00 |
|           5 | 99825.00 |
|           6 | 71150.40 |
+-------------+----------+
6 rows in set (0.00 sec)

mysql> select  employee_id, city, department, salary from employeeup;
+-------------+--------+------------+----------+
| employee_id | city   | department | salary   |
+-------------+--------+------------+----------+
|           1 | Mumbai | IT         | 50000.00 |
|           2 | Bhopal | HR         | 65318.40 |
|           3 | Indore | IT         | 93170.00 |
|           4 | Delhi  | Finance    | 72760.00 |
|           5 | Pune   | IT         | 99825.00 |
|           6 | Indore | HR         | 71150.40 |
+-------------+--------+------------+----------+
6 rows in set (0.00 sec)





mysql> update employeeup set salary = 20000, city = 'bhopal', department='hr' where employee_id = 5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeeup;
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
| employee_id | employee_name | department | city   | salary   | experience | age  | joining_date | status   |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
|           1 | Amit          | IT         | Mumbai | 50000.00 |          2 |   25 | 2023-06-10   | Active   |
|           2 | Rahul         | HR         | Bhopal | 65318.40 |          4 |   29 | 2021-04-15   | Inactive |
|           3 | Priya         | IT         | Indore | 93170.00 |          6 |   32 | 2019-08-20   | Active   |
|           4 | Neha          | Finance    | Delhi  | 72760.00 |          5 |   30 | 2020-01-10   | Inactive |
|           5 | Vikas         | hr         | bhopal | 20000.00 |          8 |   35 | 2018-03-12   | Active   |
|           6 | Sneha         | HR         | Indore | 71150.40 |          3 |   27 | 2022-07-18   | Inactive |
+-------------+---------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql> select  employee_id, city, department, salary from employeeup;
+-------------+--------+------------+----------+
| employee_id | city   | department | salary   |
+-------------+--------+------------+----------+
|           1 | Mumbai | IT         | 50000.00 |
|           2 | Bhopal | HR         | 65318.40 |
|           3 | Indore | IT         | 93170.00 |
|           4 | Delhi  | Finance    | 72760.00 |
|           5 | bhopal | hr         | 20000.00 |
|           6 | Indore | HR         | 71150.40 |
+-------------+--------+------------+----------+
6 rows in set (0.00 sec)

mysql> update employeeup set salary =55000 where salary > 50000;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> update employeeup set salary =55000 where salary < 50000;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select  employee_id, city, department, salary from employeeup;
+-------------+--------+------------+----------+
| employee_id | city   | department | salary   |
+-------------+--------+------------+----------+
|           1 | Mumbai | IT         | 50000.00 |
|           2 | Bhopal | HR         | 55000.00 |
|           3 | Indore | IT         | 55000.00 |
|           4 | Delhi  | Finance    | 55000.00 |
|           5 | bhopal | hr         | 55000.00 |
|           6 | Indore | HR         | 55000.00 |
+-------------+--------+------------+----------+
6 rows in set (0.00 sec)

mysql> select  employee_id, experience from employeeup;
+-------------+------------+
| employee_id | experience |
+-------------+------------+
|           1 |          2 |
|           2 |          4 |
|           3 |          6 |
|           4 |          5 |
|           5 |          8 |
|           6 |          3 |
+-------------+------------+
6 rows in set (0.00 sec)

mysql> update employeeup set salary =90000 where experience=5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select  employee_id, experience, salary from employeeup;
+-------------+------------+----------+
| employee_id | experience | salary   |
+-------------+------------+----------+
|           1 |          2 | 50000.00 |
|           2 |          4 | 55000.00 |
|           3 |          6 | 55000.00 |
|           4 |          5 | 90000.00 |
|           5 |          8 | 55000.00 |
|           6 |          3 | 55000.00 |
+-------------+------------+----------+
6 rows in set (0.00 sec)







WAQ.   to give 5000 increment to IT employees having at least 5 years of experience. 


mysql> update employeeup set salary = salary+5000 where department='IT' AND experience>=5;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select  employee_id, experience, salary, department from employeeup;
+-------------+------------+----------+------------+
| employee_id | experience | salary   | department |
+-------------+------------+----------+------------+
|           1 |          2 | 50000.00 | IT         |
|           2 |          4 | 55000.00 | HR         |
|           3 |          6 | 60000.00 | IT         |
|           4 |          5 | 90000.00 | Finance    |
|           5 |          8 | 55000.00 | hr         |
|           6 |          3 | 55000.00 | HR         |
+-------------+------------+----------+------------+
6 rows in set (0.00 sec)




WAQ. to give increment of 3000 to hr department or finance department.

mysql> update employeeup set salary = salary+3000 where department='HR' OR department='finance';
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0





UPDATE WITH IN:
===============

WAQ:    give increment 4000 department using IN 


mysql> update employeeup set salary = salary+4000 where department in('HR', 'IT', 'finance');
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0




WAQ : to give increment 10000 to all employees outside hr and finance department


mysql> update employeeup set salary = salary+10000 where department not in('HR', 'finance');
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select  employee_id, experience, salary, department from employeeup;
+-------------+------------+----------+------------+
| employee_id | experience | salary   | department |
+-------------+------------+----------+------------+
|           1 |          2 | 64000.00 | IT         |
|           2 |          4 | 62000.00 | HR         |
|           3 |          6 | 74000.00 | IT         |
|           4 |          5 | 97000.00 | Finance    |
|           5 |          8 | 62000.00 | hr         |
|           6 |          3 | 62000.00 | HR         |
+-------------+------------+----------+------------+
6 rows in set (0.00 sec)





WAQ : to increment of 7000 to all the employees whose salary  is between 60000 and 70000. 


mysql> update employeeup set salary = salary+7000 where salary between 60000 and 70000;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0






WAQ: to move all the employees to it department whose name start with r


mysql> update employeeup set department='IT' where employee_name like 'r%';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select  employee_id, employee_name, department from employeeup;
+-------------+---------------+------------+
| employee_id | employee_name | department |
+-------------+---------------+------------+
|           1 | Amit          | IT         |
|           2 | Rahul         | IT         |
|           3 | Priya         | IT         |
|           4 | Neha          | Finance    |
|           5 | Vikas         | hr         |
|           6 | Sneha         | HR         |
+-------------+---------------+------------+
6 rows in set (0.00 sec)






WAQ : to update all the employee city to goa who do not have any city


mysql> update employeeup set city='goa' where city is null;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select  employee_id, employee_name, city from employeeup;
+-------------+---------------+--------+
| employee_id | employee_name | city   |
+-------------+---------------+--------+
|           1 | Amit          | Mumbai |
|           2 | Rahul         | Bhopal |
|           3 | Priya         | Indore |
|           4 | Neha          | Delhi  |
|           5 | Vikas         | bhopal |
|           6 | Sneha         | Indore |
+-------------+---------------+--------+
6 rows in set (0.00 sec)



mysql> update employeeup set city=null where city = 'delhi';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> update employeeup set city='goa' where city is null;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select  employee_id, employee_name, city from employeeup;
+-------------+---------------+--------+
| employee_id | employee_name | city   |
+-------------+---------------+--------+
|           1 | Amit          | Mumbai |
|           2 | Rahul         | Bhopal |
|           3 | Priya         | Indore |
|           4 | Neha          | goa    |
|           5 | Vikas         | bhopal |
|           6 | Sneha         | Indore |
+-------------+---------------+--------+
6 rows in set (0.00 sec)




WAQ : TO GIVE 10% INCEMENT TO IT EMPLOYEES .


mysql> update employeeup set salary = salary*1.10 where department = 'it';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select  employee_id, department, salary from employeeup;
+-------------+------------+----------+
| employee_id | department | salary   |
+-------------+------------+----------+
|           1 | IT         | 78100.00 |
|           2 | IT         | 75900.00 |
|           3 | IT         | 81400.00 |
|           4 | Finance    | 97000.00 |
|           5 | hr         | 69000.00 |
|           6 | HR         | 69000.00 |
+-------------+------------+----------+
6 rows in set (0.00 sec)





WAQ : TO GIVE 15% INCEMENT TO IT EMPLOYEES HAVING MORE THEN 5 YEAR OF EXPERIENCE AND SALARY BELOW 80000


mysql> update employeeup set salary = salary*1.15 where department = 'it' and experience >= 5 and salary< 80000;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0




WAQ : TO GIVE 15% INCEMENT TO IT EMPLOYEES HAVING MORE THEN 5 YEAR OF EXPERIENCE AND SALARY BELOW 85000


mysql> update employeeup set salary = salary*1.15 where department = 'it' and experience >= 5 and salary< 85000;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select  employee_id, department, salary, experience from employeeup;
+-------------+------------+----------+------------+
| employee_id | department | salary   | experience |
+-------------+------------+----------+------------+
|           1 | IT         | 78100.00 |          2 |
|           2 | IT         | 75900.00 |          4 |
|           3 | IT         | 93610.00 |          6 |
|           4 | Finance    | 97000.00 |          5 |
|           5 | hr         | 69000.00 |          8 |
|           6 | HR         | 69000.00 |          3 |
+-------------+------------+----------+------------+
6 rows in set (0.00 sec)





mysql> update employeeup set salary = salary*1.15 and experience=experience+1 where department = 'it' and experience >= 5 and salary< 80000;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0






WAQ: TO give increment to those employees who join before 2020.


mysql> select  employee_id, employee_name, joining_date, salary from employeeup;
+-------------+---------------+--------------+----------+
| employee_id | employee_name | joining_date | salary   |
+-------------+---------------+--------------+----------+
|           1 | Amit          | 2023-06-10   | 78100.00 |
|           2 | Rahul         | 2021-04-15   | 75900.00 |
|           3 | Priya         | 2019-08-20   | 93610.00 |
|           4 | Neha          | 2020-01-10   | 97000.00 |
|           5 | Vikas         | 2018-03-12   | 69000.00 |
|           6 | Sneha         | 2022-07-18   | 69000.00 |
+-------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> update employeeup set salary = salary*1.10 where joining_date <'2020-01-01';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select  employee_id, employee_name, joining_date, salary from employeeup;
+-------------+---------------+--------------+-----------+
| employee_id | employee_name | joining_date | salary    |
+-------------+---------------+--------------+-----------+
|           1 | Amit          | 2023-06-10   |  78100.00 |
|           2 | Rahul         | 2021-04-15   |  75900.00 |
|           3 | Priya         | 2019-08-20   | 102971.00 |
|           4 | Neha          | 2020-01-10   |  97000.00 |
|           5 | Vikas         | 2018-03-12   |  75900.00 |
|           6 | Sneha         | 2022-07-18   |  69000.00 |
+-------------+---------------+--------------+-----------+
6 rows in set (0.00 sec)


mysql> update employeeup set salary = salary*1.10 where year(joining_date) <'2020';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0






CASE STATEMENT : 
=================
case is a conditional expression in mysql use to return diffrent values based on different condition . it works similar to if else in programming language. 


CASE 
    WHEN condition1 then result1
    WHEN condition2 then result2
    WHEN condition3 then result3
    else result
END ;   




mysql> select employee_name, salary, case when salary >= 80000 then 'High' when salary >= 50000 then 'medium' else 'low' end  as salary_category from employeeup;
+---------------+-----------+-----------------+
| employee_name | salary    | salary_category |
+---------------+-----------+-----------------+
| Amit          |  78100.00 | medium          |
| Rahul         |  75900.00 | medium          |
| Priya         | 113268.10 | High            |
| Neha          |  97000.00 | High            |
| Vikas         |  83490.00 | High            |
| Sneha         |  69000.00 | medium          |
+---------------+-----------+-----------------+
6 rows in set (0.00 sec)





CASE WITH ORDER BY:
======================

is usefull when we want custom sorting instead of normal alphabetical or numerical sorting. 


mysql>  SELECT employee_name, department, salary FROM employeeup ORDER BY
    ->  CASE
    ->  WHEN department= 'IT' then 1
    -> WHEN department= 'HR' then 2
    -> WHEN department= 'Finance' then 3
    ->  WHEN department= 'Salaes' then 4
    ->  ELSE 5
    -> END;

+---------------+------------+-----------+
| employee_name | department | salary    |
+---------------+------------+-----------+
| Amit          | IT         |  78100.00 |
| Rahul         | IT         |  75900.00 |
| Priya         | IT         | 113268.10 |
| Vikas         | hr         |  83490.00 |
| Sneha         | HR         |  69000.00 |
| Neha          | Finance    |  97000.00 |
+---------------+------------+-----------+
6 rows in set (0.00 sec)




WAQ :  to give 10% increment to IT department,  8% increment to HR and 7%  increment to finance department.

mysql> update employeeup set salary=
    -> case
    -> when department= 'IT' then salary*1.10
    -> when department= 'HR' then salary*1.08
    -> WHEN department= 'Finance' then salary*1.07
    -> else salary
    -> end;
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql>  SELECT employee_name, employee_id, department, salary FROM employeeup;
+---------------+-------------+------------+-----------+
| employee_name | employee_id | department | salary    |
+---------------+-------------+------------+-----------+
| Amit          |           1 | IT         |  85910.00 |
| Rahul         |           2 | IT         |  83490.00 |
| Priya         |           3 | IT         | 124594.91 |
| Neha          |           4 | Finance    | 103790.00 |
| Vikas         |           5 | hr         |  90169.20 |
| Sneha         |           6 | HR         |  74520.00 |
+---------------+-------------+------------+-----------+
6 rows in set (0.00 sec)




WAQ: to give increment of 15% whose exprerience greater then 8 year, give increment 10% whose experience is greter then 5 year,  give 7% whose experience greater then 3, otherwise 5%.


mysql> update employeeup set salary=
    -> case
    -> when experience>8 then salary*1.15
    -> when experience>5 then salary*1.10
    -> when experience>3 then salary*1.07
    -> else salary*1.05
    -> END;


Query OK, 6 rows affected, 1 warning (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 1

mysql>  SELECT employee_name, employee_id, department, salary FROM employeeup;
+---------------+-------------+------------+-----------+
| employee_name | employee_id | department | salary    |
+---------------+-------------+------------+-----------+
| Amit          |           1 | IT         |  90205.50 |
| Rahul         |           2 | IT         |  89334.30 |
| Priya         |           3 | IT         | 137054.40 |
| Neha          |           4 | Finance    | 111055.30 |
| Vikas         |           5 | hr         |  99186.12 |
| Sneha         |           6 | HR         |  78246.00 |
+---------------+-------------+------------+-----------+
6 rows in set (0.00 sec)






mysql> select  employee_name, status, department from   employeeup;
+---------------+----------+------------+
| employee_name | status   | department |
+---------------+----------+------------+
| Amit          | Active   | IT         |
| Rahul         | Inactive | IT         |
| Priya         | Active   | IT         |
| Neha          | Inactive | Finance    |
| Vikas         | Active   | hr         |
| Sneha         | Inactive | HR         |
+---------------+----------+------------+
6 rows in set (0.00 sec)




update with limit:
====================

WAQ: TO update status of 1 hr employee to inactive 


mysql> update  employeeup set status='Inactive' where  department='hr' limit 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select  employee_name, status, department from   employeeup;
+---------------+----------+------------+
| employee_name | status   | department |
+---------------+----------+------------+
| Amit          | Active   | IT         |
| Rahul         | Inactive | IT         |
| Priya         | Active   | IT         |
| Neha          | Inactive | Finance    |
| Vikas         | Inactive | hr         |
| Sneha         | Inactive | HR         |
+---------------+----------+------------+
6 rows in set (0.00 sec)





WAQ: to give 5000 increment to the lowest paid IT employee.

mysql> update  employeeup set salary = salary+5000 where  department='IT' order by salary ASC LIMIT 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0




mysql> select  employee_name, department, salary from   employeeup;
+---------------+------------+-----------+
| employee_name | department | salary    |
+---------------+------------+-----------+
| Amit          | IT         |  90205.50 |
| Rahul         | IT         |  94334.30 |
| Priya         | IT         | 137054.40 |
| Neha          | Finance    | 111055.30 |
| Vikas         | hr         |  99186.12 |
| Sneha         | HR         |  78246.00 |
+---------------+------------+-----------+
6 rows in set (0.00 sec)





WAQ: to give 5000 increment to the highest paid IT employee.

UPDATE doesnt support OFFSET that way. For such questions, we generally use a subquery.


mysql> update  employeeup set salary = salary+5000 where  department='IT' order by salary DESC 1,1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1,1' at line 1


