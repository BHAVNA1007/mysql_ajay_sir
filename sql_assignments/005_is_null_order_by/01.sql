mysql> create table employees(employee_id INT AUTO_INCREMENT PRIMARY KEY, employee_name VARCHAR(30), department VARCHAR(20), city VARCHAR(20), salary DECIMAL(10,2), joining_date DATE, experience TINYINT UNSIGNED, age TINYINT UNSIGNED, gender ENUM('male', 'female'), employment_type ENUM( 'FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERN'), skills SET('JAVA', 'PYTHON', 'SQL', 'REACT'), email VARCHAR(30), manager_id CHAR(6), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.10 sec)

mysql> desc employees;
+-----------------+---------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field           | Type                                              | Null | Key | Default           | Extra                                         |
+-----------------+---------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| employee_id     | int                                               | NO   | PRI | NULL              | auto_increment                                |
| employee_name   | varchar(30)                                       | YES  |     | NULL              |                                               |
| department      | varchar(20)                                       | YES  |     | NULL              |                                               |
| city            | varchar(20)                                       | YES  |     | NULL              |                                               |
| salary          | decimal(10,2)                                     | YES  |     | NULL              |                                               |
| joining_date    | date                                              | YES  |     | NULL              |                                               |
| experience      | tinyint unsigned                                  | YES  |     | NULL              |                                               |
| age             | tinyint unsigned                                  | YES  |     | NULL              |                                               |
| gender          | enum('male','female')                             | YES  |     | NULL              |                                               |
| employment_type | enum('FULL_TIME','PART_TIME','CONTRACT','INTERN') | YES  |     | NULL              |                                               |
| skills          | set('JAVA','PYTHON','SQL','REACT')                | YES  |     | NULL              |                                               |
| email           | varchar(30)                                       | YES  |     | NULL              |                                               |
| manager_id      | char(6)                                           | YES  |     | NULL              |                                               |
| created_at      | timestamp                                         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at      | timestamp                                         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-----------------+---------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
15 rows in set (0.02 sec)

mysql> INSERT INTO employees
    -> (employee_name, department, city, salary, joining_date, experience, age, gender, employment_type, skills, email, manager_id)
    -> VALUES
    -> ('Amit Sharma', 'IT', 'Bhopal', 75000.00, '2021-03-15', 5, 28, 'male', 'FULL_TIME', 'JAVA,PYTHON,SQL', 'amit@gmail.com', 'MGR001'),
    ->
    -> ('Priya Verma', 'HR', 'Indore', 55000.00, '2022-06-20', 3, 26, 'female', 'FULL_TIME', 'SQL', 'priya@gmail.com', 'MGR002'),
    ->
    -> ('Rahul Singh', 'Finance', 'Mumbai', 90000.00, '2020-11-10', 7, 32, 'male', 'FULL_TIME', 'PYTHON,SQL', NULL, 'MGR003'),
    ->
    -> ('Neha Patel', 'IT', 'Pune', 68000.00, '2023-02-18', 2, 25, 'female', 'PART_TIME', 'PYTHON,REACT', 'neha@gmail.com', NULL),
    ->
    -> ('Rohit Gupta', 'Sales', 'Delhi', 45000.00, '2024-08-12', 1, 24, 'male', 'CONTRACT', 'SQL', NULL, 'MGR004'),
    ->
    -> ('Sneha Joshi', 'IT', 'Bhopal', 82000.00, '2025-01-25', 6, 30, 'female', 'FULL_TIME', 'JAVA,SQL,REACT', 'sneha@gmail.com', 'MGR001'),
    ->
    -> ('Vikas Yadav', 'Marketing', 'Indore', 38000.00, '2025-05-10', 1, 23, 'male', 'INTERN', 'PYTHON', NULL, NULL),
    ->
    -> ('Kavita Rao', 'Finance', 'Hyderabad', 105000.00, '2021-07-22', 8, 35, 'female', 'FULL_TIME', 'PYTHON,SQL', 'kavita@gmail.com', 'MGR003'),
    ->
    -> ('Arjun Mehta', 'IT', 'Bangalore', 120000.00, '2024-03-05', 9, 38, 'male', 'FULL_TIME', 'JAVA,PYTHON,SQL,REACT', 'arjun@gmail.com', 'MGR001'),
    ->
    -> ('Pooja Sharma', 'HR', 'Nagpur', 48000.00, '2023-09-14', 2, 27, 'female', 'PART_TIME', 'SQL,REACT', NULL, 'MGR002'),
    ->
    -> ('Karan Malhotra', 'Sales', 'Jaipur', 62000.00, '2022-01-30', 4, 29, 'male', 'CONTRACT', 'JAVA,SQL', 'karan@gmail.com', NULL),
    ->
    -> ('Anjali Deshmukh', 'Marketing', 'Pune', 72000.00, '2025-07-18', 5, 31, 'female', 'FULL_TIME', 'PYTHON,REACT', 'anjali@gmail.com', 'MGR005'),
    ->
    -> ('Suresh Kumar', 'IT', 'Chennai', 58000.00, '2020-04-11', 10, 40, 'male', 'FULL_TIME', 'JAVA', NULL, 'MGR001'),
    ->
    -> ('Meena Kapoor', 'Finance', 'Delhi', 87000.00, '2023-12-01', 3, 28, 'female', 'CONTRACT', 'PYTHON,SQL,REACT', 'meena@gmail.com', 'MGR003'),
    ->
    -> ('Aditya Jain', 'IT', 'Indore', 35000.00, '2025-06-25', 0, 22, 'male', 'INTERN', 'PYTHON,SQL', NULL, NULL);
Query OK, 15 rows affected (0.03 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id | created_at          | updated_at          |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
|           1 | Amit Sharma     | IT         | Bhopal    |  75000.00 | 2021-03-15   |          5 |   28 | male   | FULL_TIME       | JAVA,PYTHON,SQL       | amit@gmail.com   | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           2 | Priya Verma     | HR         | Indore    |  55000.00 | 2022-06-20   |          3 |   26 | female | FULL_TIME       | SQL                   | priya@gmail.com  | MGR002     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           3 | Rahul Singh     | Finance    | Mumbai    |  90000.00 | 2020-11-10   |          7 |   32 | male   | FULL_TIME       | PYTHON,SQL            | NULL             | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           4 | Neha Patel      | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com   | NULL       | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           5 | Rohit Gupta     | Sales      | Delhi     |  45000.00 | 2024-08-12   |          1 |   24 | male   | CONTRACT        | SQL                   | NULL             | MGR004     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           6 | Sneha Joshi     | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           7 | Vikas Yadav     | Marketing  | Indore    |  38000.00 | 2025-05-10   |          1 |   23 | male   | INTERN          | PYTHON                | NULL             | NULL       | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           8 | Kavita Rao      | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL            | kavita@gmail.com | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          10 | Pooja Sharma    | HR         | Nagpur    |  48000.00 | 2023-09-14   |          2 |   27 | female | PART_TIME       | SQL,REACT             | NULL             | MGR002     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          11 | Karan Malhotra  | Sales      | Jaipur    |  62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL              | karan@gmail.com  | NULL       | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          13 | Suresh Kumar    | IT         | Chennai   |  58000.00 | 2020-04-11   |         10 |   40 | male   | FULL_TIME       | JAVA                  | NULL             | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          14 | Meena Kapoor    | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          15 | Aditya Jain     | IT         | Indore    |  35000.00 | 2025-06-25   |          0 |   22 | male   | INTERN          | PYTHON,SQL            | NULL             | NULL       | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
15 rows in set (0.00 sec)



Find employees from IT, Finance, or HR who joined after '2023-01-01', have salary between ₹40,000 and ₹90,000, and have experience greater than 3 years.

mysql> select * from employees where department in('IT', 'Finance', 'HR') and joining_date > '2023-01-01' and salary between 40000 and 90000 and experience > 3;
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+----------------+-----------------+------------+---------------------+---------------------+
| employee_id | employee_name | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills         | email           | manager_id | created_at          | updated_at          |
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+----------------+-----------------+------------+---------------------+---------------------+
|           6 | Sneha Joshi   | IT         | Bhopal | 82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT | sneha@gmail.com | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+----------------+-----------------+------------+---------------------+---------------------+
1 row in set (0.00 sec)



Find employees whose email is NULL, salary is greater than ₹50,000, and joining date is after '2022-01-01'.

mysql> select * from employees where (email is null) and (salary > 50000 and joining_date > '2022-01-01');
Empty set (0.00 sec)


Find employees whose manager_id is NOT NULL, department is not HR, and salary is either below ₹40,000 or above ₹80,000.

mysql> select * from employees where (manager_id is NOT NULL) and (department != 'HR') and (salary < 40000 or salary > 80000);
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id | created_at          | updated_at          |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
|           3 | Rahul Singh   | Finance    | Mumbai    |  90000.00 | 2020-11-10   |          7 |   32 | male   | FULL_TIME       | PYTHON,SQL            | NULL             | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           8 | Kavita Rao    | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL            | kavita@gmail.com | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          14 | Meena Kapoor  | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+---------------------+---------------------+
5 rows in set (0.00 sec)




Find employees from Indore, Pune, or Delhi who joined between '2022-01-01' and '2025-12-31', have salary greater than ₹45,000, and experience of at least 3 years.

mysql> select * from employees where city in('Indore', 'Pune', 'Delhi') and joining_date between '2022-01-01' and '2025-12-31' and salary > 45000 and experience >= 3;
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+---------------------+---------------------+
| employee_id | employee_name   | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills           | email            | manager_id | created_at          | updated_at          |
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+---------------------+---------------------+
|           2 | Priya Verma     | HR         | Indore | 55000.00 | 2022-06-20   |          3 |   26 | female | FULL_TIME       | SQL              | priya@gmail.com  | MGR002     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          12 | Anjali Deshmukh | Marketing  | Pune   | 72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT     | anjali@gmail.com | MGR005     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|          14 | Meena Kapoor    | Finance    | Delhi  | 87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com  | MGR003     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+---------------------+---------------------+
3 rows in set (0.00 sec)



Find employees who are FULL_TIME, have JAVA or PYTHON in their skills, salary greater than ₹50,000, and email is NOT NULL.
mysql> select * from employees where employment_type = 'FULL_TIME' and skills in('java', 'python') and salary > 50000 and email is not null;
Empty set (0.00 sec)



Find employees whose name starts with A or S, joining date is after '2023-01-01', salary is between ₹30,000 and ₹80,000, and age is between 25 and 35.

mysql> select * from employees where  (employee_name like 'a%' or  employee_name like 's%') and joining_date > '2023-01-01' and salary between 30000 and 80000 and age between 25 and 35;
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+---------------------+---------------------+
| employee_id | employee_name   | department | city | salary   | joining_date | experience | age  | gender | employment_type | skills       | email            | manager_id | created_at          | updated_at          |
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+---------------------+---------------------+
|          12 | Anjali Deshmukh | Marketing  | Pune | 72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT | anjali@gmail.com | MGR005     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+---------------------+---------------------+
1 row in set (0.02 sec)




Find employees who belong to IT or Finance, have JAVA in skills, experience greater than 4 years, and salary is NOT between ₹50,000 and ₹80,000.


mysql> select * from employees
    -> where department in('IT', 'Finance')
    -> and skills like '%JAVA%'
    -> and experience > 4
    -> and salary not between 50000 and 80000;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id | created_at          | updated_at          |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
2 rows in set (0.00 sec)




mysql> select * from employees
    -> where department in('IT', 'Finance')
    -> and FIND_IN_SET('JAVA', skills)
    -> and experience > 4
    -> and salary not between 50000 and 80000;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id | created_at          | updated_at          |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     | 2026-08-21 21:17:34 | 2026-08-21 21:17:34 |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+---------------------+---------------------+
2 rows in set (0.00 sec)





mysql> Alter table employees drop column created_at, drop column updated_at;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           1 | Amit Sharma     | IT         | Bhopal    |  75000.00 | 2021-03-15   |          5 |   28 | male   | FULL_TIME       | JAVA,PYTHON,SQL       | amit@gmail.com   | MGR001     |
|           2 | Priya Verma     | HR         | Indore    |  55000.00 | 2022-06-20   |          3 |   26 | female | FULL_TIME       | SQL                   | priya@gmail.com  | MGR002     |
|           3 | Rahul Singh     | Finance    | Mumbai    |  90000.00 | 2020-11-10   |          7 |   32 | male   | FULL_TIME       | PYTHON,SQL            | NULL             | MGR003     |
|           4 | Neha Patel      | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com   | NULL       |
|           5 | Rohit Gupta     | Sales      | Delhi     |  45000.00 | 2024-08-12   |          1 |   24 | male   | CONTRACT        | SQL                   | NULL             | MGR004     |
|           6 | Sneha Joshi     | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     |
|           7 | Vikas Yadav     | Marketing  | Indore    |  38000.00 | 2025-05-10   |          1 |   23 | male   | INTERN          | PYTHON                | NULL             | NULL       |
|           8 | Kavita Rao      | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL            | kavita@gmail.com | MGR003     |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
|          10 | Pooja Sharma    | HR         | Nagpur    |  48000.00 | 2023-09-14   |          2 |   27 | female | PART_TIME       | SQL,REACT             | NULL             | MGR002     |
|          11 | Karan Malhotra  | Sales      | Jaipur    |  62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL              | karan@gmail.com  | NULL       |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     |
|          13 | Suresh Kumar    | IT         | Chennai   |  58000.00 | 2020-04-11   |         10 |   40 | male   | FULL_TIME       | JAVA                  | NULL             | MGR001     |
|          14 | Meena Kapoor    | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     |
|          15 | Aditya Jain     | IT         | Indore    |  35000.00 | 2025-06-25   |          0 |   22 | male   | INTERN          | PYTHON,SQL            | NULL             | NULL       |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
15 rows in set (0.00 sec)




Find employees whose department is IT, HR, or Marketing, city is not Mumbai, salary is greater than ₹40,000, and either email is NULL or manager_id is NULL.


mysql> select * from employees where department in('IT', 'HR', 'Marketing') and (city <> 'Mumbai') and (salary > 40000) and (email is null or manager_id is NULL);
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+--------------+----------------+------------+
| employee_id | employee_name | department | city    | salary   | joining_date | experience | age  | gender | employment_type | skills       | email          | manager_id |
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+--------------+----------------+------------+
|           4 | Neha Patel    | IT         | Pune    | 68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT | neha@gmail.com | NULL       |
|          10 | Pooja Sharma  | HR         | Nagpur  | 48000.00 | 2023-09-14   |          2 |   27 | female | PART_TIME       | SQL,REACT    | NULL           | MGR002     |
|          13 | Suresh Kumar  | IT         | Chennai | 58000.00 | 2020-04-11   |         10 |   40 | male   | FULL_TIME       | JAVA         | NULL           | MGR001     |
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+--------------+----------------+------------+
3 rows in set (0.00 sec)



Find employees who joined after '2022-01-01', are not INTERN, have salary greater than ₹45,000, and have either SQL or PYTHON in their skills.


mysql> select * from employees where (joining_date > '2022-01-01') and (employment_type != 'INTERN') and (salary > 45000) and (FIND_IN_SET('SQL', skills) or FIND_IN_SET('PYTHON', skills));
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           2 | Priya Verma     | HR         | Indore    |  55000.00 | 2022-06-20   |          3 |   26 | female | FULL_TIME       | SQL                   | priya@gmail.com  | MGR002     |
|           4 | Neha Patel      | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com   | NULL       |
|           6 | Sneha Joshi     | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
|          10 | Pooja Sharma    | HR         | Nagpur    |  48000.00 | 2023-09-14   |          2 |   27 | female | PART_TIME       | SQL,REACT             | NULL             | MGR002     |
|          11 | Karan Malhotra  | Sales      | Jaipur    |  62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL              | karan@gmail.com  | NULL       |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     |
|          14 | Meena Kapoor    | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
8 rows in set (0.00 sec)




Find employees whose salary is greater than ₹60,000 OR experience is greater than 7 years, but exclude employees from Mumbai and Bhopal.

mysql> select * from employees where (salary > 60000 or experience > 7) and (city not in('Mumbai', 'Bhopal'));
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           4 | Neha Patel      | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com   | NULL       |
|           8 | Kavita Rao      | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL            | kavita@gmail.com | MGR003     |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
|          11 | Karan Malhotra  | Sales      | Jaipur    |  62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL              | karan@gmail.com  | NULL       |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     |
|          13 | Suresh Kumar    | IT         | Chennai   |  58000.00 | 2020-04-11   |         10 |   40 | male   | FULL_TIME       | JAVA                  | NULL             | MGR001     |
|          14 | Meena Kapoor    | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
7 rows in set (0.00 sec)




Find employees who joined between '2023-01-01' and '2026-12-31', belong to Electronics-related departments? Instead, use: departments IT or Development, salary greater than ₹50,000, and email is NOT NULL.


mysql> select * from employees where joining_date between '2023-01-01' and '2026-12-31' and department in('IT', 'Development') and salary > 50000 and email is not null;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           4 | Neha Patel    | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com  | NULL       |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
3 rows in set (0.00 sec)




Find employees whose name contains the letter a, department is not HR, salary is between ₹35,000 and ₹75,000, and joining date is after '2022-06-01'.

mysql> select * from employees where (employee_name like '%a%') and  (department <> 'HR') and (salary between 35000 and 75000 and joining_date > '2022-06-01');
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
| employee_id | employee_name   | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills       | email            | manager_id |
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
|           4 | Neha Patel      | IT         | Pune   | 68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT | neha@gmail.com   | NULL       |
|           5 | Rohit Gupta     | Sales      | Delhi  | 45000.00 | 2024-08-12   |          1 |   24 | male   | CONTRACT        | SQL          | NULL             | MGR004     |
|           7 | Vikas Yadav     | Marketing  | Indore | 38000.00 | 2025-05-10   |          1 |   23 | male   | INTERN          | PYTHON       | NULL             | NULL       |
|          12 | Anjali Deshmukh | Marketing  | Pune   | 72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT | anjali@gmail.com | MGR005     |
|          15 | Aditya Jain     | IT         | Indore | 35000.00 | 2025-06-25   |          0 |   22 | male   | INTERN          | PYTHON,SQL   | NULL             | NULL       |
+-------------+-----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
5 rows in set (0.00 sec)





Find employees who have both JAVA and SQL skills, salary greater than ₹55,000, experience greater than 3 years, and manager_id is NOT NULL.

mysql> select * from employees where FIND_IN_SET('JAVA', skills) and FIND_IN_SET('SQL', skills) and salary > 55000 and experience > 3 and manager_id is NOT NULL;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           1 | Amit Sharma   | IT         | Bhopal    |  75000.00 | 2021-03-15   |          5 |   28 | male   | FULL_TIME       | JAVA,PYTHON,SQL       | amit@gmail.com  | MGR001     |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
3 rows in set (0.00 sec)



Find employees who have PYTHON or REACT skills, belong to IT or Development, joined after '2023-01-01', and salary is greater than ₹50,000.

mysql> select * from employees where (FIND_IN_SET('PYTHON', skills) or FIND_IN_SET('REACT', skills)) and (department in('IT', 'Development')) and joining_date > '2023-01-01' and salary > 50000;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           4 | Neha Patel    | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com  | NULL       |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
3 rows in set (0.00 sec)




Find employees whose employment type is CONTRACT or PART_TIME, salary is greater than ₹35,000, joining date is between '2022-01-01' and '2025-12-31', and email is NOT NULL.

mysql> select * from employees where (employment_type = 'CONTRACT' or  employment_type = 'PART_TIME') and salary > 35000 and joining_date between '2022-01-01' and '2025-12-31' and email is NOT NULL;

+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
| employee_id | employee_name  | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills           | email           | manager_id |
+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
|           4 | Neha Patel     | IT         | Pune   | 68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT     | neha@gmail.com  | NULL       |
|          11 | Karan Malhotra | Sales      | Jaipur | 62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL         | karan@gmail.com | NULL       |
|          14 | Meena Kapoor   | Finance    | Delhi  | 87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com | MGR003     |
+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
3 rows in set (0.00 sec)




Find employees whose gender is FEMALE, department is IT or Finance, salary is greater than ₹45,000, and experience is greater than 2 years.


mysql> select * from employees where gender = 'female' and department in('Finance', 'IT') and salary > 45000 and experience > 2;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills           | email            | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT   | sneha@gmail.com  | MGR001     |
|           8 | Kavita Rao    | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL       | kavita@gmail.com | MGR003     |
|          14 | Meena Kapoor  | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com  | MGR003     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
3 rows in set (0.00 sec)



Find employees whose city is Indore, Pune, or Delhi, department is not HR, joining date is after '2023-01-01', salary is between ₹40,000 and ₹1,00,000, and manager_id is NOT NULL.

mysql> select * from employees where city in("Indore", "Pune", "Delhi") and department <> 'HR' and joining_date > '2023-01-01' and salary between 40000 and 100000 and manager_id is NOT NULL;
+-------------+-----------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
| employee_id | employee_name   | department | city  | salary   | joining_date | experience | age  | gender | employment_type | skills           | email            | manager_id |
+-------------+-----------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
|           5 | Rohit Gupta     | Sales      | Delhi | 45000.00 | 2024-08-12   |          1 |   24 | male   | CONTRACT        | SQL              | NULL             | MGR004     |
|          12 | Anjali Deshmukh | Marketing  | Pune  | 72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT     | anjali@gmail.com | MGR005     |
|          14 | Meena Kapoor    | Finance    | Delhi | 87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com  | MGR003     |
+-------------+-----------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+------------------+------------+
3 rows in set (0.00 sec)



Find employees whose salary is NOT between ₹30,000 and ₹60,000, experience is greater than 5 years, and either department is IT or Finance.


mysql> select * from employees where salary not between 30000 and 60000 and experience > 5 and department in('IT', 'Finance');
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           3 | Rahul Singh   | Finance    | Mumbai    |  90000.00 | 2020-11-10   |          7 |   32 | male   | FULL_TIME       | PYTHON,SQL            | NULL             | MGR003     |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     |
|           8 | Kavita Rao    | Finance    | Hyderabad | 105000.00 | 2021-07-22   |          8 |   35 | female | FULL_TIME       | PYTHON,SQL            | kavita@gmail.com | MGR003     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
4 rows in set (0.00 sec)




Find employees whose email is NULL OR manager_id is NULL, but salary must be greater than ₹40,000 and joining date must be after '2022-01-01'.

mysql> select * from employees where (email is NULL or manager_id is NULL) and salary > 40000 and joining_date > '2022-01-01';
+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+-----------------+------------+
| employee_id | employee_name  | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills       | email           | manager_id |
+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+-----------------+------------+
|           4 | Neha Patel     | IT         | Pune   | 68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT | neha@gmail.com  | NULL       |
|           5 | Rohit Gupta    | Sales      | Delhi  | 45000.00 | 2024-08-12   |          1 |   24 | male   | CONTRACT        | SQL          | NULL            | MGR004     |
|          10 | Pooja Sharma   | HR         | Nagpur | 48000.00 | 2023-09-14   |          2 |   27 | female | PART_TIME       | SQL,REACT    | NULL            | MGR002     |
|          11 | Karan Malhotra | Sales      | Jaipur | 62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL     | karan@gmail.com | NULL       |
+-------------+----------------+------------+--------+----------+--------------+------------+------+--------+-----------------+--------------+-----------------+------------+
4 rows in set (0.00 sec)




Find employees whose name starts with S OR contains a, department is IT or Finance, salary is between ₹40,000 and ₹90,000, and experience is at least 3 years.


mysql> select * from employees where (employee_name like 's%' or employee_name like '%a%') and (department in('IT', 'Finance')) and salary between 40000 and 90000 and experience >= 3;
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
| employee_id | employee_name | department | city    | salary   | joining_date | experience | age  | gender | employment_type | skills           | email           | manager_id |
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
|           1 | Amit Sharma   | IT         | Bhopal  | 75000.00 | 2021-03-15   |          5 |   28 | male   | FULL_TIME       | JAVA,PYTHON,SQL  | amit@gmail.com  | MGR001     |
|           3 | Rahul Singh   | Finance    | Mumbai  | 90000.00 | 2020-11-10   |          7 |   32 | male   | FULL_TIME       | PYTHON,SQL       | NULL            | MGR003     |
|           6 | Sneha Joshi   | IT         | Bhopal  | 82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT   | sneha@gmail.com | MGR001     |
|          13 | Suresh Kumar  | IT         | Chennai | 58000.00 | 2020-04-11   |         10 |   40 | male   | FULL_TIME       | JAVA             | NULL            | MGR001     |
|          14 | Meena Kapoor  | Finance    | Delhi   | 87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com | MGR003     |
+-------------+---------------+------------+---------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
5 rows in set (0.00 sec)



Find employees who joined between '2022-01-01' and '2025-12-31', are not from Mumbai or Bhopal, salary is greater than ₹50,000, and have JAVA in their skills.

mysql> select * from employees where joining_date between '2022-01-01' and '2025-12-31' and city not in('Mumbai', 'Bhopal') and salary > 50000 and FIND_IN_SET('JAVA', skills);
+-------------+----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name  | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           9 | Arjun Mehta    | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
|          11 | Karan Malhotra | Sales      | Jaipur    |  62000.00 | 2022-01-30   |          4 |   29 | male   | CONTRACT        | JAVA,SQL              | karan@gmail.com | NULL       |
+-------------+----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
2 rows in set (0.00 sec)




Find employees who are FULL_TIME, joined after '2023-01-01', have salary greater than ₹60,000, and have either JAVA + SQL or PYTHON + REACT skills.


mysql> select * from employees where employment_type = 'FULL_TIME' and joining_date > '2023-01-01' and salary > 60000 and ((FIND_IN_SET('JAVA', skills) and FIND_IN_SET('SQL', skills)) or (FIND_IN_SET('PYTHON', skills) and FIND_IN_SET('REACT', skills)));
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           6 | Sneha Joshi     | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------





Find employees from IT, Finance, or Development whose salary is between ₹45,000 and ₹90,000, experience is greater than 3 years, email is NOT NULL, and manager_id is NOT NULL.

mysql> select * from employees where department in('IT', 'Finance', 'Development') and salary between 45000 and 90000 and experience >  3 and  email is NOT NULL and manager_id is NOT NULL;
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+-----------------+-----------------+------------+
| employee_id | employee_name | department | city   | salary   | joining_date | experience | age  | gender | employment_type | skills          | email           | manager_id |
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+-----------------+-----------------+------------+
|           1 | Amit Sharma   | IT         | Bhopal | 75000.00 | 2021-03-15   |          5 |   28 | male   | FULL_TIME       | JAVA,PYTHON,SQL | amit@gmail.com  | MGR001     |
|           6 | Sneha Joshi   | IT         | Bhopal | 82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT  | sneha@gmail.com | MGR001     |
+-------------+---------------+------------+--------+----------+--------------+------------+------+--------+-----------------+-----------------+-----------------+------------+
2 rows in set (0.00 sec)





Find employees whose joining date is after '2023-01-01', department is not HR, salary is greater than ₹50,000 OR experience is greater than 6 years, and city is not Mumbai.


mysql> select * from employees where joining_date > '2023-01-01' and department <> 'HR' and (salary > 50000 or experience > 6) and city <> 'Mumbai';
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
| employee_id | employee_name   | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email            | manager_id |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
|           4 | Neha Patel      | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com   | NULL       |
|           6 | Sneha Joshi     | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com  | MGR001     |
|           9 | Arjun Mehta     | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com  | MGR001     |
|          12 | Anjali Deshmukh | Marketing  | Pune      |  72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT          | anjali@gmail.com | MGR005     |
|          14 | Meena Kapoor    | Finance    | Delhi     |  87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT      | meena@gmail.com  | MGR003     |
+-------------+-----------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+------------------+------------+
5 rows in set (0.00 sec)






Find employees whose name starts with A or M, gender is FEMALE, employment type is FULL_TIME, salary is greater than ₹45,000, and email is NOT NULL.


mysql> select * from employees where (employee_name like 'a%' or employee_name like 'm%') and gender = 'female' and employment_type  = 'FULL_TIME' and salary > 45000 and email is NOT NULL;
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
| employee_id | employee_name   | department | city | salary   | joining_date | experience | age  | gender | employment_type | skills       | email            | manager_id |
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
|          12 | Anjali Deshmukh | Marketing  | Pune | 72000.00 | 2025-07-18   |          5 |   31 | female | FULL_TIME       | PYTHON,REACT | anjali@gmail.com | MGR005     |
+-------------+-----------------+------------+------+----------+--------------+------------+------+--------+-----------------+--------------+------------------+------------+
1 row in set (0.00 sec)




Find employees who have JAVA or SPRING in their skills, joined after '2022-01-01', salary is NOT between ₹40,000 and ₹70,000, and manager_id is NOT NULL.


mysql> select * from employees where (FIND_IN_SET('JAVA', skills) OR  skills like '%SPRING%') and (joining_date > '2022-01-01') and (salary NOT between 40000 and 70000) and manager_id is NOT NULL;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
2 rows in set (0.00 sec)




Find employees from Indore, Pune, or Delhi whose joining date is between '2023-01-01' and '2026-12-31', salary is between ₹40,000 and ₹1,00,000, experience is greater than 2 years, and either email or manager_id is NULL.


mysql> select * from employees where city in('Indore', 'Pune', 'Delhi') and  joining_date between '2023-01-01' and '2026-12-31' and salary  between 40000 and 100000 and experience > 2 and (email is null or manager_id is NULL);
Empty set (0.00 sec)





Find employees belonging to IT or Development, whose name contains a, skills contain JAVA or PYTHON, salary is greater than ₹50,000, joining date is after '2023-01-01', and email is NOT NULL.


mysql> select * from employees where department in('IT', 'Development') and employee_name like  '%a%' and (FIND_IN_SET('JAVA', skills) or FIND_IN_SET('PYTHON', skills)) and salary > 50000 and joining_date > '2023-01-01' and email is NOT NULL;
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
| employee_id | employee_name | department | city      | salary    | joining_date | experience | age  | gender | employment_type | skills                | email           | manager_id |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
|           4 | Neha Patel    | IT         | Pune      |  68000.00 | 2023-02-18   |          2 |   25 | female | PART_TIME       | PYTHON,REACT          | neha@gmail.com  | NULL       |
|           6 | Sneha Joshi   | IT         | Bhopal    |  82000.00 | 2025-01-25   |          6 |   30 | female | FULL_TIME       | JAVA,SQL,REACT        | sneha@gmail.com | MGR001     |
|           9 | Arjun Mehta   | IT         | Bangalore | 120000.00 | 2024-03-05   |          9 |   38 | male   | FULL_TIME       | JAVA,PYTHON,SQL,REACT | arjun@gmail.com | MGR001     |
+-------------+---------------+------------+-----------+-----------+--------------+------------+------+--------+-----------------+-----------------------+-----------------+------------+
3 rows in set (0.00 sec)






Find employees whose department is IT, Finance, or Development, city is not Mumbai or Bhopal, salary is between ₹40,000 and ₹90,000, experience is greater than 3 years, skills contain SQL, and manager_id is NOT NULL. Display the result ordered by salary in descending order.



mysql> SELECT * FROM employees
    -> WHERE department IN ('IT', 'Finance', 'Development')
    ->   AND city NOT IN ('Mumbai', 'Bhopal')
    ->   AND salary BETWEEN 40000 AND 90000
    ->   AND experience > 3
    ->   AND FIND_IN_SET('SQL', skills)
    ->   AND manager_id IS NOT NULL
    -> ORDER BY salary DESC;
Empty set (0.00 sec)







Find employees whose name starts with S OR contains a, department is IT or Finance, joining date is between '2023-01-01' and '2026-12-31', salary is between ₹40,000 and ₹1,00,000, experience is greater than 2 years, email is NOT NULL, manager_id is NOT NULL, skills contain JAVA or PYTHON, and city is Indore, Pune, or Delhi. Display the result first by department ascending and then by salary descending.

mysql> SELECT * FROM employees
    -> WHERE (employee_name LIKE 'S%' OR employee_name LIKE '%a%')
    ->   AND department IN ('IT', 'Finance')
    ->   AND joining_date BETWEEN '2023-01-01' AND '2026-12-31'
    ->   AND salary BETWEEN 40000 AND 100000
    ->   AND experience > 2
    ->   AND email IS NOT NULL
    ->   AND manager_id IS NOT NULL
    ->   AND (FIND_IN_SET('JAVA', skills) OR FIND_IN_SET('PYTHON', skills))
    ->   AND city IN ('Indore', 'Pune', 'Delhi')
    -> ORDER BY department ASC, salary DESC;
+-------------+---------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
| employee_id | employee_name | department | city  | salary   | joining_date | experience | age  | gender | employment_type | skills           | email           | manager_id |
+-------------+---------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
|          14 | Meena Kapoor  | Finance    | Delhi | 87000.00 | 2023-12-01   |          3 |   28 | female | CONTRACT        | PYTHON,SQL,REACT | meena@gmail.com | MGR003     |
+-------------+---------------+------------+-------+----------+--------------+------------+------+--------+-----------------+------------------+-----------------+------------+
1 row in set (0.02 sec)
