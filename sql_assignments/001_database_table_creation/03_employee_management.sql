ASSIGNMENT 2 – EMPLOYEE MANAGEMENT SYSTEM

Q1. Create a database named company_db and use the database.

Q2. Create a table named employee with:
- employee_id – INT, PRIMARY KEY, AUTO_INCREMENT
- employee_name – VARCHAR(50)
- age – INT
- department – VARCHAR(50)
- designation – VARCHAR(50)
- salary – INT

Q3. Insert the following 10 employee records:

employee_name | age | department | designation | salary
Rahul Sharma | 28 | IT | Developer | 55000
Priya Verma | 26 | HR | Executive | 42000
Amit Singh | 30 | IT | Team Lead | 75000
Neha Patel | 27 | Finance | Accountant | 48000
Rohit Mehta | 32 | IT | Manager | 90000
Sneha Jain | 25 | Marketing | Executive | 40000
Karan Gupta | 29 | IT | Developer | 60000
Pooja Mishra | 31 | HR | Manager | 80000
Ankit Tiwari | 28 | Finance | Analyst | 65000
Riya Kapoor | 27 | Marketing | Manager | 70000

Q4. Display the structure of the employee table using DESC.

Q5. Display all records from the employee table.


-------------------------------------------------------------------

mysql>  Create database company_db;
Query OK, 1 row affected (0.01 sec)


mysql> use company_db;
Database changed


mysql> create table employee(employee_id INT AUTO_INCREMENT PRIMARY KEY,employee_name VARCHAR(50), age INT, department VARCHAR(50), designation VARCHAR(50), salary INT);
Query OK, 0 rows affected (0.06 sec)



mysql> desc employee;

+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| employee_id   | int         | NO   | PRI | NULL    | auto_increment |
| employee_name | varchar(50) | YES  |     | NULL    |                |
| age           | int         | YES  |     | NULL    |                |
| department    | varchar(50) | YES  |     | NULL    |                |
| designation   | varchar(50) | YES  |     | NULL    |                |
| salary        | int         | YES  |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)



mysql> insert into employee(employee_name, age, department, designation, salary) values('Rahul Sharma', 28, 'IT', 'Developer', 55000),('Priya Verma', 26, 'HR', 'Executive', 42000),('Amit Singh', 30, 'IT', 'Team Lead', 75000),('Neha Patel', 27, 'Finance', 'Accountant', 48000),('Rohit Mehta', 32, 'IT', 'Manager', 90000),('Sneha Jain', 25, 'Marketing', 'Executive', 40000),('Karan Gupta', 29, 'IT', 'Developer', 60000),('Pooja Mishra', 31, 'HR', 'Manager', 80000),('Ankit Tiwari', 28, 'Finance', 'Analyst', 65000),('Riya Kapoor', 27, 'Marketing', 'Manager', 70000);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0



mysql> select * from employee;

+-------------+---------------+------+------------+-------------+--------+
| employee_id | employee_name | age  | department | designation | salary |
+-------------+---------------+------+------------+-------------+--------+
|           1 | Rahul Sharma  |   28 | IT         | Developer   |  55000 |
|           2 | Priya Verma   |   26 | HR         | Executive   |  42000 |
|           3 | Amit Singh    |   30 | IT         | Team Lead   |  75000 |
|           4 | Neha Patel    |   27 | Finance    | Accountant  |  48000 |
|           5 | Rohit Mehta   |   32 | IT         | Manager     |  90000 |
|           6 | Sneha Jain    |   25 | Marketing  | Executive   |  40000 |
|           7 | Karan Gupta   |   29 | IT         | Developer   |  60000 |
|           8 | Pooja Mishra  |   31 | HR         | Manager     |  80000 |
|           9 | Ankit Tiwari  |   28 | Finance    | Analyst     |  65000 |
|          10 | Riya Kapoor   |   27 | Marketing  | Manager     |  70000 |
+-------------+---------------+------+------------+-------------+--------+
10 rows in set (0.00 sec)


-----------------------------------------------------------------------------
