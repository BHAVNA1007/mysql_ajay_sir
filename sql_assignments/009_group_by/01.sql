Assignment 1:

Employee Salary Analysis
Use the following employees table to solve the questions below.

NOTE:-use your friends names in the given table.
Table: employees
id name department job_role salary hire_date


mysql> create table Salary_Analysis(emp_id int primary key auto_increment, emp_name varchar(20), department varchar(20), job_role varchar(20), salary decimal(10,2), hire_date date);
Query OK, 0 rows affected (0.12 sec)

mysql> desc Salary_Analysis;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| emp_id     | int           | NO   | PRI | NULL    | auto_increment |
| emp_name   | varchar(20)   | YES  |     | NULL    |                |
| department | varchar(20)   | YES  |     | NULL    |                |
| job_role   | varchar(20)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
| hire_date  | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
6 rows in set (0.04 sec)


1 Alice HR       Manager       6000.00 2022-01-15
2 Bob HR Recruiter 4000.00 2023-03-20
3 Charlie IT Developer 5000.00 2022-07-25
4 David IT Developer 5500.00 2021-12-05
5 Eve IT Tester 4500.00 2023-06-10
6 Frank IT Tester 4800.00 2023-09-12
7 Grace Finance Analyst 5200.00 2021-11-18
8 Hank Finance Analyst 5300.00 2022-04-30
9 Ivy Finance Manager 7000.00 2023-08-14
10 Jack HR Recruiter 4200.00 2022-10-05


mysql> insert into Salary_Analysis(emp_name, department, job_role, salary, hire_date) values
    -> ('Alice', 'HR','Manager', 6000, '2022-01-15'),
    -> ('Bob', 'HR','Recruiter', 4000, '2023-03-20'),
    -> ('Charlie', 'IT', 'Developer', 5000, '2022-07-25'),
    -> ('David', 'IT', 'Developer', 5500, '2021-12-05'),
    -> ('Eve', 'IT', 'Tester', 4500, '2023-06-10'),
    -> ('Frank', 'IT', 'Tester', 4800, '2023-09-12'),
    -> ('Grace', 'Finance', 'Analyst', 5200, '2021-11-18'),
    -> ('Hank', 'Finance', 'Analyst', 5300, '2022-04-30'),
    -> ('Ivy', 'Finance', 'Manager', 7000, '2023-08-14'),
    -> ('Jack', 'HR', 'Recruiter', 4200, '2022-10-05');
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from Salary_Analysis;
+--------+----------+------------+-----------+---------+------------+
| emp_id | emp_name | department | job_role  | salary  | hire_date  |
+--------+----------+------------+-----------+---------+------------+
|      1 | Alice    | HR         | Manager   | 6000.00 | 2022-01-15 |
|      2 | Bob      | HR         | Recruiter | 4000.00 | 2023-03-20 |
|      3 | Charlie  | IT         | Developer | 5000.00 | 2022-07-25 |
|      4 | David    | IT         | Developer | 5500.00 | 2021-12-05 |
|      5 | Eve      | IT         | Tester    | 4500.00 | 2023-06-10 |
|      6 | Frank    | IT         | Tester    | 4800.00 | 2023-09-12 |
|      7 | Grace    | Finance    | Analyst   | 5200.00 | 2021-11-18 |
|      8 | Hank     | Finance    | Analyst   | 5300.00 | 2022-04-30 |
|      9 | Ivy      | Finance    | Manager   | 7000.00 | 2023-08-14 |
|     10 | Jack     | HR         | Recruiter | 4200.00 | 2022-10-05 |
+--------+----------+------------+-----------+---------+------------+
10 rows in set (0.00 sec)






Questions
=========


Find the total number of employees in each department.

mysql> select department, count(*) from Salary_Analysis group by department;
+------------+----------+
| department | count(*) |
+------------+----------+
| HR         |        3 |
| IT         |        4 |
| Finance    |        3 |
+------------+----------+
3 rows in set (0.01 sec)






Find the average salary of employees in each job role.

mysql> select job_role, avg(salary) as avg_salary from Salary_Analysis group by job_role;
+-----------+-------------+
| job_role  | avg_salary  |
+-----------+-------------+
| Manager   | 6500.000000 |
| Recruiter | 4100.000000 |
| Developer | 5250.000000 |
| Tester    | 4650.000000 |
| Analyst   | 5250.000000 |
+-----------+-------------+
5 rows in set (0.00 sec)





Find the highest salary in the IT department.

mysql> select department, max(salary) as high_salary_IT from Salary_Analysis where department = 'IT' group by department;
+------------+----------------+
| department | high_salary_IT |
+------------+----------------+
| IT         |        5500.00 |
+------------+----------------+
1 row in set (0.00 sec)






Find the lowest salary among all employees.

mysql> select min(salary) from Salary_Analysis;
+-------------+
| min(salary) |
+-------------+
|     4000.00 |
+-------------+
1 row in set (0.00 sec)






Count the number of employees who joined after January 1, 2023.

mysql> SELECT COUNT(*) AS employee_count
    -> FROM Salary_Analysis
    -> WHERE hire_date > '2023-01-01';
+----------------+
| employee_count |
+----------------+
|              4 |
+----------------+
1 row in set (0.00 sec)







Find the total salary paid in each department.

mysql> select department, sum(salary) as total from Salary_Analysis group by department;
+------------+----------+
| department | total    |
+------------+----------+
| HR         | 14200.00 |
| IT         | 19800.00 |
| Finance    | 17500.00 |
+------------+----------+
3 rows in set (0.00 sec)







Find the job role that has the highest total salary payout.


mysql> SELECT job_role, SUM(salary) AS total_salary
    -> FROM Salary_Analysis
    -> GROUP BY job_role
    -> ORDER BY total_salary DESC
    -> LIMIT 1;
+----------+--------------+
| job_role | total_salary |
+----------+--------------+
| Manager  |     13000.00 |
+----------+--------------+
1 row in set (0.00 sec)





Find the average salary of employees who joined after 2022.

mysql> select avg(salary) from Salary_Analysis where year(hire_date) > 2022;

+-------------+
| avg(salary) |
+-------------+
| 5075.000000 |
+-------------+
1 row in set (0.00 sec)







Find departments where the total salary exceeds 10,000.



mysql> select department, sum(salary) as total from Salary_Analysis where sum(salary) > 10000 group by department;
ERROR 1111 (HY000): Invalid use of group function



FROM
 ↓
WHERE          → filter rows
 ↓
GROUP BY       → create groups
 ↓
SUM()          → calculate group totals
 ↓
HAVING         → filter groups



mysql> select department, sum(salary) as total from Salary_Analysis group by department  having total > 10000;
+------------+----------+
| department | total    |
+------------+----------+
| HR         | 14200.00 |
| IT         | 19800.00 |
| Finance    | 17500.00 |
+------------+----------+
3 rows in set (0.00 sec)

Why HAVING?
Because SUM(salary) is an aggregate value calculated for each department, so we use HAVING to filter the groups.







Find the department with the highest number of employees.

mysql> select department, count(*) as num_of_emp from Salary_Analysis group by department order by num_of_emp DESC limit 1;
+------------+------------+
| department | num_of_emp |
+------------+------------+
| IT         |          4 |
+------------+------------+
1 row in set (0.00 sec)
