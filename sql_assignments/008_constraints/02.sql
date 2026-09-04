
EMPLOYEE PAYROLL AND JOB MANAGEMENT SYSTEM

A company wants to maintain employee information in MySQL. You have been asked to design an employee table that strictly enforces the companys data rules using NOT NULL, UNIQUE and CHECK constraints.

1. CREATE THE EMPLOYEE TABLE

Create a table named employee with the following columns.

emp_id
INT
Employee ID, Primary Key, Auto Increment

emp_name
VARCHAR(50)
Mandatory

email
VARCHAR(100)
Mandatory and must be unique

phone
VARCHAR(15)
Mandatory and must be unique

department
VARCHAR(30)
Mandatory

designation
VARCHAR(30)
Mandatory

age
INT
Mandatory, employee must be between 21 and 60

salary
DECIMAL(10,2)
Mandatory, salary must be greater than 15000

experience
INT
Mandatory, experience must be between 0 and 35 years

joining_year
INT
Mandatory

status
VARCHAR(20)
Mandatory, only Active, Inactive or On Leave

bonus
DECIMAL(10,2)
Mandatory, cannot be negative



2. APPLY THE CONSTRAINTS

NOT NULL CONSTRAINTS

The following columns cannot contain NULL.

emp_name
email
phone
department
designation
age
salary
experience
joining_year
status
bonus


UNIQUE CONSTRAINTS

The following values must be unique across employees.

email
phone

Two employees cannot have the same email or phone number.



mysql> CREATE TABLE employee_s (
    ->     emp_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     emp_name VARCHAR(50) NOT NULL,
    ->     email VARCHAR(100) NOT NULL UNIQUE,
    ->     phone VARCHAR(15) NOT NULL UNIQUE,
    ->     department VARCHAR(30) NOT NULL,
    ->     designation VARCHAR(30) NOT NULL,
    ->     age INT NOT NULL CHECK(age BETWEEN 21 AND 60),
    ->     salary DECIMAL(10,2) NOT NULL CHECK(salary > 15000),
    ->     experience INT NOT NULL CHECK(experience BETWEEN 0 AND 35),
    ->     joining_year INT NOT NULL,
    ->     status VARCHAR(20) NOT NULL
    ->         CHECK(status IN ('Active', 'Inactive', 'On Leave')),
    ->     bonus DECIMAL(10,2) NOT NULL CHECK(bonus >= 0)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> desc employee_s;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| emp_id       | int           | NO   | PRI | NULL    | auto_increment |
| emp_name     | varchar(50)   | NO   |     | NULL    |                |
| email        | varchar(100)  | NO   | UNI | NULL    |                |
| phone        | varchar(15)   | NO   | UNI | NULL    |                |
| department   | varchar(30)   | NO   |     | NULL    |                |
| designation  | varchar(30)   | NO   |     | NULL    |                |
| age          | int           | NO   |     | NULL    |                |
| salary       | decimal(10,2) | NO   |     | NULL    |                |
| experience   | int           | NO   |     | NULL    |                |
| joining_year | int           | NO   |     | NULL    |                |
| status       | varchar(20)   | NO   |     | NULL    |                |
| bonus        | decimal(10,2) | NO   |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)





CHECK CONSTRAINTS ON INDIVIDUAL COLUMNS

1. Age must be between 21 and 60.

2. Salary must be greater than 15000.

3. Experience must be between 0 and 35 years.

4. Bonus must be greater than or equal to 0.

5. Status can only be Active, Inactive or On Leave.


3. COMBINATION CHECK CONSTRAINTS

Rule 1: Experience and Age

An employee cannot have more experience than realistically possible based on age.

Create a CHECK constraint such that:

experience must be less than or equal to age minus 21.

Example:

Age 25 and Experience 4 is valid.

Age 25 and Experience 10 is invalid.


Rule 2: Salary and Experience

Employees with more experience must have an appropriate minimum salary.

If experience is greater than or equal to 10, salary must be greater than or equal to 50000.

Example:

Experience 12 and Salary 60000 is valid.

Experience 12 and Salary 35000 is invalid.


Rule 3: Department and Designation

The company allows only certain designation combinations.

IT
Developer
Tester
Team Lead

HR
HR Executive
HR Manager

Finance
Accountant
Finance Manager

Sales
Sales Executive
Sales Manager

Examples:

IT and Developer is valid.

IT and HR Manager is invalid.

HR and Developer is invalid.

Finance and Accountant is valid.

Implement this using a CHECK constraint involving both department and designation.


Rule 4: Status and Bonus

Business rules:

Active employees can receive bonus.

Inactive employees must have bonus equal to 0.

On Leave employees can have a bonus, but it cannot exceed 20 percent of salary.

Examples:

Active with salary 50000 and bonus 10000 is valid.

Inactive with salary 50000 and bonus 5000 is invalid.

Inactive with salary 50000 and bonus 0 is valid.

On Leave with salary 50000 and bonus 10000 is valid.

On Leave with salary 50000 and bonus 15000 is invalid.


Rule 5: Joining Year and Experience

Assume the current year is 2026.

The employees experience cannot be greater than the number of years since joining.

Example:

Joining year 2020 and Experience 6 is valid.

Joining year 2020 and Experience 10 is invalid.

Joining year cannot be greater than 2026.


4. INSERT VALID RECORDS

Insert at least 10 valid employees satisfying all constraints simultaneously.

Your records should cover:

Multiple departments
Multiple designations
Different experience levels
Different salary ranges
All three statuses
Different bonus values


5. CONSTRAINT TESTING

After inserting valid records, deliberately execute at least 12 invalid INSERT statements.

NOT NULL TESTING

Try inserting NULL into emp_name.

Try inserting NULL into email.

Try inserting NULL into salary.


UNIQUE TESTING

Try inserting a duplicate email.

Try inserting a duplicate phone number.


INDIVIDUAL CHECK TESTING

Try age equal to 18.

Try salary equal to 10000.

Try experience equal to -2.

Try bonus equal to -500.

Try status equal to Retired.


COMBINATION CHECK TESTING

Test age 25 and experience 10.

Test experience 12 and salary 35000.

Test department IT and designation HR Manager.

Test status Inactive and bonus 5000.

Test status On Leave, salary 50000 and bonus 15000.

Test joining year 2020 and experience 10.

Test joining year 2027.





***********************************************************

mysql> CREATE TABLE employee_s (
    ->     emp_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     emp_name VARCHAR(50) NOT NULL,
    ->     email VARCHAR(100) NOT NULL UNIQUE,
    ->     phone VARCHAR(15) NOT NULL UNIQUE,
    ->     department VARCHAR(30) NOT NULL,
    ->     designation VARCHAR(30) NOT NULL,
    ->     age INT NOT NULL CHECK(age BETWEEN 21 AND 60),
    ->     salary DECIMAL(10,2) NOT NULL CHECK(salary > 15000),
    ->     experience INT NOT NULL CHECK(experience BETWEEN 0 AND 35),
    ->     joining_year INT NOT NULL,
    ->     status VARCHAR(20) NOT NULL
    ->         CHECK(status IN ('Active', 'Inactive', 'On Leave')),
    ->     bonus DECIMAL(10,2) NOT NULL CHECK(bonus >= 0),
    ->
    ->     CONSTRAINT chk_exp_age
    ->         CHECK (experience <= age - 21),
    ->
    ->     CONSTRAINT chk_salary_exp
    ->         CHECK (experience < 10 OR salary >= 50000),
    ->
    ->     CONSTRAINT chk_dept_designation
    ->         CHECK (
    ->             (department = 'IT' AND designation IN ('Developer', 'Tester', 'Team Lead'))
    ->             OR
    ->             (department = 'HR' AND designation IN ('HR Executive', 'HR Manager'))
    ->             OR
    ->             (department = 'Finance' AND designation IN ('Accountant', 'Finance Manager'))
    ->             OR
    ->             (department = 'Sales' AND designation IN ('Sales Executive', 'Sales Manager'))
    ->         ),
    ->
    ->     CONSTRAINT chk_status_bonus
    ->         CHECK (
    ->             status = 'Active'
    ->             OR (status = 'Inactive' AND bonus = 0)
    ->             OR (status = 'On Leave' AND bonus <= salary * 0.20)
    ->         ),
    ->
    ->     CONSTRAINT chk_joining_exp
    ->         CHECK (
    ->             joining_year <= 2026
    ->             AND experience <= 2026 - joining_year
    ->         )
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> select * from employee_s;
Empty set (0.01 sec)

mysql> desc employee_s;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| emp_id       | int           | NO   | PRI | NULL    | auto_increment |
| emp_name     | varchar(50)   | NO   |     | NULL    |                |
| email        | varchar(100)  | NO   | UNI | NULL    |                |
| phone        | varchar(15)   | NO   | UNI | NULL    |                |
| department   | varchar(30)   | NO   |     | NULL    |                |
| designation  | varchar(30)   | NO   |     | NULL    |                |
| age          | int           | NO   |     | NULL    |                |
| salary       | decimal(10,2) | NO   |     | NULL    |                |
| experience   | int           | NO   |     | NULL    |                |
| joining_year | int           | NO   |     | NULL    |                |
| status       | varchar(20)   | NO   |     | NULL    |                |
| bonus        | decimal(10,2) | NO   |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)




mysql> INSERT INTO employee_s
    -> (emp_name, email, phone, department, designation, age, salary, experience, joining_year, status, bonus)
    -> VALUES
    -> ('Amit Sharma', 'amit@gmail.com', '9876500001', 'IT', 'Developer',
    ->  25, 40000, 4, 2022, 'Active', 5000),
    ->
    -> ('Priya Verma', 'priya@gmail.com', '9876500002', 'IT', 'Tester',
    ->  30, 55000, 8, 2018, 'Active', 8000),
    ->
    -> ('Rahul Singh', 'rahul@gmail.com', '9876500003', 'IT', 'Team Lead',
    ->  40, 85000, 15, 2011, 'Active', 15000),
    ->
    -> ('Neha Patel', 'neha@gmail.com', '9876500004', 'HR', 'HR Executive',
    ->  28, 35000, 5, 2021, 'Active', 3000),
    ->
    -> ('Vikas Gupta', 'vikas@gmail.com', '9876500005', 'HR', 'HR Manager',
    ->  38, 70000, 12, 2014, 'Inactive', 0),
    ->
    -> ('Sneha Jain', 'sneha@gmail.com', '9876500006', 'Finance', 'Accountant',
    ->  27, 42000, 6, 2020, 'On Leave', 8000),
    ->
    -> ('Rohit Mehta', 'rohit@gmail.com', '9876500007', 'Finance', 'Finance Manager',
    ->  45, 90000, 20, 2006, 'Active', 18000),
    ->
    -> ('Kavita Rao', 'kavita@gmail.com', '9876500008', 'Sales', 'Sales Executive',
    ->  24, 30000, 3, 2023, 'Active', 2000),
    ->
    -> ('Arjun Joshi', 'arjun@gmail.com', '9876500009', 'Sales', 'Sales Manager',
    ->  35, 65000, 10, 2016, 'On Leave', 12000),
    ->
    -> ('Pooja Yadav', 'pooja@gmail.com', '9876500010', 'IT', 'Developer',
    ->  22, 28000, 1, 2025, 'Inactive', 0);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from employee_s;
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
| emp_id | emp_name    | email            | phone      | department | designation     | age | salary   | experience | joining_year | status   | bonus    |
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
|      1 | Amit Sharma | amit@gmail.com   | 9876500001 | IT         | Developer       |  25 | 40000.00 |          4 |         2022 | Active   |  5000.00 |
|      2 | Priya Verma | priya@gmail.com  | 9876500002 | IT         | Tester          |  30 | 55000.00 |          8 |         2018 | Active   |  8000.00 |
|      3 | Rahul Singh | rahul@gmail.com  | 9876500003 | IT         | Team Lead       |  40 | 85000.00 |         15 |         2011 | Active   | 15000.00 |
|      4 | Neha Patel  | neha@gmail.com   | 9876500004 | HR         | HR Executive    |  28 | 35000.00 |          5 |         2021 | Active   |  3000.00 |
|      5 | Vikas Gupta | vikas@gmail.com  | 9876500005 | HR         | HR Manager      |  38 | 70000.00 |         12 |         2014 | Inactive |     0.00 |
|      6 | Sneha Jain  | sneha@gmail.com  | 9876500006 | Finance    | Accountant      |  27 | 42000.00 |          6 |         2020 | On Leave |  8000.00 |
|      7 | Rohit Mehta | rohit@gmail.com  | 9876500007 | Finance    | Finance Manager |  45 | 90000.00 |         20 |         2006 | Active   | 18000.00 |
|      8 | Kavita Rao  | kavita@gmail.com | 9876500008 | Sales      | Sales Executive |  24 | 30000.00 |          3 |         2023 | Active   |  2000.00 |
|      9 | Arjun Joshi | arjun@gmail.com  | 9876500009 | Sales      | Sales Manager   |  35 | 65000.00 |         10 |         2016 | On Leave | 12000.00 |
|     10 | Pooja Yadav | pooja@gmail.com  | 9876500010 | IT         | Developer       |  22 | 28000.00 |          1 |         2025 | Inactive |     0.00 |
+--------+-------------+------------------+------------+------------+-----------------+-----+----------+------------+--------------+----------+----------+
10 rows in set (0.00 sec)
