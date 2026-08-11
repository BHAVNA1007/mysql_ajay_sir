ASSIGNMENT 1 – STUDENT MANAGEMENT SYSTEM

Q1. Create a database named school_db and use the database.

Q2. Create a table named student with:
- student_id – INT, PRIMARY KEY, AUTO_INCREMENT
- student_name – VARCHAR(50)
- age – INT
- course – VARCHAR(50)
- city – VARCHAR(50)
- marks – INT

Q3. Insert the following 10 student records:

student_name | age | course | city | marks
Rahul Sharma | 21 | Python | Indore | 85
Priya Verma | 22 | Java | Bhopal | 78
Amit Singh | 20 | Python | Indore | 92
Neha Patel | 23 | Java | Pune | 81
Rohit Mehta | 21 | Python | Mumbai | 88
Sneha Jain | 22 | Java | Indore | 76
Karan Gupta | 20 | Python | Delhi | 95
Pooja Mishra | 23 | Java | Bhopal | 84
Ankit Tiwari | 21 | Python | Pune | 79
Riya Kapoor | 22 | Java | Mumbai | 91

Q4. Display the structure of the student table using DESC.

Q5. Display all records from the student table.

---------------------------------------------------------------



mysql> create database school_db;

Query OK, 1 row affected (0.01 sec)


mysql> use school_db;

Database changed


mysql> create table student(student_id INT AUTO_INCREMENT PRIMARY KEY,student_name VARCHAR(50), age INT, course VARCHAR(50), city VARCHAR(50),marks INT);

Query OK, 0 rows affected (0.05 sec)


mysql> desc student;

+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| student_id   | int         | NO   | PRI | NULL    | auto_increment |
| student_name | varchar(50) | YES  |     | NULL    |                |
| age          | int         | YES  |     | NULL    |                |
| course       | varchar(50) | YES  |     | NULL    |                |
| city         | varchar(50) | YES  |     | NULL    |                |
| marks        | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
6 rows in set (0.04 sec)



mysql> insert into student(student_name, age, course, city, marks) values('Rahul Sharma', 21, 'Python', 'Indore', 85),('Priya Verma', 22, 'Java', 'Bhopal', 78),('Amit Singh', 20, 'Python', 'Indore', 92),('Neha Patel', 23, 'Java', 'Pune', 81),('Rohit Mehta', 21, 'Python', 'Mumbai', 88),('Sneha Jain',  22, 'Java', 'Indore', 76),('Karan Gupta', 20, 'Python', 'Delhi', 95),('Pooja Mishra', 23, 'Java', 'Bhopal', 84),('Ankit Tiwari', 21, 'Python', 'Pune', 79),('Riya Kapoor', 22, 'Java', 'Mumbai', 91);

Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0



mysql> select * from student;


+------------+--------------+------+--------+--------+-------+
| student_id | student_name | age  | course | city   | marks |
+------------+--------------+------+--------+--------+-------+
|          1 | Rahul Sharma |   21 | Python | Indore |    85 |
|          2 | Priya Verma  |   22 | Java   | Bhopal |    78 |
|          3 | Amit Singh   |   20 | Python | Indore |    92 |
|          4 | Neha Patel   |   23 | Java   | Pune   |    81 |
|          5 | Rohit Mehta  |   21 | Python | Mumbai |    88 |
|          6 | Sneha Jain   |   22 | Java   | Indore |    76 |
|          7 | Karan Gupta  |   20 | Python | Delhi  |    95 |
|          8 | Pooja Mishra |   23 | Java   | Bhopal |    84 |
|          9 | Ankit Tiwari |   21 | Python | Pune   |    79 |
|         10 | Riya Kapoor  |   22 | Java   | Mumbai |    91 |
+------------+--------------+------+--------+--------+-------+
10 rows in set (0.02 sec)


---------------------------------------------------------------