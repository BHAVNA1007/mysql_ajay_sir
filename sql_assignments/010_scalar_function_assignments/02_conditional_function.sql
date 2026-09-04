


mysql> create table staff(staff_id      INT Primary Key Auto_Increment, staff_name  VARCHAR(50), department VARCHAR(30), city       VARCHAR(30), salary         DECIMAL(10,2), experience       INT, age        INT, email      VARCHAR(100), phone VARCHAR(15), bonus      DECIMAL(10,2), status   VARCHAR(20));
Query OK, 0 rows affected (0.04 sec)

mysql> desc staff;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| staff_id   | int           | NO   | PRI | NULL    | auto_increment |
| staff_name | varchar(50)   | YES  |     | NULL    |                |
| department | varchar(30)   | YES  |     | NULL    |                |
| city       | varchar(30)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | YES  |     | NULL    |                |
| experience | int           | YES  |     | NULL    |                |
| age        | int           | YES  |     | NULL    |                |
| email      | varchar(100)  | YES  |     | NULL    |                |
| phone      | varchar(15)   | YES  |     | NULL    |                |
| bonus      | decimal(10,2) | YES  |     | NULL    |                |
| status     | varchar(20)   | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
11 rows in set (0.01 sec)







mysql> INSERT INTO staff
    -> (staff_name, department, city, salary, experience, age, email, phone, bonus, status)
    -> VALUES
    -> ('Amit Sharma', 'IT', 'Indore', 55000.00, 3, 25, 'amit@gmail.com', '9876543210', 5000.00, 'Active'),
    -> ('Priya Verma', 'HR', 'Bhopal', 48000.00, 2, 24, 'priya@gmail.com', '9123456780', NULL, 'Active'),
    -> ('Rahul Patil', 'Finance', 'Pune', 65000.00, 5, 29, 'rahul@gmail.com', NULL, 7500.00, 'Active'),
    -> ('Neha Singh', 'IT', 'Mumbai', 72000.00, 7, 32, NULL, '9988776655', 10000.00, 'Inactive'),
    -> ('Vikas Joshi', 'Sales', 'Indore', 45000.00, 1, 23, 'vikas@gmail.com', NULL, NULL, 'Active'),
    -> ('Sneha Kulkarni', 'Finance', 'Bhopal', 85000.00, 9, 35, 'sneha@gmail.com', '9876501234', 12000.00, 'Active'),
    -> ('Rohit Mehta', 'IT', 'Pune', 95000.00, 11, 38, 'rohit@gmail.com', '9012345678', NULL, 'Inactive'),
    -> ('Kavita Rao', 'HR', 'Indore', 60000.00, 4, 28, NULL, '9090909090', 6000.00, 'Active'),
    -> ('Arjun Gupta', 'Sales', 'Mumbai', 40000.00, 0, 22, 'arjun@gmail.com', '8888777766', NULL, 'Inactive'),
    -> ('Pooja Shah', 'Finance', 'Indore', 70000.00, 6, 31, 'pooja@gmail.com', NULL, 9000.00, 'Active');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from staff;
+----------+----------------+------------+--------+----------+------------+------+-----------------+------------+----------+----------+
| staff_id | staff_name     | department | city   | salary   | experience | age  | email           | phone      | bonus    | status   |
+----------+----------------+------------+--------+----------+------------+------+-----------------+------------+----------+----------+
|        1 | Amit Sharma    | IT         | Indore | 55000.00 |          3 |   25 | amit@gmail.com  | 9876543210 |  5000.00 | Active   |
|        2 | Priya Verma    | HR         | Bhopal | 48000.00 |          2 |   24 | priya@gmail.com | 9123456780 |     NULL | Active   |
|        3 | Rahul Patil    | Finance    | Pune   | 65000.00 |          5 |   29 | rahul@gmail.com | NULL       |  7500.00 | Active   |
|        4 | Neha Singh     | IT         | Mumbai | 72000.00 |          7 |   32 | NULL            | 9988776655 | 10000.00 | Inactive |
|        5 | Vikas Joshi    | Sales      | Indore | 45000.00 |          1 |   23 | vikas@gmail.com | NULL       |     NULL | Active   |
|        6 | Sneha Kulkarni | Finance    | Bhopal | 85000.00 |          9 |   35 | sneha@gmail.com | 9876501234 | 12000.00 | Active   |
|        7 | Rohit Mehta    | IT         | Pune   | 95000.00 |         11 |   38 | rohit@gmail.com | 9012345678 |     NULL | Inactive |
|        8 | Kavita Rao     | HR         | Indore | 60000.00 |          4 |   28 | NULL            | 9090909090 |  6000.00 | Active   |
|        9 | Arjun Gupta    | Sales      | Mumbai | 40000.00 |          0 |   22 | arjun@gmail.com | 8888777766 |     NULL | Inactive |
|       10 | Pooja Shah     | Finance    | Indore | 70000.00 |          6 |   31 | pooja@gmail.com | NULL       |  9000.00 | Active   |
+----------+----------------+------------+--------+----------+------------+------+-----------------+------------+----------+----------+
10 rows in set (0.00 sec)








Q1. IF()
Display staff_name, salary, and salary status. If salary is ₹60,000 or more, show 'High Salary', otherwise 'Low Salary'.



mysql> select staff_name, salary, status, if(salary >= 60000, 'High Salary', 'Low Salary') from staff;
+----------------+----------+----------+--------------------------------------------------+
| staff_name     | salary   | status   | if(salary >= 60000, 'High Salary', 'Low Salary') |
+----------------+----------+----------+--------------------------------------------------+
| Amit Sharma    | 55000.00 | Active   | Low Salary                                       |
| Priya Verma    | 48000.00 | Active   | Low Salary                                       |
| Rahul Patil    | 65000.00 | Active   | High Salary                                      |
| Neha Singh     | 72000.00 | Inactive | High Salary                                      |
| Vikas Joshi    | 45000.00 | Active   | Low Salary                                       |
| Sneha Kulkarni | 85000.00 | Active   | High Salary                                      |
| Rohit Mehta    | 95000.00 | Inactive | High Salary                                      |
| Kavita Rao     | 60000.00 | Active   | High Salary                                      |
| Arjun Gupta    | 40000.00 | Inactive | Low Salary                                       |
| Pooja Shah     | 70000.00 | Active   | High Salary                                      |
+----------------+----------+----------+--------------------------------------------------+
10 rows in set (0.00 sec)






Q2. IF()
Display staff_name and experience status. If experience is 5 or more, show 'Experienced', otherwise 'Fresher'.

mysql> select staff_name, experience, IF(experience >= 5, 'experienced', 'Fresher') from staff;
+----------------+------------+-----------------------------------------------+
| staff_name     | experience | IF(experience >= 5, 'experienced', 'Fresher') |
+----------------+------------+-----------------------------------------------+
| Amit Sharma    |          3 | Fresher                                       |
| Priya Verma    |          2 | Fresher                                       |
| Rahul Patil    |          5 | experienced                                   |
| Neha Singh     |          7 | experienced                                   |
| Vikas Joshi    |          1 | Fresher                                       |
| Sneha Kulkarni |          9 | experienced                                   |
| Rohit Mehta    |         11 | experienced                                   |
| Kavita Rao     |          4 | Fresher                                       |
| Arjun Gupta    |          0 | Fresher                                       |
| Pooja Shah     |          6 | experienced                                   |
+----------------+------------+-----------------------------------------------+
10 rows in set (0.00 sec)






Q3. IFNULL()
Display staff_name and email. If email is NULL, display 'Email Not Available'.


mysql> select staff_name, email, IFNULL(email, 'Email Not Available') from staff;
+----------------+-----------------+--------------------------------------+
| staff_name     | email           | IFNULL(email, 'Email Not Available') |
+----------------+-----------------+--------------------------------------+
| Amit Sharma    | amit@gmail.com  | amit@gmail.com                       |
| Priya Verma    | priya@gmail.com | priya@gmail.com                      |
| Rahul Patil    | rahul@gmail.com | rahul@gmail.com                      |
| Neha Singh     | NULL            | Email Not Available                  |
| Vikas Joshi    | vikas@gmail.com | vikas@gmail.com                      |
| Sneha Kulkarni | sneha@gmail.com | sneha@gmail.com                      |
| Rohit Mehta    | rohit@gmail.com | rohit@gmail.com                      |
| Kavita Rao     | NULL            | Email Not Available                  |
| Arjun Gupta    | arjun@gmail.com | arjun@gmail.com                      |
| Pooja Shah     | pooja@gmail.com | pooja@gmail.com                      |
+----------------+-----------------+--------------------------------------+
10 rows in set (0.00 sec)







Q4. COALESCE()
Display staff_name and contact information. Give priority to phone → email → 'No Contact'.

mysql> select staff_name, COALESCE(phone, email, 'No contact') as contact_info from staff;
+----------------+-----------------+
| staff_name     | contact_info    |
+----------------+-----------------+
| Amit Sharma    | 9876543210      |
| Priya Verma    | 9123456780      |
| Rahul Patil    | rahul@gmail.com |
| Neha Singh     | 9988776655      |
| Vikas Joshi    | vikas@gmail.com |
| Sneha Kulkarni | 9876501234      |
| Rohit Mehta    | 9012345678      |
| Kavita Rao     | 9090909090      |
| Arjun Gupta    | 8888777766      |
| Pooja Shah     | pooja@gmail.com |
+----------------+-----------------+
10 rows in set (0.00 sec)





Q5. NULLIF()
Display staff_name and salary. If salary is exactly ₹50,000, return NULL; otherwise return the actual salary.


mysql> select staff_name, salary, NULLIF(salary, 50000) as updated_salary from staff;
+----------------+----------+----------------+
| staff_name     | salary   | updated_salary |
+----------------+----------+----------------+
| Amit Sharma    | 55000.00 |       55000.00 |
| Priya Verma    | 48000.00 |       48000.00 |
| Rahul Patil    | 65000.00 |       65000.00 |
| Neha Singh     | 72000.00 |       72000.00 |
| Vikas Joshi    | 45000.00 |       45000.00 |
| Sneha Kulkarni | 85000.00 |       85000.00 |
| Rohit Mehta    | 95000.00 |       95000.00 |
| Kavita Rao     | 60000.00 |       60000.00 |
| Arjun Gupta    | 40000.00 |       40000.00 |
| Pooja Shah     | 70000.00 |       70000.00 |
+----------------+----------+----------------+
10 rows in set (0.00 sec)






Q6. CASE
Create a salary category:

salary >= 80,000 → 'High'
salary >= 60,000 → 'Medium'
Otherwise → 'Low'


mysql> select salary,
    -> case
    -> when salary >= 80000 then 'High'
    -> when salary >= 60000 then 'Medium'
    -> else 'low'
    -> end as salary_category
    -> from staff;
+----------+-----------------+
| salary   | salary_category |
+----------+-----------------+
| 55000.00 | low             |
| 48000.00 | low             |
| 65000.00 | Medium          |
| 72000.00 | Medium          |
| 45000.00 | low             |
| 85000.00 | High            |
| 95000.00 | High            |
| 60000.00 | Medium          |
| 40000.00 | low             |
| 70000.00 | Medium          |
+----------+-----------------+
10 rows in set (0.00 sec)







Q7. CASE + AND/OR
Create an employee category:

IT + experience >= 5 → 'IT Experienced'
Finance + salary >= 70,000 → 'Finance High Earner'
HR + experience >= 3 → 'HR Experienced'
Otherwise → 'Other'

mysql> select case
    -> when department = 'IT' AND experience >= 5 THEN 'IT Experienced'
    -> when department = 'Finance' AND salary >= 70000 THEN 'Finance High Earner'
    -> when department = 'HR' AND experience >= 3 THEN 'HR Experienced'
    -> else 'Other'
    -> end as employee_category
    -> from staff;
+---------------------+
| employee_category   |
+---------------------+
| Other               |
| Other               |
| Other               |
| IT Experienced      |
| Other               |
| Finance High Earner |
| IT Experienced      |
| HR Experienced      |
| Other               |
| Finance High Earner |
+---------------------+
10 rows in set (0.00 sec)