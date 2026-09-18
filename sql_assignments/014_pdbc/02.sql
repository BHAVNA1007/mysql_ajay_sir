mysql> create table employee_pdbc
    -> (eid INT PRIMARY KEY, ename VARCHAR(50), department VARCHAR(40), salary DECIMAL(10,2), city VARCHAR(30));
Query OK, 0 rows affected (0.10 sec)

mysql> desc employee_pdbc;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| eid        | int           | NO   | PRI | NULL    |       |
| ename      | varchar(50)   | YES  |     | NULL    |       |
| department | varchar(40)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
| city       | varchar(30)   | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
5 rows in set (0.04 sec)

mysql> insert into employee_pdbc values
    -> (201, 'Amit', 'IT', 45000, 'Indore'),
    -> (202, 'Priya', 'HR', 40000, 'Bhopal'),
    -> (203, 'Rahul', 'IT', 55000, 'Indore'),
    -> (204, 'Neha', 'Finance', 50000, 'Ujjain'),
    -> (205, 'Karan', 'IT', 60000, 'Indore');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0



mysql> select * from employee_pdbc;
+-----+-------+------------+----------+--------+
| eid | ename | department | salary   | city   |
+-----+-------+------------+----------+--------+
| 201 | Amit  | IT         | 45000.00 | Indore |
| 202 | Priya | HR         | 40000.00 | Bhopal |
| 203 | Rahul | IT         | 55000.00 | Indore |
| 204 | Neha  | Finance    | 50000.00 | Ujjain |
| 205 | Karan | IT         | 60000.00 | Indore |
+-----+-------+------------+----------+--------+
5 rows in set (0.00 sec)











Import done
connected to database successfully

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  1
1. Add  EMPLOYEE
ENTER  EMPLOYEE ID : 207
ENTER  EMPLOYEE NAME : Bhavna
ENTER Department: IT
ENTER Salary : 50000
ENTER CITY : Bhopal
Employee inserted successfully.

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  2
2. DISPLAY ALL EMPLOYEES
------------------------------------
ID    NAME    Department    Salary    CITY
------------------------------------
201    Amit    IT    45000.00    Indore
202    Priya    HR    40000.00    Bhopal
203    Rahul    IT    55000.00    Indore
204    Neha    Finance    50000.00    Ujjain
205    Karan    IT    60000.00    Indore
207    Bhavna    IT    50000.00    Bhopal

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  3
3. Search Employee by Name
enter Employee name: ra
------------------------------------
ID    NAME    Department    Salary    CITY
------------------------------------
203    Rahul    IT    55000.00    Indore
205    Karan    IT    60000.00    Indore

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  4
4. Update Student Fees
ENTER S_ID: 201
ENTER NEW salary: 48000
Employee salary updated successfully.

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  5
5. Delete employee
ENTER S_ID: 202
employeee deleted successfully.

***********MENU************

===== EMPLOYEE MANAGEMENT SYSTEM=====
1. Add Employee
2. Display All Employee
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit
ENTER CHOICE:  6
Thank you for using employee Management System.
Connection closed successfully.
PS D:\InfoBeans\MySQL_Ajay_sir\sql_assignments\014_pdbc> 



mysql> select * from employee_pdbc;
+-----+--------+------------+----------+--------+
| eid | ename  | department | salary   | city   |
+-----+--------+------------+----------+--------+
| 201 | Amit   | IT         | 48000.00 | Indore |
| 203 | Rahul  | IT         | 55000.00 | Indore |
| 204 | Neha   | Finance    | 50000.00 | Ujjain |
| 205 | Karan  | IT         | 60000.00 | Indore |
| 207 | Bhavna | IT         | 50000.00 | Bhopal |
+-----+--------+------------+----------+--------+
5 rows in set (0.00 sec)
