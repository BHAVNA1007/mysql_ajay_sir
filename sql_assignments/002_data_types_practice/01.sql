Assignment 1 — Employee Management System
Objective

Create an Employee Management System database and design tables that cover the MySQL data types taught so far.

Use all the following data types at least once.

TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT, DECIMAL, FLOAT, DOUBLE, CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT, ENUM,
SET, DATE, TIME, DATETIME, TIMESTAMP, YEAR, BOOLEAN

Also use:

PRIMARY KEY
AUTO_INCREMENT
UNSIGNED
DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP


Part 1 — Create Database

Create a database named:

employee_management

Select the database.

Part 2 — Create employees Table

Create a table named:

employees

Use the following columns:

# Column Name Requirement
1 employee_id Employee unique ID; PRIMARY KEY + AUTO_INCREMENT
2 employee_code Fixed-length employee code
3 employee_name Employee full name
4 age Employee age; should not allow negative values
5 number_of_children Number of children
6 experience_months Total experience in months
7 salary Employee annual salary with exact decimal precision
8 performance_score Employee performance score with approximate decimal value
9 productivity_score Higher-precision approximate decimal value
10 department_id Department identification number
11 employee_status Employment status from predefined values
12 skills Employee can have multiple skills from predefined values
13 gender Employee gender from predefined values
14 date_of_birth Employee date of birth
15 joining_date Date employee joined company
16 login_time Daily office login time
17 interview_datetime Date and time of employee interview
18 birth_year Employee birth year
19 is_active Whether employee is currently active
20 short_note Very small text information
21 employee_description Employee description
22 training_history Larger training-related text
23 employee_profile Very large employee information
24 created_at Automatically store record creation date/time
25 updated_at Automatically update when record is modified

Important

You have to decide the appropriate data type for every column.

Do not blindly use VARCHAR everywhere.

For example:

"Employee can have multiple skills from a predefined list."

You should decide which MySQL datatype is appropriate.

Part 3 — Insert Data

Insert at least 15 employees.

Your data must satisfy the following requirements:

Employee ID

Do not manually provide employee_id.

Let AUTO_INCREMENT generate it.

Employee Code

Use fixed-length codes such as:

EMP001
EMP002
EMP003
Age

Use different realistic ages.

Include employees between approximately 22–55 years.

Numeric Data

Use different values for:

Number of children
Experience in months
Salary
Performance score
Productivity score

Include decimal salary values such as:

52500.50
78500.75
125000.25
Employee Status

Use all predefined statuses that you decide while creating the ENUM.

For example:

ACTIVE
INACTIVE
ON_LEAVE
RESIGNED
Skills

Use multiple combinations.

For example:

JAVA
PYTHON,MYSQL
JAVA,MYSQL
PYTHON,REACT,AWS
JAVA,PYTHON,MYSQL
Gender

Use all values defined in your ENUM.

Dates

Use different:

Birth dates
Joining dates
Time

Use different employee login times.

Date + Time

Insert different interview date/time values.

Year

Use different birth years.

Boolean

Insert both:

TRUE
FALSE
Text

Provide different values for:

Short note
Employee description
Training history
Employee profile
Part 4 — TIMESTAMP Requirement

For created_at:

The employee creation date and time should automatically be captured by MySQL.

For updated_at:

The employee modification date and time should automatically change whenever the employee record is updated.

Then:

Insert an employee.
Check created_at and updated_at.
Update the employees name.
Check both timestamps again.
Verify that created_at remains unchanged.
Verify that updated_at changes.

This follows the timestamp behavior covered in your notes.

Part 5 — DDL Operations

After creating and inserting data into employees, perform the following operations.

ALTER TABLE
Add a column:
phone_number
Add a column:
email
Modify the size of employee_name.
Modify the size of employee_code.
Rename short_note to:
employee_note
Drop the email column.
Drop the phone_number column.
AUTO_INCREMENT using ALTER

*************************************************************************************************************






mysql> create database employee_management;
Query OK, 1 row affected (0.01 sec)

mysql> use employee_management;
Database changed
mysql> create table employees(employee_id int auto_increment primary key, employee_code char(6), employee_name varchar(50), age tinyint unsigned, number_of_children smallint unsigned, experience_months smallint unsigned, salary decimal(10,2), performance_score float, productivity_score double, department_id char(5), employee_status enum('ACTIVE', 'INACTIVE', 'ON_LEAVE', 'RESIGNED'), Skills set('JAVA','PYTHON','MYSQL','REACT','AWS'), gender enum('male','female'), date_of_birth date, joining_date date, login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, interview_datetime datetime, birth_year year, is_active boolean, short_note tinytext, employee_description text, training_history mediumtext, employee_profile longtext, created_at timestamp default current_timestamp, update_at timestamp default current_timestamp on update current_timestamp);
Query OK, 0 rows affected (0.05 sec)


mysql> desc employees;
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field                | Type                                            | Null | Key | Default           | Extra                                         |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| employee_id          | int                                             | NO   | PRI | NULL              | auto_increment                                |
| employee_code        | char(6)                                         | YES  |     | NULL              |                                               |
| employee_name        | varchar(50)                                     | YES  |     | NULL              |                                               |
| age                  | tinyint unsigned                                | YES  |     | NULL              |                                               |
| number_of_children   | smallint unsigned                               | YES  |     | NULL              |                                               |
| experience_months    | smallint unsigned                               | YES  |     | NULL              |                                               |
| salary               | decimal(10,2)                                   | YES  |     | NULL              |                                               |
| performance_score    | float                                           | YES  |     | NULL              |                                               |
| productivity_score   | double                                          | YES  |     | NULL              |                                               |
| department_id        | char(5)                                         | YES  |     | NULL              |                                               |
| employee_status      | enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') | YES  |     | NULL              |                                               |
| Skills               | set('JAVA','PYTHON','MYSQL','REACT','AWS')      | YES  |     | NULL              |                                               |
| gender               | enum('male','female')                           | YES  |     | NULL              |                                               |
| date_of_birth        | date                                            | YES  |     | NULL              |                                               |
| joining_date         | date                                            | YES  |     | NULL              |                                               |
| login_time           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| interview_datetime   | datetime                                        | YES  |     | NULL              |                                               |
| birth_year           | year                                            | YES  |     | NULL              |                                               |
| is_active            | tinyint(1)                                      | YES  |     | NULL              |                                               |
| short_note           | tinytext                                        | YES  |     | NULL              |                                               |
| employee_description | text                                            | YES  |     | NULL              |                                               |
| training_history     | mediumtext                                      | YES  |     | NULL              |                                               |
| employee_profile     | longtext                                        | YES  |     | NULL              |                                               |
| created_at           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| update_at            | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
25 rows in set (0.01 sec)


insert into employees( employee_code,  employee_name,  age, number_of_children, experience_months, salary, performance_score, productivity_score, department_id,  employee_status,  Skills, gender, date_of_birth, joining_date, interview_datetime, birth_year, is_active, short_note,  employee_description, training_history, employee_profile) values('EMP001', 'KIYA DESHMUKH', 25, 2, 24, 40000, 87.88, 90.11, 'DP01', 'ACTIVE', 'PYTHON,MYSQL,REACT', 'Female', '2001-09-18', '2020-08-18', '2026-08-25 10:25:00', 2001, TRUE, 'developer lead', 'A dedicated employee with good communication skills and a positive attitude', 'Completed training in workplace communication, teamwork, time management, technical skills, and company policies','An experienced and dedicated employee with strong technical and communication skills. Has several years of experience working in a professional environment and is capable of handling multiple responsibilities efficiently.');
Query OK, 1 row affected (0.01 sec)



mysql> select * from employees;
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+----------------+-----------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
| employee_id | employee_code | employee_name | age  | number_of_children | experience_months | salary   | performance_score | productivity_score | department_id | employee_status | Skills             | gender | date_of_birth | joining_date | login_time          | interview_datetime  | birth_year | is_active | short_note     | employee_description                                                        | training_history                                                                                                 | employee_profile                                                                                                                                                                                                              | created_at          | update_at           |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+----------------+-----------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
|           1 | EMP001        | KIYA DESHMUKH |   25 |                  2 |                24 | 40000.00 |             87.88 |              90.11 | DP01          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2001-09-18    | 2020-08-18   | 2026-08-18 23:25:36 | 2026-08-25 10:25:00 |       2001 |         1 | developer lead | A dedicated employee with good communication skills and a positive attitude | Completed training in workplace communication, teamwork, time management, technical skills, and company policies | An experienced and dedicated employee with strong technical and communication skills. Has several years of experience working in a professional environment and is capable of handling multiple responsibilities efficiently. | 2026-08-18 23:25:36 | 2026-08-18 23:25:36 |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+----------------+-----------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
1 row in set (0.00 sec)

INSERT INTO employees(employee_code, employee_name, age,number_of_children,experience_months, salary, performance_score,productivity_score, department_id, employee_status,Skills, gender, date_of_birth, joining_date,interview_datetime, birth_year, is_active,short_note, employee_description, training_history,employee_profile) values('EMP002','KIRTI SHINDHE',28,1,48,55000,91.25,88.75,'DP02','ACTIVE','JAVA,MYSQL','Male','1998-04-12','2022-06-15','2026-08-25 11:30:00', 1998,TRUE,'senior developer','A hardworking employee with strong programming skills and excellent problem-solving abilities','Completed training in Java, database management, communication skills, teamwork, and leadership','A skilled software developer with several years of professional experience and strong technical knowledge.');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM employees;
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+------------------+-----------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
| employee_id | employee_code | employee_name | age  | number_of_children | experience_months | salary   | performance_score | productivity_score | department_id | employee_status | Skills             | gender | date_of_birth | joining_date | login_time          | interview_datetime  | birth_year | is_active | short_note       | employee_description                                                                          | training_history                                                                                                 | employee_profile                                                                                                                                                                                                              | created_at          | update_at           |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+------------------+-----------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
|           1 | EMP001        | KIYA DESHMUKH |   25 |                  2 |                24 | 40000.00 |             87.88 |              90.11 | DP01          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2001-09-18    | 2020-08-18   | 2026-08-18 23:25:36 | 2026-08-25 10:25:00 |       2001 |         1 | developer lead   | A dedicated employee with good communication skills and a positive attitude                   | Completed training in workplace communication, teamwork, time management, technical skills, and company policies | An experienced and dedicated employee with strong technical and communication skills. Has several years of experience working in a professional environment and is capable of handling multiple responsibilities efficiently. | 2026-08-18 23:25:36 | 2026-08-18 23:25:36 |
|           2 | EMP002        | KIRTI SHINDHE |   28 |                  1 |                48 | 55000.00 |             91.25 |              88.75 | DP02          | ACTIVE          | JAVA,MYSQL         | male   | 1998-04-12    | 2022-06-15   | 2026-08-18 23:44:30 | 2026-08-25 11:30:00 |       1998 |         1 | senior developer | A hardworking employee with strong programming skills and excellent problem-solving abilities | Completed training in Java, database management, communication skills, teamwork, and leadership                  | A skilled software developer with several years of professional experience and strong technical knowledge.                                                                                                                    | 2026-08-18 23:44:30 | 2026-08-18 23:44:30 |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+------------------+-----------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
2 rows in set (0.00 sec)


mysql> INSERT INTO employees(
    -> employee_code, employee_name, age, number_of_children,
    -> experience_months, salary, performance_score,
    -> productivity_score, department_id, employee_status,
    -> Skills, gender, date_of_birth, joining_date,
    -> interview_datetime, birth_year, is_active,
    -> short_note, employee_description, training_history,
    -> employee_profile
    -> )
    -> VALUES
    -> (
    -> 'EMP003',
    -> 'PRIYA SHARMA',
    -> 26,
    -> 0,
    -> 36,
    -> 48000.00,
    -> 89.50,
    -> 92.30,
    -> 'DP03',
    -> 'ACTIVE',
    -> 'PYTHON,MYSQL,REACT',
    -> 'female',
    -> '2000-01-25',
    -> '2023-01-10',
    -> '2026-08-26 09:45:00',
    -> 2000,
    -> TRUE,
    -> 'python developer',
    -> 'A motivated employee with excellent analytical skills and a strong interest in backend development',
    -> 'Completed training in Python, Django, SQL, API development, teamwork, communication, and project management',
    -> 'A dedicated backend developer with strong knowledge of Python and database technologies. She is capable of developing reliable applications and working effectively with development teams.'
    -> ),
    ->
    -> (
    -> 'EMP004',
    -> 'ROHAN PATEL',
    -> 30,
    -> 2,
    -> 72,
    -> 68000.00,
    -> 94.20,
    -> 91.80,
    -> 'DP01',
    -> 'ACTIVE',
    -> 'JAVA,MYSQL,AWS',
    -> 'male',
    -> '1996-07-08',
    -> '2020-03-20',
    -> '2026-08-26 14:15:00',
    -> 1996,
    -> TRUE,
    -> 'technical developer',
    -> 'An experienced software developer with strong programming and problem-solving skills',
    -> 'Completed advanced training in Java, MySQL, AWS, software development, leadership, communication, and teamwork',
    -> 'An experienced technical professional with extensive knowledge of software development. He can handle complex projects, solve technical problems, and work efficiently with team members.'
    -> ),
    ->
    -> (
    -> 'EMP005',
    -> 'NEHA SINGH',
    -> 24,
    -> 0,
    -> 18,
    -> 36000.00,
    -> 84.60,
    -> 87.40,
    -> 'DP04',
    -> 'ACTIVE',
    -> 'PYTHON,REACT,MYSQL',
    -> 'female',
    -> '2002-11-19',
    -> '2025-02-05',
    -> '2026-08-27 10:00:00',
    -> 2002,
    -> TRUE,
    -> 'frontend trainee',
    -> 'A quick learner with good communication skills and a strong interest in frontend development',
    -> 'Completed training in Python, React, MySQL, responsive design, teamwork, communication, and workplace ethics',
    -> 'A motivated employee at the beginning of her professional career. She demonstrates enthusiasm for learning new technologies and contributes positively to team projects.'
    -> );
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select * from employees;
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
| employee_id | employee_code | employee_name | age  | number_of_children | experience_months | salary   | performance_score | productivity_score | department_id | employee_status | Skills             | gender | date_of_birth | joining_date | login_time          | interview_datetime  | birth_year | is_active | short_note          | employee_description                                                                               | training_history                                                                                                 | employee_profile                                                                                                                                                                                                              | created_at          | update_at           |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
|           1 | EMP001        | KIYA DESHMUKH |   25 |                  2 |                24 | 40000.00 |             87.88 |              90.11 | DP01          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2001-09-18    | 2020-08-18   | 2026-08-18 23:25:36 | 2026-08-25 10:25:00 |       2001 |         1 | developer lead      | A dedicated employee with good communication skills and a positive attitude                        | Completed training in workplace communication, teamwork, time management, technical skills, and company policies | An experienced and dedicated employee with strong technical and communication skills. Has several years of experience working in a professional environment and is capable of handling multiple responsibilities efficiently. | 2026-08-18 23:25:36 | 2026-08-18 23:25:36 |
|           2 | EMP002        | KIRTI SHINDHE |   28 |                  1 |                48 | 55000.00 |             91.25 |              88.75 | DP02          | ACTIVE          | JAVA,MYSQL         | male   | 1998-04-12    | 2022-06-15   | 2026-08-18 23:44:30 | 2026-08-25 11:30:00 |       1998 |         1 | senior developer    | A hardworking employee with strong programming skills and excellent problem-solving abilities      | Completed training in Java, database management, communication skills, teamwork, and leadership                  | A skilled software developer with several years of professional experience and strong technical knowledge.                                                                                                                    | 2026-08-18 23:44:30 | 2026-08-18 23:44:30 |
|           3 | EMP003        | PRIYA SHARMA  |   26 |                  0 |                36 | 48000.00 |              89.5 |               92.3 | DP03          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2000-01-25    | 2023-01-10   | 2026-08-18 23:53:03 | 2026-08-26 09:45:00 |       2000 |         1 | python developer    | A motivated employee with excellent analytical skills and a strong interest in backend development | Completed training in Python, Django, SQL, API development, teamwork, communication, and project management      | A dedicated backend developer with strong knowledge of Python and database technologies. She is capable of developing reliable applications and working effectively with development teams.                                   | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
|           4 | EMP004        | ROHAN PATEL   |   30 |                  2 |                72 | 68000.00 |              94.2 |               91.8 | DP01          | ACTIVE          | JAVA,MYSQL,AWS     | male   | 1996-07-08    | 2020-03-20   | 2026-08-18 23:53:03 | 2026-08-26 14:15:00 |       1996 |         1 | technical developer | An experienced software developer with strong programming and problem-solving skills               | Completed advanced training in Java, MySQL, AWS, software development, leadership, communication, and teamwork   | An experienced technical professional with extensive knowledge of software development. He can handle complex projects, solve technical problems, and work efficiently with team members.                                     | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
|           5 | EMP005        | NEHA SINGH    |   24 |                  0 |                18 | 36000.00 |              84.6 |               87.4 | DP04          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2002-11-19    | 2025-02-05   | 2026-08-18 23:53:03 | 2026-08-27 10:00:00 |       2002 |         1 | frontend trainee    | A quick learner with good communication skills and a strong interest in frontend development       | Completed training in Python, React, MySQL, responsive design, teamwork, communication, and workplace ethics     | A motivated employee at the beginning of her professional career. She demonstrates enthusiasm for learning new technologies and contributes positively to team projects.                                                      | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
+-------------+---------------+---------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> update employees set employee_name='SHAYLI WAGHMARE' where employee_id=2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employees;
+-------------+---------------+-----------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
| employee_id | employee_code | employee_name   | age  | number_of_children | experience_months | salary   | performance_score | productivity_score | department_id | employee_status | Skills             | gender | date_of_birth | joining_date | login_time          | interview_datetime  | birth_year | is_active | short_note          | employee_description                                                                               | training_history                                                                                                 | employee_profile                                                                                                                                                                                                              | created_at          | update_at           |
+-------------+---------------+-----------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
|           1 | EMP001        | KIYA DESHMUKH   |   25 |                  2 |                24 | 40000.00 |             87.88 |              90.11 | DP01          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2001-09-18    | 2020-08-18   | 2026-08-18 23:25:36 | 2026-08-25 10:25:00 |       2001 |         1 | developer lead      | A dedicated employee with good communication skills and a positive attitude                        | Completed training in workplace communication, teamwork, time management, technical skills, and company policies | An experienced and dedicated employee with strong technical and communication skills. Has several years of experience working in a professional environment and is capable of handling multiple responsibilities efficiently. | 2026-08-18 23:25:36 | 2026-08-18 23:25:36 |
|           2 | EMP002        | SHAYLI WAGHMARE |   28 |                  1 |                48 | 55000.00 |             91.25 |              88.75 | DP02          | ACTIVE          | JAVA,MYSQL         | male   | 1998-04-12    | 2022-06-15   | 2026-08-18 23:44:30 | 2026-08-25 11:30:00 |       1998 |         1 | senior developer    | A hardworking employee with strong programming skills and excellent problem-solving abilities      | Completed training in Java, database management, communication skills, teamwork, and leadership                  | A skilled software developer with several years of professional experience and strong technical knowledge.                                                                                                                    | 2026-08-18 23:44:30 | 2026-08-19 00:09:05 |
|           3 | EMP003        | PRIYA SHARMA    |   26 |                  0 |                36 | 48000.00 |              89.5 |               92.3 | DP03          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2000-01-25    | 2023-01-10   | 2026-08-18 23:53:03 | 2026-08-26 09:45:00 |       2000 |         1 | python developer    | A motivated employee with excellent analytical skills and a strong interest in backend development | Completed training in Python, Django, SQL, API development, teamwork, communication, and project management      | A dedicated backend developer with strong knowledge of Python and database technologies. She is capable of developing reliable applications and working effectively with development teams.                                   | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
|           4 | EMP004        | ROHAN PATEL     |   30 |                  2 |                72 | 68000.00 |              94.2 |               91.8 | DP01          | ACTIVE          | JAVA,MYSQL,AWS     | male   | 1996-07-08    | 2020-03-20   | 2026-08-18 23:53:03 | 2026-08-26 14:15:00 |       1996 |         1 | technical developer | An experienced software developer with strong programming and problem-solving skills               | Completed advanced training in Java, MySQL, AWS, software development, leadership, communication, and teamwork   | An experienced technical professional with extensive knowledge of software development. He can handle complex projects, solve technical problems, and work efficiently with team members.                                     | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
|           5 | EMP005        | NEHA SINGH      |   24 |                  0 |                18 | 36000.00 |              84.6 |               87.4 | DP04          | ACTIVE          | PYTHON,MYSQL,REACT | female | 2002-11-19    | 2025-02-05   | 2026-08-18 23:53:03 | 2026-08-27 10:00:00 |       2002 |         1 | frontend trainee    | A quick learner with good communication skills and a strong interest in frontend development       | Completed training in Python, React, MySQL, responsive design, teamwork, communication, and workplace ethics     | A motivated employee at the beginning of her professional career. She demonstrates enthusiasm for learning new technologies and contributes positively to team projects.                                                      | 2026-08-18 23:53:03 | 2026-08-18 23:53:03 |
+-------------+---------------+-----------------+------+--------------------+-------------------+----------+-------------------+--------------------+---------------+-----------------+--------------------+--------+---------------+--------------+---------------------+---------------------+------------+-----------+---------------------+----------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> alter table employees add column phone_number varchar(12), add column email varchar(30);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employees modify column employee_name varchar(60), modify column employee_code char(8);
Query OK, 5 rows affected (0.08 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> alter table employees rename column short_note to employee_note;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employees Drop column email;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employees;
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field                | Type                                            | Null | Key | Default           | Extra                                         |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| employee_id          | int                                             | NO   | PRI | NULL              | auto_increment                                |
| employee_code        | char(8)                                         | YES  |     | NULL              |                                               |
| employee_name        | varchar(60)                                     | YES  |     | NULL              |                                               |
| age                  | tinyint unsigned                                | YES  |     | NULL              |                                               |
| number_of_children   | smallint unsigned                               | YES  |     | NULL              |                                               |
| experience_months    | smallint unsigned                               | YES  |     | NULL              |                                               |
| salary               | decimal(10,2)                                   | YES  |     | NULL              |                                               |
| performance_score    | float                                           | YES  |     | NULL              |                                               |
| productivity_score   | double                                          | YES  |     | NULL              |                                               |
| department_id        | char(5)                                         | YES  |     | NULL              |                                               |
| employee_status      | enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') | YES  |     | NULL              |                                               |
| Skills               | set('JAVA','PYTHON','MYSQL','REACT','AWS')      | YES  |     | NULL              |                                               |
| gender               | enum('male','female')                           | YES  |     | NULL              |                                               |
| date_of_birth        | date                                            | YES  |     | NULL              |                                               |
| joining_date         | date                                            | YES  |     | NULL              |                                               |
| login_time           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| interview_datetime   | datetime                                        | YES  |     | NULL              |                                               |
| birth_year           | year                                            | YES  |     | NULL              |                                               |
| is_active            | tinyint(1)                                      | YES  |     | NULL              |                                               |
| employee_note        | tinytext                                        | YES  |     | NULL              |                                               |
| employee_description | text                                            | YES  |     | NULL              |                                               |
| training_history     | mediumtext                                      | YES  |     | NULL              |                                               |
| employee_profile     | longtext                                        | YES  |     | NULL              |                                               |
| created_at           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| update_at            | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
| phone_number         | varchar(12)                                     | YES  |     | NULL              |                                               |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
26 rows in set (0.00 sec)

mysql> alter table employees Drop column phone_number;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employees modify column employee_id int;
Query OK, 5 rows affected (0.11 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> alter table employees drop primary key;
Query OK, 5 rows affected (0.07 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> desc employees;
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field                | Type                                            | Null | Key | Default           | Extra                                         |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| employee_id          | int                                             | NO   |     | NULL              |                                               |
| employee_code        | char(8)                                         | YES  |     | NULL              |                                               |
| employee_name        | varchar(60)                                     | YES  |     | NULL              |                                               |
| age                  | tinyint unsigned                                | YES  |     | NULL              |                                               |
| number_of_children   | smallint unsigned                               | YES  |     | NULL              |                                               |
| experience_months    | smallint unsigned                               | YES  |     | NULL              |                                               |
| salary               | decimal(10,2)                                   | YES  |     | NULL              |                                               |
| performance_score    | float                                           | YES  |     | NULL              |                                               |
| productivity_score   | double                                          | YES  |     | NULL              |                                               |
| department_id        | char(5)                                         | YES  |     | NULL              |                                               |
| employee_status      | enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') | YES  |     | NULL              |                                               |
| Skills               | set('JAVA','PYTHON','MYSQL','REACT','AWS')      | YES  |     | NULL              |                                               |
| gender               | enum('male','female')                           | YES  |     | NULL              |                                               |
| date_of_birth        | date                                            | YES  |     | NULL              |                                               |
| joining_date         | date                                            | YES  |     | NULL              |                                               |
| login_time           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| interview_datetime   | datetime                                        | YES  |     | NULL              |                                               |
| birth_year           | year                                            | YES  |     | NULL              |                                               |
| is_active            | tinyint(1)                                      | YES  |     | NULL              |                                               |
| employee_note        | tinytext                                        | YES  |     | NULL              |                                               |
| employee_description | text                                            | YES  |     | NULL              |                                               |
| training_history     | mediumtext                                      | YES  |     | NULL              |                                               |
| employee_profile     | longtext                                        | YES  |     | NULL              |                                               |
| created_at           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| update_at            | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
25 rows in set (0.00 sec)
       




mysql> show create table employees;
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| employees | CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `employee_code` char(8) DEFAULT NULL,
  `employee_name` varchar(60) DEFAULT NULL,
  `age` tinyint unsigned DEFAULT NULL,
  `number_of_children` smallint unsigned DEFAULT NULL,
  `experience_months` smallint unsigned DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `performance_score` float DEFAULT NULL,
  `productivity_score` double DEFAULT NULL,
  `department_id` char(5) DEFAULT NULL,
  `employee_status` enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') DEFAULT NULL,
  `Skills` set('JAVA','PYTHON','MYSQL','REACT','AWS') DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `interview_datetime` datetime DEFAULT NULL,
  `birth_year` year DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `employee_note` tinytext,
  `employee_description` text,
  `training_history` mediumtext,
  `employee_profile` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)






