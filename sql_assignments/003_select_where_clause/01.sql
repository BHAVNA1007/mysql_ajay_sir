mysql> create database Employee_Management1;
Query OK, 1 row affected (0.03 sec)


mysql> create table employees(Employee_ID int auto_increment primary key, Employee_Name varchar(30), Department char(10), city varchar(20), salary decimal(10,2), Experience tinyint unsigned, age tinyint unsigned, joining date);
Query OK, 0 rows affected (0.05 sec)



mysql> desc  employees;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| Employee_ID   | int              | NO   | PRI | NULL    | auto_increment |
| Employee_Name | varchar(30)      | YES  |     | NULL    |                |
| Department    | char(10)         | YES  |     | NULL    |                |
| city          | varchar(20)      | YES  |     | NULL    |                |
| salary        | decimal(10,2)    | YES  |     | NULL    |                |
| Experience    | tinyint unsigned | YES  |     | NULL    |                |
| age           | tinyint unsigned | YES  |     | NULL    |                |
| joining       | date             | YES  |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)




mysql> insert into  employees(Employee_Name,  Department,  city, salary, Experience, age, joining) values('Bhavna Potphode','IT', 'Indore',70000, 3, 25,'2022-08-18'),
    -> ('Ajay Singh', 'IT', 'Indore', 99000, 6, 35, '2020-08-18'),
    -> ('Umesh Patidar', 'IT', 'Pune', 75000, 2, 22, '2024-07-24'),
    -> ('Kanak Kushwaha', 'Finanace', 'Bangalore', 40000, 3, 22, '2022-01-19'),
    -> ('Mushkan Singh', 'HR', 'Mumbai', 50000, 5, 23, '2021-03-25'),
    -> ('Krishna Dubey', 'Finanace', 'Pune', 65000, 4, 27, '2022-05-13'),
    -> ('Cherry Shahane', 'HR', 'Mumbai', 45000, 3, 35,'2023-11-27'),
    -> ('Cherry Shahane', 'HR', 'Mumbai', 45000, 3, 40, '2023-11-27'),
    -> ('Sneha Shahane', 'Sales', 'Bangalore', 65000, 2, 37, '2024-01-25'),
    -> ('Avni Jaishwal', 'HR', 'Bangalore', 75000, 5, 29, '2021-09-17'),
    -> ('Abhishek Sharma', 'IT', 'Pune', 45000, 3, 34,'2023-04-25'),
    -> ('Anil Yadav', 'IT', 'Mumbai', 80000, 4, 26,'2022-10-28'),
    -> ('Shivani Badwaya', 'Sales', 'Bhopal', 42000, 2, 36,'2021-07-22'),
    -> ('Seema Kewte', 'Sales', 'Bhopal', 47000, 3, 25,'2023-05-12'),
    -> ('Bhumika Thakur', 'Finanace', 'Bhopal', 57000, 4, 30,'2022-03-10'),
    -> ('Hitesh Thakur', 'Salse', 'Indore', 53000, 5, 30,'2021-06-20'),
    -> ('Siya Verma', 'HR', 'Pune', 63000, 4, 29,'2021-03-25');
Query OK, 17 rows affected (0.02 sec)
Records: 17  Duplicates: 0  Warnings: 0




mysql> select * from employees;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
17 rows in set (0.00 sec)





mysql> select * from employees where salary > 60000;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
8 rows in set (0.00 sec)




mysql> select * from employees where salary < 50000;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
6 rows in set (0.00 sec)




mysql> select * from employees where age > 30;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
6 rows in set (0.00 sec)



mysql> select * from employees where Experience >= 5;
+-------------+---------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city      | salary   | Experience | age  | joining    |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
|           2 | Ajay Singh    | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           5 | Mushkan Singh | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|          10 | Avni Jaishwal | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          16 | Hitesh Thakur | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
4 rows in set (0.00 sec)



mysql> select * from employees where Department in('IT', 'Finanace');
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
8 rows in set (0.00 sec)



mysql> select * from employees where Department in('IT', 'HR', 'Sales');
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
13 rows in set (0.00 sec)



mysql> select * from employees where Department not in('IT', 'HR');
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
7 rows in set (0.00 sec)



mysql> select * from employees where city in('Indore', 'Pune');
+-------------+-----------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city   | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune   | 75000.00 |          2 |   22 | 2024-07-24 |
|           6 | Krishna Dubey   | Finanace   | Pune   | 65000.00 |          4 |   27 | 2022-05-13 |
|          11 | Abhishek Sharma | IT         | Pune   | 45000.00 |          3 |   34 | 2023-04-25 |
|          16 | Hitesh Thakur   | Salse      | Indore | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune   | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
7 rows in set (0.00 sec)




mysql> select * from employees where city not in('Indore', 'Mumbai', 'Bhopal');
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
7 rows in set (0.00 sec)




mysql> select * from employees where salary between 40000 and 70000;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
13 rows in set (0.00 sec)



mysql> select * from employees where age between 25 and 35;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
11 rows in set (0.00 sec)




mysql> select * from employees where Experience between 3 and 7;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
14 rows in set (0.00 sec)




mysql> select * from employees where joining between '2022-01-01' and '2025-01-01';
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           7 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   35 | 2023-11-27 |
|           8 | Cherry Shahane  | HR         | Mumbai    | 45000.00 |          3 |   40 | 2023-11-27 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          14 | Seema Kewte     | Sales      | Bhopal    | 47000.00 |          3 |   25 | 2023-05-12 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
11 rows in set (0.00 sec)



mysql> select * from employees where joining < '2023-01-01';
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
11 rows in set (0.00 sec)



mysql> select * from employees where joining > '2024-01-01';
+-------------+---------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city      | salary   | Experience | age  | joining    |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
|           3 | Umesh Patidar | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           9 | Sneha Shahane | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
2 rows in set (0.00 sec)



mysql> select * from employees where joining > '2025-01-01';
Empty set (0.00 sec)



mysql> select * from employees where city = 'Indore' and  Department='IT';
+-------------+-----------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city   | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
2 rows in set (0.00 sec)



mysql> select * from employees where Department='IT' and salary > 70000;
+-------------+---------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city   | salary   | Experience | age  | joining    |
+-------------+---------------+------------+--------+----------+------------+------+------------+
|           2 | Ajay Singh    | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar | IT         | Pune   | 75000.00 |          2 |   22 | 2024-07-24 |
|          12 | Anil Yadav    | IT         | Mumbai | 80000.00 |          4 |   26 | 2022-10-28 |
+-------------+---------------+------------+--------+----------+------------+------+------------+
3 rows in set (0.00 sec)




mysql> select * from employees where salary between 50000 and 90000 and Experience > 4;
+-------------+---------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city      | salary   | Experience | age  | joining    |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
|           5 | Mushkan Singh | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|          10 | Avni Jaishwal | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          16 | Hitesh Thakur | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
3 rows in set (0.00 sec)



mysql> select * from employees where  Department in('IT', 'Finanace') and salary > 60000;
+-------------+-----------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city   | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar   | IT         | Pune   | 75000.00 |          2 |   22 | 2024-07-24 |
|           6 | Krishna Dubey   | Finanace   | Pune   | 65000.00 |          4 |   27 | 2022-05-13 |
|          12 | Anil Yadav      | IT         | Mumbai | 80000.00 |          4 |   26 | 2022-10-28 |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
5 rows in set (0.00 sec)



mysql> select * from employees where joining between '2021-01-01' and '2024-01-01' and salary > 50000;
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          12 | Anil Yadav      | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
|          15 | Bhumika Thakur  | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
|          16 | Hitesh Thakur   | Salse      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
7 rows in set (0.00 sec)




mysql> select * from employees where salary not between 40000 and 70000;
+-------------+---------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city      | salary   | Experience | age  | joining    |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
|           2 | Ajay Singh    | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           3 | Umesh Patidar | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|          10 | Avni Jaishwal | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          12 | Anil Yadav    | IT         | Mumbai    | 80000.00 |          4 |   26 | 2022-10-28 |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
4 rows in set (0.00 sec)




mysql> update employees set Department ='Sales' where  Employee_ID = 16;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from employees where Department not in('IT', 'HR', 'Sales');
+-------------+----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name  | Department | city      | salary   | Experience | age  | joining    |
+-------------+----------------+------------+-----------+----------+------------+------+------------+
|           4 | Kanak Kushwaha | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey  | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|          15 | Bhumika Thakur | Finanace   | Bhopal    | 57000.00 |          4 |   30 | 2022-03-10 |
+-------------+----------------+------------+-----------+----------+------------+------+------------+
3 rows in set (0.00 sec)



mysql> select * from employees where  joining not between '2022-01-01' and '2025-12-31';
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           2 | Ajay Singh      | IT         | Indore    | 99000.00 |          6 |   35 | 2020-08-18 |
|           5 | Mushkan Singh   | HR         | Mumbai    | 50000.00 |          5 |   23 | 2021-03-25 |
|          10 | Avni Jaishwal   | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          13 | Shivani Badwaya | Sales      | Bhopal    | 42000.00 |          2 |   36 | 2021-07-22 |
|          16 | Hitesh Thakur   | Sales      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma      | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
6 rows in set (0.00 sec)




mysql> select * from employees where city in('Indore', 'Pune', 'Bangalore') and salary between 50000 and 90000 and  Experience >= 4;
+-------------+---------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city      | salary   | Experience | age  | joining    |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
|           6 | Krishna Dubey | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|          10 | Avni Jaishwal | HR         | Bangalore | 75000.00 |          5 |   29 | 2021-09-17 |
|          16 | Hitesh Thakur | Sales      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
|          17 | Siya Verma    | HR         | Pune      | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+---------------+------------+-----------+----------+------------+------+------------+
4 rows in set (0.00 sec)




mysql>  select * from employees where city not in('Bhopal', 'Mumbai') and Department <> 'HR' and joining between '2021-01-01' and '2025-12-31';
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city      | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore    | 70000.00 |          3 |   25 | 2022-08-18 |
|           3 | Umesh Patidar   | IT         | Pune      | 75000.00 |          2 |   22 | 2024-07-24 |
|           4 | Kanak Kushwaha  | Finanace   | Bangalore | 40000.00 |          3 |   22 | 2022-01-19 |
|           6 | Krishna Dubey   | Finanace   | Pune      | 65000.00 |          4 |   27 | 2022-05-13 |
|           9 | Sneha Shahane   | Sales      | Bangalore | 65000.00 |          2 |   37 | 2024-01-25 |
|          11 | Abhishek Sharma | IT         | Pune      | 45000.00 |          3 |   34 | 2023-04-25 |
|          16 | Hitesh Thakur   | Sales      | Indore    | 53000.00 |          5 |   30 | 2021-06-20 |
+-------------+-----------------+------------+-----------+----------+------------+------+------------+
7 rows in set (0.00 sec)



mysql> select * from employees where Department in('IT', 'Finanace') and salary > 60000 and age between 25 and 35 and joining > 2022-12-31;
+-------------+-----------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city   | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore | 70000.00 |          3 |   25 | 2022-08-18 |
|           2 | Ajay Singh      | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
|           6 | Krishna Dubey   | Finanace   | Pune   | 65000.00 |          4 |   27 | 2022-05-13 |
|          12 | Anil Yadav      | IT         | Mumbai | 80000.00 |          4 |   26 | 2022-10-28 |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
4 rows in set, 1 warning (0.01 sec)



mysql> select * from employees where Department in('IT', 'Finanace') and salary > 60000 and age between 25 and 35 and joining > '2022-12-31';
Empty set (0.00 sec)




mysql> select * from employees where salary not between 40000 and 75000 and Experience between 2 and 8  and Department <> 'Sales';
+-------------+---------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name | Department | city   | salary   | Experience | age  | joining    |
+-------------+---------------+------------+--------+----------+------------+------+------------+
|           2 | Ajay Singh    | IT         | Indore | 99000.00 |          6 |   35 | 2020-08-18 |
|          12 | Anil Yadav    | IT         | Mumbai | 80000.00 |          4 |   26 | 2022-10-28 |
+-------------+---------------+------------+--------+----------+------------+------+------------+
2 rows in set (0.00 sec)



mysql> select * from employees where city in('Indore', 'Pune') and Department in('IT', 'HR', 'Finanace') and salary between 45000 and 85000 and joining between '2020-01-01' and '2024-12-31';

+-------------+-----------------+------------+--------+----------+------------+------+------------+
| Employee_ID | Employee_Name   | Department | city   | salary   | Experience | age  | joining    |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
|           1 | Bhavna Potphode | IT         | Indore | 70000.00 |          3 |   25 | 2022-08-18 |
|           3 | Umesh Patidar   | IT         | Pune   | 75000.00 |          2 |   22 | 2024-07-24 |
|           6 | Krishna Dubey   | Finanace   | Pune   | 65000.00 |          4 |   27 | 2022-05-13 |
|          11 | Abhishek Sharma | IT         | Pune   | 45000.00 |          3 |   34 | 2023-04-25 |
|          17 | Siya Verma      | HR         | Pune   | 63000.00 |          4 |   29 | 2021-03-25 |
+-------------+-----------------+------------+--------+----------+------------+------+------------+
5 rows in set (0.00 sec)