Assignment 1:

Understanding INNER JOIN
Problem Statement:

Consider the following tables:
Employees
emp_id emp_name dept_id
1 Alice 101
2 Bob 102
3 Charlie 103
4 David 101
Departments
dept_id  dept_name
101      HR
102     IT
104     Finance

Tasks:

Write a query to display employees and their corresponding department names using INNER JOIN.
Modify the query to display only employees who belong to the "HR" department.




mysql> create table Departments(dept_id int primary key, dept_name varchar(30));

--Query OK, 0 rows affected (0.08 sec)



mysql> insert into Departments values(101, 'HR'), (102, 'IT'), (104, 'Finance');

--Query OK, 3 rows affected (0.02 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> select * from Departments;

--+---------+-----------+
--| dept_id | dept_name |
--+---------+-----------+
--|     101 | HR        |
--|     102 | IT        |
--|     104 | Finance   |
--+---------+-----------+
--3 rows in set (0.00 sec)




mysql> create table Employees (emp_id int primary key, emp_name varchar(30), dept_id int);

--Query OK, 0 rows affected (0.04 sec)



mysql> insert into Employees values (1, 'Alice', 101), (2, 'Bob', 102), (3, 'Charlie', 103), (4, 'David', 101);

--Query OK, 4 rows affected (0.01 sec)
--Records: 4  Duplicates: 0  Warnings: 0



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




Write a query to display employees and their corresponding department names using INNER JOIN.
Modify the query to display only employees who belong to the "HR" department.


mysql> select * from employees as e join departments as d on e.dept_id = d.dept_id;

--+--------+----------+---------+---------+-----------+
--| emp_id | emp_name | dept_id | dept_id | dept_name |
--+--------+----------+---------+---------+-----------+
--|      1 | Alice    |     101 |     101 | HR        |
--|      2 | Bob      |     102 |     102 | IT        |
--|      4 | David    |     101 |     101 | HR        |
--+--------+----------+---------+---------+-----------+
--3 rows in set (0.01 sec)



mysql> select * from employees as e join departments as d on e.dept_id = d.dept_id where dept_name = 'HR';

--+--------+----------+---------+---------+-----------+
--| emp_id | emp_name | dept_id | dept_id | dept_name |
--+--------+----------+---------+---------+-----------+
--|      1 | Alice    |     101 |     101 | HR        |
--|      4 | David    |     101 |     101 | HR        |
--+--------+----------+---------+---------+-----------+
--2 rows in set (0.01 sec)


