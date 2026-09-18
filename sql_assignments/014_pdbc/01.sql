mysql> create database pdbc_practice;
--Query OK, 1 row affected (0.02 sec)


mysql> create table  student_pdbc(sid INT PRIMARY KEY, sname VARCHAR(50), course VARCHAR(50), fees DECIMAL(10,2), city VARCHAR(30));
Query OK, 0 rows affected (0.08 sec)

mysql> desc student_pdbc;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| sid    | int           | NO   | PRI | NULL    |       |
| sname  | varchar(50)   | YES  |     | NULL    |       |
| course | varchar(50)   | YES  |     | NULL    |       |
| fees   | decimal(10,2) | YES  |     | NULL    |       |
| city   | varchar(30)   | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
5 rows in set (0.05 sec)


mysql> insert into student_pdbc values
    -> (101, 'Amit', 'Python',  15000, 'Indore'),
    -> (102, 'Priya', 'Java',  18000,  'Bhopal'),
    -> (103, 'Rahul', 'Python', 15000, 'Indore'),
    -> (104, 'Neha', 'Java', 18000, 'Ujjain'),
    -> (105, 'Karan', 'MERN', 20000, 'Indore'),
    -> (106, 'Anjali', 'Python', 15000, 'Dewas');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from student_pdbc;
+-----+--------+--------+----------+--------+
| sid | sname  | course | fees     | city   |
+-----+--------+--------+----------+--------+
| 101 | Amit   | Python | 15000.00 | Indore |
| 102 | Priya  | Java   | 18000.00 | Bhopal |
| 103 | Rahul  | Python | 15000.00 | Indore |
| 104 | Neha   | Java   | 18000.00 | Ujjain |
| 105 | Karan  | MERN   | 20000.00 | Indore |
| 106 | Anjali | Python | 15000.00 | Dewas  |
+-----+--------+--------+----------+--------+
6 rows in set (0.00 sec)


mysql> select * from  student_pdbc;
+-----+--------+--------+----------+--------+
| sid | sname  | course | fees     | city   |
+-----+--------+--------+----------+--------+
| 101 | Amit   | Python | 15000.00 | Indore |
| 102 | Priya  | Java   | 18000.00 | Bhopal |
| 103 | Rahul  | Python | 15000.00 | Indore |
| 104 | Neha   | Java   | 18000.00 | Ujjain |
| 105 | Karan  | MERN   | 20000.00 | Indore |
| 106 | Anjali | Python | 15000.00 | Dewas  |
| 107 | Bhavna | MERN   | 17000.00 | Bhopal |
+-----+--------+--------+----------+--------+
7 rows in set (0.00 sec)



ENTER CHOICE:  2
2. Display All Students
------------------------------------
ID    NAME    COURSE    FEES    CITY
------------------------------------
101    Amit    Python    15000.00    Indore
102    Priya    Java    18000.00    Bhopal
103    Rahul    Python    15000.00    Indore
104    Neha    Java    18000.00    Ujjain
105    Karan    MERN    20000.00    Indore
106    Anjali    Python    15000.00    Dewas
107    Bhavna    MERN    17000.00    Bhopal




ENTER CHOICE:  3
3. Search Student by Name
enter name: an
------------------------------------
ID    NAME    COURSE    FEES    CITY
------------------------------------
105    Karan    MERN    20000.00    Indore
106    Anjali    Python    15000.00    Dewas




ENTER CHOICE:  4    
4. Update Student Fees
ENTER S_ID: 101
ENTER NEW FEES: 17000
Employee salary updated successfully.


mysql> select * from  student_pdbc;
+-----+--------+--------+----------+--------+
| sid | sname  | course | fees     | city   |
+-----+--------+--------+----------+--------+
| 101 | Amit   | Python | 17000.00 | Indore |
| 102 | Priya  | Java   | 18000.00 | Bhopal |
| 103 | Rahul  | Python | 15000.00 | Indore |
| 104 | Neha   | Java   | 18000.00 | Ujjain |
| 105 | Karan  | MERN   | 20000.00 | Indore |
| 106 | Anjali | Python | 15000.00 | Dewas  |
| 107 | Bhavna | MERN   | 17000.00 | Bhopal |
+-----+--------+--------+----------+--------+
7 rows in set (0.01 sec)




ENTER CHOICE:  5
5. Delete Student
ENTER S_ID: 104
Student deleted successfully.



mysql> select * from  student_pdbc;
+-----+--------+--------+----------+--------+
| sid | sname  | course | fees     | city   |
+-----+--------+--------+----------+--------+
| 101 | Amit   | Python | 17000.00 | Indore |
| 102 | Priya  | Java   | 18000.00 | Bhopal |
| 103 | Rahul  | Python | 15000.00 | Indore |
| 105 | Karan  | MERN   | 20000.00 | Indore |
| 106 | Anjali | Python | 15000.00 | Dewas  |
| 107 | Bhavna | MERN   | 17000.00 | Bhopal |
+-----+--------+--------+----------+--------+
6 rows in set (0.00 sec)
