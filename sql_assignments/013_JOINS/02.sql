Assignment 3: RIGHT JOIN Practice
Problem Statement:
Consider the same tables.




Tasks:


Write a query using RIGHT JOIN to display all departments and their employees, including departments with no employees.
Find the names of departments that have no employees assigned.


mysql> select * from employees;

--+--------+----------+---------+
--| emp_id | emp_name | dept_id |
--+--------+----------+---------+
--|      1 | Alice    |     101 |
--|      2 | Bob      |     102 |
--|      3 | Charlie  |     103 |
--|      4 | David    |     101 |
--+--------+----------+---------+
--4 rows in set (0.00 sec)



mysql> select * from departments;

--+---------+-----------+
--| dept_id | dept_name |
--+---------+-----------+
--|     101 | HR        |
--|     102 | IT        |
--|     104 | Finance   |
--+---------+-----------+
--3 rows in set (0.00 sec)


Write a query using RIGHT JOIN to display all departments and their employees, including departments with no employees.


mysql> select d.dept_name, e.emp_name from employees as e RIGHT JOIN departments as d ON e.dept_id = d.dept_id;

--+-----------+----------+
--| dept_name | emp_name |
--+-----------+----------+
--| HR        | David    |
--| HR        | Alice    |
--| IT        | Bob      |
--| Finance   | NULL     |
--+-----------+----------+
--4 rows in set (0.00 sec)



Find the names of departments that have no employees assigned.

mysql> select d.dept_name, e.emp_name from employees as e RIGHT JOIN departments as d ON e.dept_id = d.dept_id where emp_name is NULL;

--+-----------+----------+
--| dept_name | emp_name |
--+-----------+----------+
--| Finance   | NULL     |
--+-----------+----------+
--1 row in set (0.00 sec)




******************************************************************

Assignment 4: FULL OUTER JOIN Simulation

Problem Statement:

Since MySQL does not support FULL OUTER JOIN directly, 



use a combination of LEFT JOIN and RIGHT JOIN to display all employees and departments, ensuring that unmatched records are also included.



mysql> select * from employees as e LEFT JOIN departments  as d ON e.dept_id = d.dept_id
    -> UNION
    -> select * from employees as e RIGHT JOIN departments  as d ON e.dept_id = d.dept_id;


--+--------+----------+---------+---------+-----------+
--| emp_id | emp_name | dept_id | dept_id | dept_name |
--+--------+----------+---------+---------+-----------+
--|      1 | Alice    |     101 |     101 | HR        |
--|      2 | Bob      |     102 |     102 | IT        |
--|      3 | Charlie  |     103 |    NULL | NULL      |
--|      4 | David    |     101 |     101 | HR        |
--|   NULL | NULL     |    NULL |     104 | Finance   |
--+--------+----------+---------+---------+-----------+
--5 rows in set (0.03 sec)


