mysql> CREATE TABLE attendance (
    ->     attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     employee_id INT,
    ->     employee_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     city VARCHAR(30),
    ->     date_of_birth DATE,
    ->     joining_date DATE,
    ->     project_start_date DATETIME,
    ->     attendance_date DATE,
    ->     login_time DATETIME,
    ->     logout_time DATETIME,
    ->     salary DECIMAL(10,2),
    ->     attendance_status VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO attendance
    -> (employee_id, employee_name, department, city, date_of_birth,
    ->  joining_date, project_start_date, attendance_date,
    ->  login_time, logout_time, salary, attendance_status)
    -> VALUES
    ->
    -> (101, 'Amit Sharma', 'IT', 'Indore',
    ->  '1998-03-15', '2022-06-20', '2025-01-10 09:30:00',
    ->  '2026-08-25', '2026-08-25 09:42:15', '2026-08-25 18:05:30',
    ->  65000.00, 'Late'),
    ->
    -> (102, 'Priya Verma', 'HR', 'Bhopal',
    ->  '1997-07-22', '2021-04-12', '2024-11-05 10:00:00',
    ->  '2026-08-25', '2026-08-25 09:15:20', '2026-08-25 17:45:10',
    ->  58000.00, 'Present'),
    ->
    -> (103, 'Rahul Singh', 'Finance', 'Mumbai',
    ->  '1995-12-05', '2020-01-15', '2024-06-18 08:45:00',
    ->  '2026-08-26', '2026-08-26 09:05:45', '2026-08-26 18:20:15',
    ->  72000.00, 'Present'),
    ->
    -> (104, 'Neha Patel', 'Sales', 'Pune',
    ->  '1999-09-18', '2023-02-10', '2025-03-01 11:15:00',
    ->  '2026-08-26', '2026-08-26 09:55:10', '2026-08-26 18:10:25',
    ->  52000.00, 'Late'),
    ->
    -> (105, 'Vikas Mehta', 'IT', 'Indore',
    ->  '1996-01-28', '2021-08-05', '2025-02-20 09:00:00',
    ->  '2026-08-27', '2026-08-27 09:10:05', '2026-08-27 18:30:45',
    ->  81000.00, 'Present'),
    ->
    -> (101, 'Amit Sharma', 'IT', 'Indore',
    ->  '1998-03-15', '2022-06-20', '2025-01-10 09:30:00',
    ->  '2026-08-28', '2026-08-28 09:25:35', '2026-08-28 18:15:20',
    ->  65000.00, 'Present'),
    ->
    -> (106, 'Sneha Joshi', 'Marketing', 'Delhi',
    ->  '2000-05-11', '2023-07-17', '2025-05-12 10:30:00',
    ->  '2026-08-28', '2026-08-28 10:35:50', '2026-08-28 19:05:30',
    ->  47000.00, 'Late'),
    ->
    -> (102, 'Priya Verma', 'HR', 'Bhopal',
    ->  '1997-07-22', '2021-04-12', '2024-11-05 10:00:00',
    ->  '2026-08-29', '2026-08-29 09:05:15', '2026-08-29 17:50:40',
    ->  58000.00, 'Present'),
    ->
    -> (107, 'Arjun Kapoor', 'Operations', 'Jaipur',
    ->  '1994-11-30', '2019-09-23', '2023-12-04 08:30:00',
    ->  '2026-08-29', '2026-08-29 08:55:25', '2026-08-29 17:35:10',
    ->  69000.00, 'Present'),
    ->
    -> (108, 'Kavita Rao', 'Finance', 'Nagpur',
    ->  '1998-06-08', '2022-11-14', '2025-04-15 09:45:00',
    ->  '2026-08-30', '2026-08-30 09:50:35', '2026-08-30 18:25:55',
    ->  61000.00, 'Late'),
    ->
    -> (109, 'Rohit Gupta', 'Development', 'Hyderabad',
    ->  '1996-10-25', '2020-05-18', '2024-08-22 10:15:00',
    ->  '2026-08-30', '2026-08-30 09:20:10', '2026-08-30 18:40:25',
    ->  88000.00, 'Present'),
    ->
    -> (103, 'Rahul Singh', 'Finance', 'Mumbai',
    ->  '1995-12-05', '2020-01-15', '2024-06-18 08:45:00',
    ->  '2026-08-31', '2026-08-31 09:35:40', '2026-08-31 18:05:15',
    ->  72000.00, 'Late');
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> desc attendance;
+--------------------+---------------+------+-----+---------+----------------+
| Field              | Type          | Null | Key | Default | Extra          |
+--------------------+---------------+------+-----+---------+----------------+
| attendance_id      | int           | NO   | PRI | NULL    | auto_increment |
| employee_id        | int           | YES  |     | NULL    |                |
| employee_name      | varchar(50)   | YES  |     | NULL    |                |
| department         | varchar(30)   | YES  |     | NULL    |                |
| city               | varchar(30)   | YES  |     | NULL    |                |
| date_of_birth      | date          | YES  |     | NULL    |                |
| joining_date       | date          | YES  |     | NULL    |                |
| project_start_date | datetime      | YES  |     | NULL    |                |
| attendance_date    | date          | YES  |     | NULL    |                |
| login_time         | datetime      | YES  |     | NULL    |                |
| logout_time        | datetime      | YES  |     | NULL    |                |
| salary             | decimal(10,2) | YES  |     | NULL    |                |
| attendance_status  | varchar(20)   | YES  |     | NULL    |                |
+--------------------+---------------+------+-----+---------+----------------+
13 rows in set (0.00 sec)

mysql> select * from attendance;
+---------------+-------------+---------------+-------------+-----------+---------------+--------------+---------------------+-----------------+---------------------+---------------------+----------+-------------------+
| attendance_id | employee_id | employee_name | department  | city      | date_of_birth | joining_date | project_start_date  | attendance_date | login_time          | logout_time         | salary   | attendance_status |
+---------------+-------------+---------------+-------------+-----------+---------------+--------------+---------------------+-----------------+---------------------+---------------------+----------+-------------------+
|             1 |         101 | Amit Sharma   | IT          | Indore    | 1998-03-15    | 2022-06-20   | 2025-01-10 09:30:00 | 2026-08-25      | 2026-08-25 09:42:15 | 2026-08-25 18:05:30 | 65000.00 | Late              |
|             2 |         102 | Priya Verma   | HR          | Bhopal    | 1997-07-22    | 2021-04-12   | 2024-11-05 10:00:00 | 2026-08-25      | 2026-08-25 09:15:20 | 2026-08-25 17:45:10 | 58000.00 | Present           |
|             3 |         103 | Rahul Singh   | Finance     | Mumbai    | 1995-12-05    | 2020-01-15   | 2024-06-18 08:45:00 | 2026-08-26      | 2026-08-26 09:05:45 | 2026-08-26 18:20:15 | 72000.00 | Present           |
|             4 |         104 | Neha Patel    | Sales       | Pune      | 1999-09-18    | 2023-02-10   | 2025-03-01 11:15:00 | 2026-08-26      | 2026-08-26 09:55:10 | 2026-08-26 18:10:25 | 52000.00 | Late              |
|             5 |         105 | Vikas Mehta   | IT          | Indore    | 1996-01-28    | 2021-08-05   | 2025-02-20 09:00:00 | 2026-08-27      | 2026-08-27 09:10:05 | 2026-08-27 18:30:45 | 81000.00 | Present           |
|             6 |         101 | Amit Sharma   | IT          | Indore    | 1998-03-15    | 2022-06-20   | 2025-01-10 09:30:00 | 2026-08-28      | 2026-08-28 09:25:35 | 2026-08-28 18:15:20 | 65000.00 | Present           |
|             7 |         106 | Sneha Joshi   | Marketing   | Delhi     | 2000-05-11    | 2023-07-17   | 2025-05-12 10:30:00 | 2026-08-28      | 2026-08-28 10:35:50 | 2026-08-28 19:05:30 | 47000.00 | Late              |
|             8 |         102 | Priya Verma   | HR          | Bhopal    | 1997-07-22    | 2021-04-12   | 2024-11-05 10:00:00 | 2026-08-29      | 2026-08-29 09:05:15 | 2026-08-29 17:50:40 | 58000.00 | Present           |
|             9 |         107 | Arjun Kapoor  | Operations  | Jaipur    | 1994-11-30    | 2019-09-23   | 2023-12-04 08:30:00 | 2026-08-29      | 2026-08-29 08:55:25 | 2026-08-29 17:35:10 | 69000.00 | Present           |
|            10 |         108 | Kavita Rao    | Finance     | Nagpur    | 1998-06-08    | 2022-11-14   | 2025-04-15 09:45:00 | 2026-08-30      | 2026-08-30 09:50:35 | 2026-08-30 18:25:55 | 61000.00 | Late              |
|            11 |         109 | Rohit Gupta   | Development | Hyderabad | 1996-10-25    | 2020-05-18   | 2024-08-22 10:15:00 | 2026-08-30      | 2026-08-30 09:20:10 | 2026-08-30 18:40:25 | 88000.00 | Present           |
|            12 |         103 | Rahul Singh   | Finance     | Mumbai    | 1995-12-05    | 2020-01-15   | 2024-06-18 08:45:00 | 2026-08-31      | 2026-08-31 09:35:40 | 2026-08-31 18:05:15 | 72000.00 | Late              |
+---------------+-------------+---------------+-------------+-----------+---------------+--------------+---------------------+-----------------+---------------------+---------------------+----------+-------------------+
12 rows in set (0.00 sec)






# Questions

## 🟢 Basic Date Functions

### Q1. DAY()

Display `employee_name`, `date_of_birth`, and the **day of birth** using the `DAY()` function.

---


mysql> select employee_name, date_of_birth, DAYNAME(date_of_birth) as day_of_birth from attendance;


--+---------------+---------------+--------------+
--| employee_name | date_of_birth | day_of_birth |
--+---------------+---------------+--------------+
--| Amit Sharma   | 1998-03-15    | Sunday       |
--| Priya Verma   | 1997-07-22    | Tuesday      |
--| Rahul Singh   | 1995-12-05    | Tuesday      |
--| Neha Patel    | 1999-09-18    | Saturday     |
--| Vikas Mehta   | 1996-01-28    | Sunday       |
--| Amit Sharma   | 1998-03-15    | Sunday       |
--| Sneha Joshi   | 2000-05-11    | Thursday     |
--| Priya Verma   | 1997-07-22    | Tuesday      |
--| Arjun Kapoor  | 1994-11-30    | Wednesday    |
--| Kavita Rao    | 1998-06-08    | Monday       |
--| Rohit Gupta   | 1996-10-25    | Friday       |
--| Rahul Singh   | 1995-12-05    | Tuesday      |
--+---------------+---------------+--------------+
--12 rows in set (0.01 sec)


### Q2. DAYOFMONTH()

Display `employee_name`, `attendance_date`, and the **day of the month** on which the employee attended.



mysql> select employee_name, attendance_date, MONTHNAME(attendance_date) as day_of_month from  attendance;



--+---------------+-----------------+--------------+
--| employee_name | attendance_date | day_of_month |
--+---------------+-----------------+--------------+
--| Amit Sharma   | 2026-08-25      | August       |
--| Priya Verma   | 2026-08-25      | August       |
--| Rahul Singh   | 2026-08-26      | August       |
--| Neha Patel    | 2026-08-26      | August       |
--| Vikas Mehta   | 2026-08-27      | August       |
--| Amit Sharma   | 2026-08-28      | August       |
--| Sneha Joshi   | 2026-08-28      | August       |
--| Priya Verma   | 2026-08-29      | August       |
--| Arjun Kapoor  | 2026-08-29      | August       |
--| Kavita Rao    | 2026-08-30      | August       |
--| Rohit Gupta   | 2026-08-30      | August       |
--| Rahul Singh   | 2026-08-31      | August       |
--+---------------+-----------------+--------------+
--12 rows in set (0.00 sec)



---

### Q3. MONTH()

Display `employee_name`, `date_of_birth`, and the **birth month number** using `MONTH()`.

mysql> select employee_name, date_of_birth, MONTH(date_of_birth) as birth_month_number from attendance;


--+---------------+---------------+--------------------+
--| employee_name | date_of_birth | birth_month_number |
--+---------------+---------------+--------------------+
--| Amit Sharma   | 1998-03-15    |                  3 |
--| Priya Verma   | 1997-07-22    |                  7 |
--| Rahul Singh   | 1995-12-05    |                 12 |
--| Neha Patel    | 1999-09-18    |                  9 |
--| Vikas Mehta   | 1996-01-28    |                  1 |
--| Amit Sharma   | 1998-03-15    |                  3 |
--| Sneha Joshi   | 2000-05-11    |                  5 |
--| Priya Verma   | 1997-07-22    |                  7 |
--| Arjun Kapoor  | 1994-11-30    |                 11 |
--| Kavita Rao    | 1998-06-08    |                  6 |
--| Rohit Gupta   | 1996-10-25    |                 10 |
--| Rahul Singh   | 1995-12-05    |                 12 |
--+---------------+---------------+--------------------+
--12 rows in set (0.00 sec)



---

### Q4. MONTH()

Find employees whose **attendance month is August** using `MONTH()`.


mysql> select employee_name from attendance where MONTH(attendance_date) = 8;

--+---------------+
--| employee_name |
--+---------------+
--| Amit Sharma   |
--| Priya Verma   |
--| Rahul Singh   |
--| Neha Patel    |
--| Vikas Mehta   |
--| Amit Sharma   |
--| Sneha Joshi   |
--| Priya Verma   |
--| Arjun Kapoor  |
--| Kavita Rao    |
--| Rohit Gupta   |
--| Rahul Singh   |
--+---------------+
--12 rows in set (0.00 sec)



---

### Q5. YEAR()

Display `employee_name`, `joining_date`, and the **year in which the employee joined**.


mysql> SELECT employee_name, joining_date, YEAR(joining_date) AS year_of_joining from attendance;


--+---------------+--------------+-----------------+
--| employee_name | joining_date | year_of_joining |
--+---------------+--------------+-----------------+
--| Amit Sharma   | 2022-06-20   |            2022 |
--| Priya Verma   | 2021-04-12   |            2021 |
--| Rahul Singh   | 2020-01-15   |            2020 |
--| Neha Patel    | 2023-02-10   |            2023 |
--| Vikas Mehta   | 2021-08-05   |            2021 |
--| Amit Sharma   | 2022-06-20   |            2022 |
--| Sneha Joshi   | 2023-07-17   |            2023 |
--| Priya Verma   | 2021-04-12   |            2021 |
--| Arjun Kapoor  | 2019-09-23   |            2019 |
--| Kavita Rao    | 2022-11-14   |            2022 |
--| Rohit Gupta   | 2020-05-18   |            2020 |
--| Rahul Singh   | 2020-01-15   |            2020 |
--+---------------+--------------+-----------------+
--12 rows in set (0.00 sec)



---

### Q6. YEAR()

Find employees whose **attendance records belong to the year 2026**.


mysql> select employee_name from attendance where YEAR(attendance_date) = 2026 ;

--+---------------+
--| employee_name |
--+---------------+
--| Amit Sharma   |
--| Priya Verma   |
--| Rahul Singh   |
--| Neha Patel    |
--| Vikas Mehta   |
--| Amit Sharma   |
--| Sneha Joshi   |
--| Priya Verma   |
--| Arjun Kapoor  |
--| Kavita Rao    |
--| Rohit Gupta   |
--| Rahul Singh   |
--+---------------+
--12 rows in set (0.00 sec)


---


### Q7. QUARTER()

Display `employee_name`, `joining_date`, and the **quarter in which the employee joined** using `QUARTER()`.



mysql> select employee_name, joining_date, QUARTER(joining_date) as joined_quarter from attendance;


--+---------------+--------------+----------------+
--| employee_name | joining_date | joined_quarter |
--+---------------+--------------+----------------+
--| Amit Sharma   | 2022-06-20   |              2 |
--| Priya Verma   | 2021-04-12   |              2 |
--| Rahul Singh   | 2020-01-15   |              1 |
--| Neha Patel    | 2023-02-10   |              1 |
--| Vikas Mehta   | 2021-08-05   |              3 |
--| Amit Sharma   | 2022-06-20   |              2 |
--| Sneha Joshi   | 2023-07-17   |              3 |
--| Priya Verma   | 2021-04-12   |              2 |
--| Arjun Kapoor  | 2019-09-23   |              3 |
--| Kavita Rao    | 2022-11-14   |              4 |
--| Rohit Gupta   | 2020-05-18   |              2 |
--| Rahul Singh   | 2020-01-15   |              1 |
--+---------------+--------------+----------------+
--12 rows in set (0.00 sec)



---

### Q8. WEEK()

Display `employee_name`, `attendance_date`, and the **week number of their attendance date** using `WEEK()`.



mysql> select employee_name, attendance_date, WEEK(attendance_date) as week_number from attendance;


--+---------------+-----------------+-------------+
--| employee_name | attendance_date | week_number |
--+---------------+-----------------+-------------+
--| Amit Sharma   | 2026-08-25      |          34 |
--| Priya Verma   | 2026-08-25      |          34 |
--| Rahul Singh   | 2026-08-26      |          34 |
--| Neha Patel    | 2026-08-26      |          34 |
--| Vikas Mehta   | 2026-08-27      |          34 |
--| Amit Sharma   | 2026-08-28      |          34 |
--| Sneha Joshi   | 2026-08-28      |          34 |
--| Priya Verma   | 2026-08-29      |          34 |
--| Arjun Kapoor  | 2026-08-29      |          34 |
--| Kavita Rao    | 2026-08-30      |          35 |
--| Rohit Gupta   | 2026-08-30      |          35 |
--| Rahul Singh   | 2026-08-31      |          35 |
--+---------------+-----------------+-------------+
--12 rows in set (0.00 sec)



---

### Q9. DAYOFWEEK()

Display `employee_name`, `attendance_date`, and the **weekday number** of their attendance date using `DAYOFWEEK()`.


mysql> select employee_name, attendance_date, DAYOFWEEK(attendance_date) as week_day_number from attendance;



--+---------------+-----------------+-----------------+
--| employee_name | attendance_date | week_day_number |
--+---------------+-----------------+-----------------+
--| Amit Sharma   | 2026-08-25      |               3 |
--| Priya Verma   | 2026-08-25      |               3 |
--| Rahul Singh   | 2026-08-26      |               4 |
--| Neha Patel    | 2026-08-26      |               4 |
--| Vikas Mehta   | 2026-08-27      |               5 |
--| Amit Sharma   | 2026-08-28      |               6 |
--| Sneha Joshi   | 2026-08-28      |               6 |
--| Priya Verma   | 2026-08-29      |               7 |
--| Arjun Kapoor  | 2026-08-29      |               7 |
--| Kavita Rao    | 2026-08-30      |               1 |
--| Rohit Gupta   | 2026-08-30      |               1 |
--| Rahul Singh   | 2026-08-31      |               2 |
--+---------------+-----------------+-----------------+
--12 rows in set (0.00 sec)




---

### Q10. DAYOFWEEK()

Find attendance records where the employee attended on a **Saturday or Sunday**.


mysql> select employee_name from attendance where DAYOFWEEK(attendance_date) = 6 OR  DAYOFWEEK(attendance_date) = 7;


--+---------------+
--| employee_name |
--+---------------+
--| Amit Sharma   |
--| Sneha Joshi   |
--| Priya Verma   |
--| Arjun Kapoor  |
--+---------------+
--4 rows in set (0.00 sec)


---

# 🟡 Date Name Functions

### Q11. MONTHNAME()

Display `employee_name`, `joining_date`, and the **name of the joining month** using `MONTHNAME()`.



mysql> select employee_name, joining_date, MONTHNAME(joining_date) as joining_month from attendance;


--+---------------+--------------+---------------+
--| employee_name | joining_date | joining_month |
--+---------------+--------------+---------------+
--| Amit Sharma   | 2022-06-20   | June          |
--| Priya Verma   | 2021-04-12   | April         |
--| Rahul Singh   | 2020-01-15   | January       |
--| Neha Patel    | 2023-02-10   | February      |
--| Vikas Mehta   | 2021-08-05   | August        |
--| Amit Sharma   | 2022-06-20   | June          |
--| Sneha Joshi   | 2023-07-17   | July          |
--| Priya Verma   | 2021-04-12   | April         |
--| Arjun Kapoor  | 2019-09-23   | September     |
--| Kavita Rao    | 2022-11-14   | November      |
--| Rohit Gupta   | 2020-05-18   | May           |
--| Rahul Singh   | 2020-01-15   | January       |
--+---------------+--------------+---------------+
--12 rows in set (0.00 sec)




---

### Q12. DAYNAME()

Display `employee_name`, `attendance_date`, and the **name of the attendance day** using `DAYNAME()`.


mysql> select employee_name, attendance_date, DAYNAME(attendance_date) AS attendance_day from attendance;


--+---------------+-----------------+----------------+
--| employee_name | attendance_date | attendance_day |
--+---------------+-----------------+----------------+
--| Amit Sharma   | 2026-08-25      | Tuesday        |
--| Priya Verma   | 2026-08-25      | Tuesday        |
--| Rahul Singh   | 2026-08-26      | Wednesday      |
--| Neha Patel    | 2026-08-26      | Wednesday      |
--| Vikas Mehta   | 2026-08-27      | Thursday       |
--| Amit Sharma   | 2026-08-28      | Friday         |
--| Sneha Joshi   | 2026-08-28      | Friday         |
--| Priya Verma   | 2026-08-29      | Saturday       |
--| Arjun Kapoor  | 2026-08-29      | Saturday       |
--| Kavita Rao    | 2026-08-30      | Sunday         |
--| Rohit Gupta   | 2026-08-30      | Sunday         |
--| Rahul Singh   | 2026-08-31      | Monday         |
--+---------------+-----------------+----------------+
--12 rows in set (0.00 sec)



---

### Q13. MONTHNAME()

Display `employee_name`, `date_of_birth`, and the **name of the birth month**.


mysql> select employee_name, date_of_birth, MONTHNAME(date_of_birth) AS birth_month_name from attendance;



--+---------------+---------------+------------------+
--| employee_name | date_of_birth | birth_month_name |
--+---------------+---------------+------------------+
--| Amit Sharma   | 1998-03-15    | March            |
--| Priya Verma   | 1997-07-22    | July             |
--| Rahul Singh   | 1995-12-05    | December         |
--| Neha Patel    | 1999-09-18    | September        |
--| Vikas Mehta   | 1996-01-28    | January          |
--| Amit Sharma   | 1998-03-15    | March            |
--| Sneha Joshi   | 2000-05-11    | May              |
--| Priya Verma   | 1997-07-22    | July             |
--| Arjun Kapoor  | 1994-11-30    | November         |
--| Kavita Rao    | 1998-06-08    | June             |
--| Rohit Gupta   | 1996-10-25    | October          |
--| Rahul Singh   | 1995-12-05    | December         |
--+---------------+---------------+------------------+
--12 rows in set (0.00 sec)




---

### Q14. DAYNAME()

Find employees whose attendance occurred on a **Monday**.


mysql> select employee_name from attendance where DAYNAME(attendance_date) = 'monday';


--+---------------+
--| employee_name |
--+---------------+
--| Rahul Singh   |
--+---------------+
--1 row in set (0.00 sec)



---

### Q15. DAYNAME() + MONTHNAME()

Display `employee_name`, `attendance_date`, **day name**, and **month name**.


mysql> select employee_name, attendance_date, DAYNAME(attendance_date) AS day_name, MONTHNAME(attendance_date) as month_name from attendance;


--+---------------+-----------------+-----------+------------+
--| employee_name | attendance_date | day_name  | month_name |
--+---------------+-----------------+-----------+------------+
--| Amit Sharma   | 2026-08-25      | Tuesday   | August     |
--| Priya Verma   | 2026-08-25      | Tuesday   | August     |
--| Rahul Singh   | 2026-08-26      | Wednesday | August     |
--| Neha Patel    | 2026-08-26      | Wednesday | August     |
--| Vikas Mehta   | 2026-08-27      | Thursday  | August     |
--| Amit Sharma   | 2026-08-28      | Friday    | August     |
--| Sneha Joshi   | 2026-08-28      | Friday    | August     |
--| Priya Verma   | 2026-08-29      | Saturday  | August     |
--| Arjun Kapoor  | 2026-08-29      | Saturday  | August     |
--| Kavita Rao    | 2026-08-30      | Sunday    | August     |
--| Rohit Gupta   | 2026-08-30      | Sunday    | August     |
--| Rahul Singh   | 2026-08-31      | Monday    | August     |
--+---------------+-----------------+-----------+------------+
--12 rows in set (0.00 sec)



---

# 🔵 Current Date & Time Functions

### Q16. CURDATE()

Display the **current date** using `CURDATE()`.


mysql> select CURDATE() as curr_date;


--+------------+
--| curr_date  |
--+------------+
--| 2026-09-05 |
--+------------+
--1 row in set (0.00 sec)



---

### Q17. CURRENT_DATE()

Display the current date using `CURRENT_DATE()`.


mysql> SELECT CURRENT_DATE() AS curr_date;

--+------------+
--| curr_date  |
--+------------+
--| 2026-09-05 |
--+------------+
--1 row in set (0.00 sec)


---

### Q18. NOW()

Display the **current date and time** using `NOW()`.


mysql> SELECT NOW() as curr_date_time;


--+---------------------+
--| curr_date_time      |
--+---------------------+
--| 2026-09-05 23:41:41 |
--+---------------------+
--1 row in set (0.00 sec)


---

### Q19. CURRENT_TIMESTAMP()

Display the **current date and time** using `CURRENT_TIMESTAMP()`.


mysql> select CURRENT_TIMESTAMP AS curr_date_time;

--+---------------------+
--| curr_date_time      |
--+---------------------+
--| 2026-09-05 23:42:32 |
--+---------------------+
--1 row in set (0.00 sec)



---

### Q20. NOW() vs CURRENT_TIMESTAMP()

Display both `NOW()` and `CURRENT_TIMESTAMP()` in the same query and observe the result.


mysql> select NOW() as use_now, CURRENT_TIMESTAMP() AS use_timestamp;

--+---------------------+---------------------+
--| use_now             | use_timestamp       |
--+---------------------+---------------------+
--| 2026-09-05 23:44:00 | 2026-09-05 23:44:00 |
--+---------------------+---------------------+
--1 row in set (0.00 sec)


---

### Q21. CURTIME()

Display the **current time** using `CURTIME()`.


mysql> select CURTIME() AS curr_time;

--+-----------+
--| curr_time |
--+-----------+
--| 23:45:20  |
--+-----------+
1 row in set (0.00 sec)


---

### Q22. CURRENT_TIME()

Display the current time using `CURRENT_TIME()`.

mysql> select CURRENT_TIME() AS curr_time;

--+-----------+
--| curr_time |
--+-----------+
--| 23:46:13  |
--+-----------+
--1 row in set (0.00 sec)



---

### Q23. Date and Time Components

Display the **current date, current time, and current date-time** using appropriate MySQL functions.


mysql> select CURDATE(), CURTIME(), CURRENT_TIMESTAMP();

--+------------+-----------+---------------------+
--| CURDATE()  | CURTIME() | CURRENT_TIMESTAMP() |
--+------------+-----------+---------------------+
--| 2026-09-05 | 23:48:38  | 2026-09-05 23:48:38 |
--+------------+-----------+---------------------+
--1 row in set (0.00 sec)


---

# 🟠 EXTRACT() Function

### Q24. EXTRACT()

Extract the **year** from `joining_date`.

mysql> SELECT EXTRACT(YEAR  FROM joining_date) AS year from attendance;

--+------+
--| year |
--+------+
--| 2022 |
--| 2021 |
--| 2020 |
--| 2023 |
--| 2021 |
--| 2022 |
--| 2023 |
--| 2021 |
--| 2019 |
--| 2022 |
--| 2020 |
--| 2020 |
--+------+
--12 rows in set (0.00 sec)


---

### Q25. EXTRACT()

Extract the **month** from `date_of_birth`.

mysql> SELECT EXTRACT(MONTH  FROM date_of_birth) AS month from attendance;

--+------+
--| month |
--+------+
--|    3 |
--|    7 |
--|   12 |
--|    9 |
--|    1 |
--|    3 |
--|    5 |
--|    7 |
--|   11 |
--|    6 |
--|   10 |
--|   12 |
--+------+
--12 rows in set (0.00 sec)


---

### Q26. EXTRACT()

Extract the **day** from `attendance_date`.

mysql> SELECT attendance_date, EXTRACT(DAY  FROM attendance_date) AS day from attendance;


--+-----------------+------+
--| attendance_date | day  |
--+-----------------+------+
--| 2026-08-25      |   25 |
--| 2026-08-25      |   25 |
--| 2026-08-26      |   26 |
--| 2026-08-26      |   26 |
--| 2026-08-27      |   27 |
--| 2026-08-28      |   28 |
--| 2026-08-28      |   28 |
--| 2026-08-29      |   29 |
--| 2026-08-29      |   29 |
--| 2026-08-30      |   30 |
--| 2026-08-30      |   30 |
--| 2026-08-31      |   31 |
--+-----------------+------+
--12 rows in set (0.00 sec)


---

### Q27. EXTRACT()

Extract the **hour** from `login_time`.


mysql> SELECT EXTRACT(HOUR  FROM login_time) AS login_time from attendance;

--+------------+
--| login_time |
--+------------+
--|          9 |
--|          9 |
--|          9 |
--|          9 |
--|          9 |
--|          9 |
--|         10 |
--|          9 |
--|          8 |
--|          9 |
--|          9 |
--|          9 |
--+------------+
--12 rows in set (0.00 sec)


---

### Q28. EXTRACT()

Extract the **minute** from `login_time`.

mysql> SELECT TIME(login_time) AS LOGIN_TIME, EXTRACT(MINUTE  FROM login_time) AS login_min from attendance;


--+------------+-----------+
--| LOGIN_TIME | login_min |
--+------------+-----------+
--| 09:42:15   |        42 |
--| 09:15:20   |        15 |
--| 09:05:45   |         5 |
--| 09:55:10   |        55 |
--| 09:10:05   |        10 |
--| 09:25:35   |        25 |
--| 10:35:50   |        35 |
--| 09:05:15   |         5 |
--| 08:55:25   |        55 |
--| 09:50:35   |        50 |
--| 09:20:10   |        20 |
--| 09:35:40   |        35 |
--+------------+-----------+
--12 rows in set (0.00 sec)



---

### Q29. EXTRACT()

Extract the **second** from `login_time`.


mysql> SELECT EXTRACT(SECOND  FROM login_time) AS login_sec from attendance;

--+-----------+
--| login_sec |
--+-----------+
--|        15 |
--|        20 |
--|        45 |
--|        10 |
--|         5 |
--|        35 |
--|        50 |
--|        15 |
--|        25 |
--|        35 |
--|        10 |
--|        40 |
--+-----------+
--12 rows in set (0.00 sec)



---

# 🟣 Date Addition & Subtraction

### Q30. DATE_ADD()

Calculate the date that occurs **30 days after each employees joining date**.

mysql> SELECT joining_date, DATE_ADD(joining_date, INTERVAL 30 DAY) AS 30_latter from attendance;

--+--------------+------------+
--| joining_date | 30_latter  |
--+--------------+------------+
--| 2022-06-20   | 2022-07-20 |
--| 2021-04-12   | 2021-05-12 |
--| 2020-01-15   | 2020-02-14 |
--| 2023-02-10   | 2023-03-12 |
--| 2021-08-05   | 2021-09-04 |
--| 2022-06-20   | 2022-07-20 |
--| 2023-07-17   | 2023-08-16 |
--| 2021-04-12   | 2021-05-12 |
--| 2019-09-23   | 2019-10-23 |
--| 2022-11-14   | 2022-12-14 |
--| 2020-05-18   | 2020-06-17 |
--| 2020-01-15   | 2020-02-14 |
--+--------------+------------+
--12 rows in set (0.00 sec)

---

### Q31. DATE_ADD()



--+--------------+----------------+
--| joining_date | first_work_any |
--+--------------+----------------+
--| Calculate the **first work anniversary** of every employee.

mysql> SELECT joining_date, DATE_ADD(joining_date, INTERVAL 1 year) AS first_work_any from attendance;


--+--------------+----------------+
--| joining_date | first_work_any |
--+--------------+----------------+
--| 2022-06-20   | 2023-06-20     |
--| 2021-04-12   | 2022-04-12     |
--| 2020-01-15   | 2021-01-15     |
--| 2023-02-10   | 2024-02-10     |
--| 2021-08-05   | 2022-08-05     |
--| 2022-06-20   | 2023-06-20     |
--| 2023-07-17   | 2024-07-17     |
--| 2021-04-12   | 2022-04-12     |
--| 2019-09-23   | 2020-09-23     |
--| 2022-11-14   | 2023-11-14     |
--| 2020-05-18   | 2021-05-18     |
--| 2020-01-15   | 2021-01-15     |
--+--------------+----------------+
--12 rows in set (0.00 sec)


---

### Q32. DATE_ADD()

Calculate the date exactly **3 months after each employees project start date**.

mysql> select DATE(project_start_date), DATE_ADD(DATE(project_start_date), INTERVAL 3 MONTH) AS after_3_month from attendance;


--+--------------------------+---------------+
--| DATE(project_start_date) | after_3_month |
--+--------------------------+---------------+
--| 2025-01-10               | 2025-04-10    |
--| 2024-11-05               | 2025-02-05    |
--| 2024-06-18               | 2024-09-18    |
--| 2025-03-01               | 2025-06-01    |
--| 2025-02-20               | 2025-05-20    |
--| 2025-01-10               | 2025-04-10    |
--| 2025-05-12               | 2025-08-12    |
--| 2024-11-05               | 2025-02-05    |
--| 2023-12-04               | 2024-03-04    |
--| 2025-04-15               | 2025-07-15    |
--| 2024-08-22               | 2024-11-22    |
--| 2024-06-18               | 2024-09-18    |
--+--------------------------+---------------+
--12 rows in set (0.00 sec)


---

### Q33. DATE_SUB()

Calculate the date **30 days before each attendance date**.


mysql> SELECT attendance_date, DATE_SUB(attendance_date, INTERVAL 30 DAY) AS 30_day_before from attendance;

--+-----------------+---------------+
--| attendance_date | 30_day_before |
--+-----------------+---------------+
--| 2026-08-25      | 2026-07-26    |
--| 2026-08-25      | 2026-07-26    |
--| 2026-08-26      | 2026-07-27    |
--| 2026-08-26      | 2026-07-27    |
--| 2026-08-27      | 2026-07-28    |
--| 2026-08-28      | 2026-07-29    |
--| 2026-08-28      | 2026-07-29    |
--| 2026-08-29      | 2026-07-30    |
--| 2026-08-29      | 2026-07-30    |
--| 2026-08-30      | 2026-07-31    |
--| 2026-08-30      | 2026-07-31    |
--| 2026-08-31      | 2026-08-01    |
--+-----------------+---------------+
--12 rows in set (0.00 sec)


---

### Q34. DATE_SUB()

Calculate the date **1 year before each employees joining date**.

mysql> SELECT joining_date, DATE_SUB(joining_date, INTERVAL 1 year) AS 1_year_before from attendance;


--+--------------+---------------+
--| joining_date | 1_year_before |
--+--------------+---------------+
--| 2022-06-20   | 2021-06-20    |
--| 2021-04-12   | 2020-04-12    |
--| 2020-01-15   | 2019-01-15    |
--| 2023-02-10   | 2022-02-10    |
--| 2021-08-05   | 2020-08-05    |
--| 2022-06-20   | 2021-06-20    |
--| 2023-07-17   | 2022-07-17    |
--| 2021-04-12   | 2020-04-12    |
--| 2019-09-23   | 2018-09-23    |
--| 2022-11-14   | 2021-11-14    |
--| 2020-05-18   | 2019-05-18    |
--| 2020-01-15   | 2019-01-15    |
--+--------------+---------------+
--12 rows in set (0.00 sec)


---

### Q35. DATE_ADD()

Assuming the companys retirement age is **60 years**, calculate the expected retirement date of every employee.


mysql> SELECT joining_date, DATE_ADD(joining_date, INTERVAL 60 year) AS retirement_year from attendance;


--+--------------+-----------------+
--| joining_date | retirement_year |
--+--------------+-----------------+
--| 2022-06-20   | 2082-06-20      |
--| 2021-04-12   | 2081-04-12      |
--| 2020-01-15   | 2080-01-15      |
--| 2023-02-10   | 2083-02-10      |
--| 2021-08-05   | 2081-08-05      |
--| 2022-06-20   | 2082-06-20      |
--| 2023-07-17   | 2083-07-17      |
--| 2021-04-12   | 2081-04-12      |
--| 2019-09-23   | 2079-09-23      |
--| 2022-11-14   | 2082-11-14      |
--| 2020-05-18   | 2080-05-18      |
--| 2020-01-15   | 2080-01-15      |
--+--------------+-----------------+
--12 rows in set (0.00 sec)

---

# 🔴 Date Difference Functions

### Q36. DATEDIFF()

Calculate the **number of days between the employees joining date and attendance date**.


mysql> select joining_date, attendance_date, abs(DATEDIFF(joining_date, attendance_date)) AS num_day from attendance;

--+--------------+-----------------+---------+
--| joining_date | attendance_date | num_day |
--+--------------+-----------------+---------+
--| 2022-06-20   | 2026-08-25      |    1527 |
--| 2021-04-12   | 2026-08-25      |    1961 |
--| 2020-01-15   | 2026-08-26      |    2415 |
--| 2023-02-10   | 2026-08-26      |    1293 |
--| 2021-08-05   | 2026-08-27      |    1848 |
--| 2022-06-20   | 2026-08-28      |    1530 |
--| 2023-07-17   | 2026-08-28      |    1138 |
--| 2021-04-12   | 2026-08-29      |    1965 |
--| 2019-09-23   | 2026-08-29      |    2532 |
--| 2022-11-14   | 2026-08-30      |    1385 |
--| 2020-05-18   | 2026-08-30      |    2295 |
--| 2020-01-15   | 2026-08-31      |    2420 |
--+--------------+-----------------+---------+
--12 rows in set (0.00 sec)


---

### Q37. DATEDIFF()

Calculate the **number of days between the employees joining date and the current date**.

mysql> select joining_date, curdate(), abs(DATEDIFF(joining_date, curdate())) AS num_day from attendance;

--+--------------+------------+---------+
--| joining_date | curdate()  | num_day |
--+--------------+------------+---------+
--| 2022-06-20   | 2026-09-06 |    1539 |
--| 2021-04-12   | 2026-09-06 |    1973 |
--| 2020-01-15   | 2026-09-06 |    2426 |
--| 2023-02-10   | 2026-09-06 |    1304 |
--| 2021-08-05   | 2026-09-06 |    1858 |
--| 2022-06-20   | 2026-09-06 |    1539 |
--| 2023-07-17   | 2026-09-06 |    1147 |
--| 2021-04-12   | 2026-09-06 |    1973 |
--| 2019-09-23   | 2026-09-06 |    2540 |
--| 2022-11-14   | 2026-09-06 |    1392 |
--| 2020-05-18   | 2026-09-06 |    2302 |
--| 2020-01-15   | 2026-09-06 |    2426 |
--+--------------+------------+---------+
--12 rows in set (0.00 sec)


---

### Q38. TIMESTAMPDIFF()

Calculate the approximate **number of completed years of experience** of every employee based on their joining date.

mysql> SELECT joining_date, date(current_timestamp), TIMESTAMPDIFF(YEAR, joining_date, current_timestamp) as experience from attendance;

--+--------------+-------------------------+------------+
--| joining_date | date(current_timestamp) | experience |
--+--------------+-------------------------+------------+
--| 2022-06-20   | 2026-09-06              |          4 |
--| 2021-04-12   | 2026-09-06              |          5 |
--| 2020-01-15   | 2026-09-06              |          6 |
--| 2023-02-10   | 2026-09-06              |          3 |
--| 2021-08-05   | 2026-09-06              |          5 |
--| 2022-06-20   | 2026-09-06              |          4 |
--| 2023-07-17   | 2026-09-06              |          3 |
--| 2021-04-12   | 2026-09-06              |          5 |
--| 2019-09-23   | 2026-09-06              |          6 |
--| 2022-11-14   | 2026-09-06              |          3 |
--| 2020-05-18   | 2026-09-06              |          6 |
--| 2020-01-15   | 2026-09-06              |          6 |
--+--------------+-------------------------+------------+
--12 rows in set (0.00 sec)



---

### Q39. TIMESTAMPDIFF()

Calculate the approximate **age of every employee** using their date of birth.


mysql> SELECT date_of_birth, date(current_timestamp), TIMESTAMPDIFF(YEAR, date_of_birth, current_timestamp) as app_age from attendance;

--+---------------+-------------------------+---------+
--| date_of_birth | date(current_timestamp) | app_age |
--+---------------+-------------------------+---------+
--| 1998-03-15    | 2026-09-06              |      28 |
--| 1997-07-22    | 2026-09-06              |      29 |
--| 1995-12-05    | 2026-09-06              |      30 |
--| 1999-09-18    | 2026-09-06              |      26 |
--| 1996-01-28    | 2026-09-06              |      30 |
--| 1998-03-15    | 2026-09-06              |      28 |
--| 2000-05-11    | 2026-09-06              |      26 |
--| 1997-07-22    | 2026-09-06              |      29 |
--| 1994-11-30    | 2026-09-06              |      31 |
--| 1998-06-08    | 2026-09-06              |      28 |
--| 1996-10-25    | 2026-09-06              |      29 |
--| 1995-12-05    | 2026-09-06              |      30 |
--+---------------+-------------------------+---------+
--12 rows in set (0.00 sec)



---

### Q40. TIMESTAMPDIFF()

Calculate the total **working hours** between `login_time` and `logout_time`.

mysql> SELECT login_time, logout_time, TIMESTAMPDIFF(HOUR, login_time,  logout_time) as working_hours from attendance;


--+---------------------+---------------------+---------------+
--| login_time          | logout_time         | working_hours |
--+---------------------+---------------------+---------------+
--| 2026-08-25 09:42:15 | 2026-08-25 18:05:30 |             8 |
--| 2026-08-25 09:15:20 | 2026-08-25 17:45:10 |             8 |
--| 2026-08-26 09:05:45 | 2026-08-26 18:20:15 |             9 |
--| 2026-08-26 09:55:10 | 2026-08-26 18:10:25 |             8 |
--| 2026-08-27 09:10:05 | 2026-08-27 18:30:45 |             9 |
--| 2026-08-28 09:25:35 | 2026-08-28 18:15:20 |             8 |
--| 2026-08-28 10:35:50 | 2026-08-28 19:05:30 |             8 |
--| 2026-08-29 09:05:15 | 2026-08-29 17:50:40 |             8 |
--| 2026-08-29 08:55:25 | 2026-08-29 17:35:10 |             8 |
--| 2026-08-30 09:50:35 | 2026-08-30 18:25:55 |             8 |
--| 2026-08-30 09:20:10 | 2026-08-30 18:40:25 |             9 |
--| 2026-08-31 09:35:40 | 2026-08-31 18:05:15 |             8 |
--+---------------------+---------------------+---------------+
--12 rows in set (0.00 sec)



---

### Q41. TIMESTAMPDIFF()

Calculate the total **working minutes** between `login_time` and `logout_time`.

mysql> SELECT login_time, logout_time, TIMESTAMPDIFF(minute, login_time,  logout_time) as working_minutes from attendance;

--+---------------------+---------------------+-----------------+
--| login_time          | logout_time         | working_minutes |
--+---------------------+---------------------+-----------------+
--| 2026-08-25 09:42:15 | 2026-08-25 18:05:30 |             503 |
--| 2026-08-25 09:15:20 | 2026-08-25 17:45:10 |             509 |
--| 2026-08-26 09:05:45 | 2026-08-26 18:20:15 |             554 |
--| 2026-08-26 09:55:10 | 2026-08-26 18:10:25 |             495 |
--| 2026-08-27 09:10:05 | 2026-08-27 18:30:45 |             560 |
--| 2026-08-28 09:25:35 | 2026-08-28 18:15:20 |             529 |
--| 2026-08-28 10:35:50 | 2026-08-28 19:05:30 |             509 |
--| 2026-08-29 09:05:15 | 2026-08-29 17:50:40 |             525 |
--| 2026-08-29 08:55:25 | 2026-08-29 17:35:10 |             519 |
--| 2026-08-30 09:50:35 | 2026-08-30 18:25:55 |             515 |
--| 2026-08-30 09:20:10 | 2026-08-30 18:40:25 |             560 |
--| 2026-08-31 09:35:40 | 2026-08-31 18:05:15 |             509 |
--+---------------------+---------------------+-----------------+
--12 rows in set (0.00 sec)


---

### Q42. TIMEDIFF()

Calculate the **working duration** between `login_time` and `logout_time` using `TIMEDIFF()`.

mysql> SELECT login_time,
    ->        logout_time,
    ->        TIMEDIFF(logout_time, login_time) AS working_duration
    -> FROM attendance;


--+---------------------+---------------------+------------------+
--| login_time          | logout_time         | working_duration |
--+---------------------+---------------------+------------------+
--| 2026-08-25 09:42:15 | 2026-08-25 18:05:30 | 08:23:15         |
--| 2026-08-25 09:15:20 | 2026-08-25 17:45:10 | 08:29:50         |
--| 2026-08-26 09:05:45 | 2026-08-26 18:20:15 | 09:14:30         |
--| 2026-08-26 09:55:10 | 2026-08-26 18:10:25 | 08:15:15         |
--| 2026-08-27 09:10:05 | 2026-08-27 18:30:45 | 09:20:40         |
--| 2026-08-28 09:25:35 | 2026-08-28 18:15:20 | 08:49:45         |
--| 2026-08-28 10:35:50 | 2026-08-28 19:05:30 | 08:29:40         |
--| 2026-08-29 09:05:15 | 2026-08-29 17:50:40 | 08:45:25         |
--| 2026-08-29 08:55:25 | 2026-08-29 17:35:10 | 08:39:45         |
--| 2026-08-30 09:50:35 | 2026-08-30 18:25:55 | 08:35:20         |
--| 2026-08-30 09:20:10 | 2026-08-30 18:40:25 | 09:20:15         |
--| 2026-08-31 09:35:40 | 2026-08-31 18:05:15 | 08:29:35         |
--+---------------------+---------------------+------------------+
--12 rows in set (0.00 sec)


---

# 🟤 Date & Time Formatting

### Q43. DATE()

Display `employee_name`, `project_start_date`, and only the **date portion** of `project_start_date`.


mysql> select employee_name, project_start_date, DATE(project_start_date) AS only_date from attendance;


--+---------------+---------------------+------------+
--| employee_name | project_start_date  | only_date  |
--+---------------+---------------------+------------+
--| Amit Sharma   | 2025-01-10 09:30:00 | 2025-01-10 |
--| Priya Verma   | 2024-11-05 10:00:00 | 2024-11-05 |
--| Rahul Singh   | 2024-06-18 08:45:00 | 2024-06-18 |
--| Neha Patel    | 2025-03-01 11:15:00 | 2025-03-01 |
--| Vikas Mehta   | 2025-02-20 09:00:00 | 2025-02-20 |
--| Amit Sharma   | 2025-01-10 09:30:00 | 2025-01-10 |
--| Sneha Joshi   | 2025-05-12 10:30:00 | 2025-05-12 |
--| Priya Verma   | 2024-11-05 10:00:00 | 2024-11-05 |
--| Arjun Kapoor  | 2023-12-04 08:30:00 | 2023-12-04 |
--| Kavita Rao    | 2025-04-15 09:45:00 | 2025-04-15 |
--| Rohit Gupta   | 2024-08-22 10:15:00 | 2024-08-22 |
--| Rahul Singh   | 2024-06-18 08:45:00 | 2024-06-18 |
--+---------------+---------------------+------------+
--12 rows in set (0.00 sec)


---

### Q44. TIME()

Display `employee_name`, `login_time`, and only the **time portion** of `login_time`.


mysql> select employee_name, login_time, TIME(login_time) AS only_time from attendance;

--+---------------+---------------------+-----------+
--| employee_name | login_time          | only_time |
--+---------------+---------------------+-----------+
--| Amit Sharma   | 2026-08-25 09:42:15 | 09:42:15  |
--| Priya Verma   | 2026-08-25 09:15:20 | 09:15:20  |
--| Rahul Singh   | 2026-08-26 09:05:45 | 09:05:45  |
--| Neha Patel    | 2026-08-26 09:55:10 | 09:55:10  |
--| Vikas Mehta   | 2026-08-27 09:10:05 | 09:10:05  |
--| Amit Sharma   | 2026-08-28 09:25:35 | 09:25:35  |
--| Sneha Joshi   | 2026-08-28 10:35:50 | 10:35:50  |
--| Priya Verma   | 2026-08-29 09:05:15 | 09:05:15  |
--| Arjun Kapoor  | 2026-08-29 08:55:25 | 08:55:25  |
--| Kavita Rao    | 2026-08-30 09:50:35 | 09:50:35  |
--| Rohit Gupta   | 2026-08-30 09:20:10 | 09:20:10  |
--| Rahul Singh   | 2026-08-31 09:35:40 | 09:35:40  |
--+---------------+---------------------+-----------+
--12 rows in set (0.00 sec)



---

### Q45. DATE_FORMAT()

Display the employees joining date in the format:

**DD-MM-YYYY**

Example:

`15-04-2022`


mysql> select joining_date, DATE_FORMAT(joining_date, '%d-%m-%Y') as formate_date from attendance;

--+--------------+--------------+
--| joining_date | formate_date |
--+--------------+--------------+
--| 2022-06-20   | 20-06-2022   |
--| 2021-04-12   | 12-04-2021   |
--| 2020-01-15   | 15-01-2020   |
--| 2023-02-10   | 10-02-2023   |
--| 2021-08-05   | 05-08-2021   |
--| 2022-06-20   | 20-06-2022   |
--| 2023-07-17   | 17-07-2023   |
--| 2021-04-12   | 12-04-2021   |
--| 2019-09-23   | 23-09-2019   |
--| 2022-11-14   | 14-11-2022   |
--| 2020-05-18   | 18-05-2020   |
--| 2020-01-15   | 15-01-2020   |
--+--------------+--------------+
--12 rows in set (0.00 sec)


---

### Q46. DATE_FORMAT()

Display the attendance date in the format:

**DD Month YYYY**

Example:

`05 August 2026`


mysql> select joining_date, DATE_FORMAT(joining_date, '%d %M %Y') as formate_date from attendance;


--+--------------+-------------------+
--| joining_date | formate_date      |
--+--------------+-------------------+
--| 2022-06-20   | 20 June 2022      |
--| 2021-04-12   | 12 April 2021     |
--| 2020-01-15   | 15 January 2020   |
--| 2023-02-10   | 10 February 2023  |
--| 2021-08-05   | 05 August 2021    |
--| 2022-06-20   | 20 June 2022      |
--| 2023-07-17   | 17 July 2023      |
--| 2021-04-12   | 12 April 2021     |
--| 2019-09-23   | 23 September 2019 |
--| 2022-11-14   | 14 November 2022  |
--| 2020-05-18   | 18 May 2020       |
--| 2020-01-15   | 15 January 2020   |
--+--------------+-------------------+
--12 rows in set (0.00 sec)


---

### Q47. DATE_FORMAT()

Display the login time in **12-hour format with AM/PM**.

Example:

`09:30:00 AM`

mysql> select login_time, DATE_FORMAT(login_time, '%H:%i:%s %p') as time  from attendance;

--+---------------------+-------------+
--| login_time          | time        |
--+---------------------+-------------+
--| 2026-08-25 09:42:15 | 09:42:15 AM |
--| 2026-08-25 09:15:20 | 09:15:20 AM |
--| 2026-08-26 09:05:45 | 09:05:45 AM |
--| 2026-08-26 09:55:10 | 09:55:10 AM |
--| 2026-08-27 09:10:05 | 09:10:05 AM |
--| 2026-08-28 09:25:35 | 09:25:35 AM |
--| 2026-08-28 10:35:50 | 10:35:50 AM |
--| 2026-08-29 09:05:15 | 09:05:15 AM |
--| 2026-08-29 08:55:25 | 08:55:25 AM |
--| 2026-08-30 09:50:35 | 09:50:35 AM |
--| 2026-08-30 09:20:10 | 09:20:10 AM |
--| 2026-08-31 09:35:40 | 09:35:40 AM |
--+---------------------+-------------+
--12 rows in set (0.00 sec)

---

# 🟤 Other MySQL Date Functions

### Q48. LAST_DAY()

Display `employee_name`, `joining_date`, and the **last date of the month in which the employee joined**.


mysql> select employee_name, joining_date, LAST_DAY(joining_date) AS last_date_of_month from attendance;

--+---------------+--------------+--------------------+
--| employee_name | joining_date | last_date_of_month |
--+---------------+--------------+--------------------+
--| Amit Sharma   | 2022-06-20   | 2022-06-30         |
--| Priya Verma   | 2021-04-12   | 2021-04-30         |
--| Rahul Singh   | 2020-01-15   | 2020-01-31         |
--| Neha Patel    | 2023-02-10   | 2023-02-28         |
--| Vikas Mehta   | 2021-08-05   | 2021-08-31         |
--| Amit Sharma   | 2022-06-20   | 2022-06-30         |
--| Sneha Joshi   | 2023-07-17   | 2023-07-31         |
--| Priya Verma   | 2021-04-12   | 2021-04-30         |
--| Arjun Kapoor  | 2019-09-23   | 2019-09-30         |
--| Kavita Rao    | 2022-11-14   | 2022-11-30         |
--| Rohit Gupta   | 2020-05-18   | 2020-05-31         |
--| Rahul Singh   | 2020-01-15   | 2020-01-31         |
--+---------------+--------------+--------------------+
--12 rows in set (0.00 sec)



---

### Q49. STR_TO_DATE()

Convert the following strings into MySQL date values using `STR_TO_DATE()`:

```text
'2026-08-15'
'2025-12-25'
'2024-02-29'
```

mysql> SELECT STR_TO_DATE('2026-08-15', '%Y-%m-%e') AS date;

--+------------+
--| date       |
--+------------+
--| 2026-08-15 |
--+------------+
--1 row in set (0.00 sec)


mysql> SELECT STR_TO_DATE('2025-12-25', '%Y-%m-%e') AS date;

--+------------+
--| date       |
--+------------+
--| 2025-12-25 |
--+------------+
--1 row in set (0.00 sec)


mysql> SELECT STR_TO_DATE('2024-02-29', '%Y-%m-%e') AS date;

--+------------+
--| date       |
--+------------+
--| 2024-02-29 |
--+------------+
--1 row in set (0.00 sec)



---

# 🏆 Q50. Final HR Attendance Report

--Prepare a complete attendance report containing:
--
--* Employee Name
--* Department
--* Attendance Date
--* Day Name
--* Login Time
--* Logout Time
--* Working Hours
--* Working Minutes
--* Attendance Status
--* Joining Date
--* Years of Experience
--
--Use appropriate **MySQL Date & Time functions** such as:
--
--`DAYNAME()`, `TIME()`, `TIMESTAMPDIFF()`, `DATE_FORMAT()`, etc.




mysql> SELECT
    ->     employee_name,
    ->     department,
    ->     DATE_FORMAT(attendance_date, '%d-%m-%Y') AS attendance_date,
    ->     DAYNAME(attendance_date) AS day_name,
    ->     TIME(login_time) AS login_time,
    ->     TIME(logout_time) AS logout_time,
    ->     TIMESTAMPDIFF(HOUR, login_time, logout_time) AS working_hours,
    ->     TIMESTAMPDIFF(MINUTE, login_time, logout_time) AS working_minutes,
    ->     attendance_status,
    ->     DATE_FORMAT(joining_date, '%d-%m-%Y') AS joining_date,
    ->     TIMESTAMPDIFF(YEAR, joining_date, CURRENT_TIMESTAMP()) AS years_of_experience
    -> FROM attendance;

+---------------+-------------+-----------------+-----------+------------+-------------+---------------+-----------------+-------------------+--------------+---------------------+
| employee_name | department  | attendance_date | day_name  | login_time | logout_time | working_hours | working_minutes | attendance_status | joining_date | years_of_experience |
+---------------+-------------+-----------------+-----------+------------+-------------+---------------+-----------------+-------------------+--------------+---------------------+
| Amit Sharma   | IT          | 25-08-2026      | Tuesday   | 09:42:15   | 18:05:30    |             8 |             503 | Late              | 20-06-2022   |                   4 |
| Priya Verma   | HR          | 25-08-2026      | Tuesday   | 09:15:20   | 17:45:10    |             8 |             509 | Present           | 12-04-2021   |                   5 |
| Rahul Singh   | Finance     | 26-08-2026      | Wednesday | 09:05:45   | 18:20:15    |             9 |             554 | Present           | 15-01-2020   |                   6 |
| Neha Patel    | Sales       | 26-08-2026      | Wednesday | 09:55:10   | 18:10:25    |             8 |             495 | Late              | 10-02-2023   |                   3 |
| Vikas Mehta   | IT          | 27-08-2026      | Thursday  | 09:10:05   | 18:30:45    |             9 |             560 | Present           | 05-08-2021   |                   5 |
| Amit Sharma   | IT          | 28-08-2026      | Friday    | 09:25:35   | 18:15:20    |             8 |             529 | Present           | 20-06-2022   |                   4 |
| Sneha Joshi   | Marketing   | 28-08-2026      | Friday    | 10:35:50   | 19:05:30    |             8 |             509 | Late              | 17-07-2023   |                   3 |
| Priya Verma   | HR          | 29-08-2026      | Saturday  | 09:05:15   | 17:50:40    |             8 |             525 | Present           | 12-04-2021   |                   5 |
| Arjun Kapoor  | Operations  | 29-08-2026      | Saturday  | 08:55:25   | 17:35:10    |             8 |             519 | Present           | 23-09-2019   |                   6 |
| Kavita Rao    | Finance     | 30-08-2026      | Sunday    | 09:50:35   | 18:25:55    |             8 |             515 | Late              | 14-11-2022   |                   3 |
| Rohit Gupta   | Development | 30-08-2026      | Sunday    | 09:20:10   | 18:40:25    |             9 |             560 | Present           | 18-05-2020   |                   6 |
| Rahul Singh   | Finance     | 31-08-2026      | Monday    | 09:35:40   | 18:05:15    |             8 |             509 | Late              | 15-01-2020   |                   6 |
+---------------+-------------+-----------------+-----------+------------+-------------+---------------+-----------------+-------------------+--------------+---------------------+
12 rows in set (0.00 sec)








“Hip hip hooray! I’m done with my task!”



