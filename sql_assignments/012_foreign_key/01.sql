QNO 1:
A company wants to manage its employees and their respective departments. Each employee must belong to a department. If a department is deleted, all employees in that department should also be removed automatically.
Tasks:
1. Create the Departments Table
Each department has a unique ID (DepartmentID).
The department name must be unique.
The department name cannot be NULL.

2. Create the Employees Table
Each employee has a unique ID (EmployeeID).
Each employee has a name and salary, both cannot be NULL.
Each employee must be assigned to a department (DepartmentID), which is a FOREIGN KEY referencing Departments(DepartmentID).
If a department is deleted, all employees in that department should also be deleted.

3. Insert Sample Data
Insert at least 3 departments.
Insert at least 5 employees (make sure at least two employees belong to the same department).

4. Implement Query Constraints (Without Using JOIN)
Write a query to list all employees and their department names (without using JOIN).
Write a query to update an employees department.
Try deleting a department and observe what happens to the employees under that department.







mysql> create table Departments (DepartmentID int primary key,  department_name varchar(20) unique not null);

--Query OK, 0 rows affected (0.09 sec)




mysql> create table Employees (EmployeeID int primary key, emp_name varchar(20) not null, salary decimal(10,2) not null, DepartmentID int, FOREIGN KEY (DepartmentID) references Departments(DepartmentID) on delete cascade);

--Query OK, 0 rows affected (0.06 sec)




mysql> desc Departments;

--+-----------------+-------------+------+-----+---------+-------+
--| Field           | Type        | Null | Key | Default | Extra |
--+-----------------+-------------+------+-----+---------+-------+
--| DepartmentID    | int         | NO   | PRI | NULL    |       |
--| department_name | varchar(20) | NO   | UNI | NULL    |       |
--+-----------------+-------------+------+-----+---------+-------+
--2 rows in set (0.02 sec)




mysql> desc Employees;

--+--------------+---------------+------+-----+---------+-------+
--| Field        | Type          | Null | Key | Default | Extra |
--+--------------+---------------+------+-----+---------+-------+
--| EmployeeID   | int           | NO   | PRI | NULL    |       |
--| emp_name     | varchar(20)   | NO   |     | NULL    |       |
--| salary       | decimal(10,2) | NO   |     | NULL    |       |
--| DepartmentID | int           | YES  | MUL | NULL    |       |
--+--------------+---------------+------+-----+---------+-------+
--4 rows in set (0.00 sec)




mysql> insert into Departments values(101, 'HR'), (102, 'Finance'), (103, 'sales');

--Query OK, 3 rows affected (0.02 sec)
--Records: 3  Duplicates: 0  Warnings: 0




mysql> insert into Employees values(1, 'rashmika', 40000, 101), (2, 'deepika', 50000, 101), (3, 'katappa', 30000, 102), (4, 'pooja', 60000, 102), (5, 'riya', 70000, 102);

--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0




mysql> select * from Departments;

--+--------------+-----------------+
--| DepartmentID | department_name |
--+--------------+-----------------+
--|          102 | Finance         |
--|          101 | HR              |
--|          103 | sales           |
--+--------------+-----------------+
--3 rows in set (0.00 sec)




mysql> select * from Employees;

--+------------+----------+----------+--------------+
--| EmployeeID | emp_name | salary   | DepartmentID |
--+------------+----------+----------+--------------+
--|          1 | rashmika | 40000.00 |          101 |
--|          2 | deepika  | 50000.00 |          101 |
--|          3 | katappa  | 30000.00 |          102 |
--|          4 | pooja    | 60000.00 |          102 |
--|          5 | riya     | 70000.00 |          102 |
--+------------+----------+----------+--------------+
--5 rows in set (0.00 sec)




mysql> update Employees set DepartmentID = 103 where EmployeeID = 5;

--Query OK, 1 row affected (0.01 sec)
--Rows matched: 1  Changed: 1  Warnings: 0




mysql>  select * from Employees;

--+------------+----------+----------+--------------+
--| EmployeeID | emp_name | salary   | DepartmentID |
--+------------+----------+----------+--------------+
--|          1 | rashmika | 40000.00 |          101 |
--|          2 | deepika  | 50000.00 |          101 |
--|          3 | katappa  | 30000.00 |          102 |
--|          4 | pooja    | 60000.00 |          102 |
--|          5 | riya     | 70000.00 |          103 |
--+------------+----------+----------+--------------+
--5 rows in set (0.00 sec)



mysql> select employees.*, departments.department_name from employees, departments;

--+------------+----------+----------+--------------+-----------------+
--| EmployeeID | emp_name | salary   | DepartmentID | department_name |
--+------------+----------+----------+--------------+-----------------+
--|          1 | rashmika | 40000.00 |          101 | sales           |
--|          1 | rashmika | 40000.00 |          101 | HR              |
--|          1 | rashmika | 40000.00 |          101 | Finance         |
--|          2 | deepika  | 50000.00 |          101 | sales           |
--|          2 | deepika  | 50000.00 |          101 | HR              |
--|          2 | deepika  | 50000.00 |          101 | Finance         |
--|          3 | katappa  | 30000.00 |          102 | sales           |
--|          3 | katappa  | 30000.00 |          102 | HR              |
--|          3 | katappa  | 30000.00 |          102 | Finance         |
--|          4 | pooja    | 60000.00 |          102 | sales           |
--|          4 | pooja    | 60000.00 |          102 | HR              |
--|          4 | pooja    | 60000.00 |          102 | Finance         |
--|          5 | riya     | 70000.00 |          103 | sales           |
--|          5 | riya     | 70000.00 |          103 | HR              |
--|          5 | riya     | 70000.00 |          103 | Finance         |
--+------------+----------+----------+--------------+-----------------+
--15 rows in set (0.00 sec)





mysql> select employees.*, departments.department_name from employees, departments where employees.departmentId = departments.departmentId;

--+------------+----------+----------+--------------+-----------------+
--| EmployeeID | emp_name | salary   | DepartmentID | department_name |
--+------------+----------+----------+--------------+-----------------+
--|          3 | katappa  | 30000.00 |          102 | Finance         |
--|          4 | pooja    | 60000.00 |          102 | Finance         |
--|          1 | rashmika | 40000.00 |          101 | HR              |
--|          2 | deepika  | 50000.00 |          101 | HR              |
--|          5 | riya     | 70000.00 |          103 | sales           |
--+------------+----------+----------+--------------+-----------------+
--5 rows in set (0.00 sec)




mysql> update departments set DepartmentID = 104 where DepartmentID = 103;
--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`f_key_assignment`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE)
mysql>



 if we want  delete + update then (on delete cascade on update cascade ) works so, we have need to declare at the time of table creation  this property.


 mysql> delete from departments where departmentId = 103;
--Query OK, 1 row affected (0.01 sec)



mysql> select * from departments;

--+--------------+-----------------+
--| DepartmentID | department_name |
--+--------------+-----------------+
--|          102 | Finance         |
--|          101 | HR              |
--+--------------+-----------------+
--2 rows in set (0.00 sec)




mysql>  select * from Employees;

--+------------+----------+----------+--------------+
--| EmployeeID | emp_name | salary   | DepartmentID |
--+------------+----------+----------+--------------+
--|          1 | rashmika | 40000.00 |          101 |
--|          2 | deepika  | 50000.00 |          101 |
--|          3 | katappa  | 30000.00 |          102 |
--|          4 | pooja    | 60000.00 |          102 |
--+------------+----------+----------+--------------+
--4 rows in set (0.00 sec)



***************************************************************


QNO 2:-

A hospital wants to store patient records and their assigned doctors. If a doctor leaves, all related patient records should be deleted.

Tasks:
Create a Doctors table:

DoctorID (PRIMARY KEY, AUTO_INCREMENT)
DoctorName (NOT NULL)
Specialization (NOT NULL, UNIQUE)


Create a Patients table:
PatientID (PRIMARY KEY, AUTO_INCREMENT)
PatientName (NOT NULL)
DoctorID (FOREIGN KEY)
Insert sample data (at least 3 doctors and 5 patients).

Delete a doctor and check if related patients are removed automatically.

Update a patient’s doctor to a new doctor.



mysql> create table doctors (
    -> DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    -> DoctorName varchar(20) NOT NULL,
    -> Specialization varchar(30) NOT NULL UNIQUE);
--Query OK, 0 rows affected (0.05 sec)



mysql> create table Patients(
    -> PatientID INT PRIMARY KEY AUTO_INCREMENT,
    -> PatientName VARCHAR(30) NOT NULL,
    -> DoctorID INT, FOREIGN KEY (DoctorID) references doctors(DoctorID));
--Query OK, 0 rows affected (0.05 sec)




mysql> desc doctors;
--+----------------+-------------+------+-----+---------+----------------+
--| Field          | Type        | Null | Key | Default | Extra          |
--+----------------+-------------+------+-----+---------+----------------+
--| DoctorID       | int         | NO   | PRI | NULL    | auto_increment |
--| DoctorName     | varchar(20) | NO   |     | NULL    |                |
--| Specialization | varchar(30) | NO   | UNI | NULL    |                |
--+----------------+-------------+------+-----+---------+----------------+
--3 rows in set (0.00 sec)



mysql> desc Patients;
--+-------------+-------------+------+-----+---------+----------------+
--| Field       | Type        | Null | Key | Default | Extra          |
--+-------------+-------------+------+-----+---------+----------------+
--| PatientID   | int         | NO   | PRI | NULL    | auto_increment |
--| PatientName | varchar(30) | NO   |     | NULL    |                |
--| DoctorID    | int         | YES  | MUL | NULL    |                |
--+-------------+-------------+------+-----+---------+----------------+
--3 rows in set (0.00 sec)




mysql> alter table Patients drop foreign key patients_ibfk_1;
--Query OK, 0 rows affected (0.02 sec)
--Records: 0  Duplicates: 0  Warnings: 0




mysql> ALTER TABLE Patients add constraint fk_patient_doctor Foreign key (DoctorID) references doctors(DoctorID) ON DELETE CASCADE ON UPDATE CASCADE;
--Query OK, 0 rows affected (0.11 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> desc Patients;
--+-------------+-------------+------+-----+---------+----------------+
--| Field       | Type        | Null | Key | Default | Extra          |
--+-------------+-------------+------+-----+---------+----------------+
--| PatientID   | int         | NO   | PRI | NULL    | auto_increment |
--| PatientName | varchar(30) | NO   |     | NULL    |                |
--| DoctorID    | int         | YES  | MUL | NULL    |                |
--+-------------+-------------+------+-----+---------+----------------+
--3 rows in set (0.00 sec)




mysql> insert into doctors (DoctorName, Specialization) values
    -> ('AMIT', 'eye'), ('KRISHNA', 'heart'), ('ANJALI', 'gayno');
--Query OK, 3 rows affected (0.03 sec)
--Records: 3  Duplicates: 0  Warnings: 0




mysql> insert into Patients (PatientName, DoctorID) values
    -> ('priya', 1), ('siya', 2), ('kiya', 3), ('rama', 1), ('kiran', 3);
--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0



mysql> select * from doctors;
--+----------+------------+----------------+
--| DoctorID | DoctorName | Specialization |
--+----------+------------+----------------+
--|        1 | AMIT       | eye            |
--|        2 | KRISHNA    | heart          |
--|        3 | ANJALI     | gayno          |
--+----------+------------+----------------+
--3 rows in set (0.00 sec)



mysql> select * from Patients;
--+-----------+-------------+----------+
--| PatientID | PatientName | DoctorID |
--+-----------+-------------+----------+
--|         1 | priya       |        1 |
--|         2 | siya        |        2 |
--|         3 | kiya        |        3 |
--|         4 | rama        |        1 |
--|         5 | kiran       |        3 |
--+-----------+-------------+----------+
--5 rows in set (0.00 sec)




mysql> delete from doctors where DoctorID = 2 ;
--Query OK, 1 row affected (0.02 sec)




mysql> select * from doctors;
--+----------+------------+----------------+
--| DoctorID | DoctorName | Specialization |
--+----------+------------+----------------+
--|        1 | AMIT       | eye            |
--|        3 | ANJALI     | gayno          |
--+----------+------------+----------------+
--2 rows in set (0.00 sec)



mysql> select * from Patients;
--+-----------+-------------+----------+
--| PatientID | PatientName | DoctorID |
--+-----------+-------------+----------+
--|         1 | priya       |        1 |
--|         3 | kiya        |        3 |
--|         4 | rama        |        1 |
--|         5 | kiran       |        3 |
--+-----------+-------------+----------+
--4 rows in set (0.00 sec)



mysql> update Patients set DoctorID = 3 where PatientID = 3;
--Query OK, 0 rows affected (0.00 sec)
--Rows matched: 1  Changed: 0  Warnings: 0



mysql> select * from Patients;
--+-----------+-------------+----------+
--| PatientID | PatientName | DoctorID |
--+-----------+-------------+----------+
--|         1 | priya       |        1 |
--|         3 | kiya        |        3 |
--|         4 | rama        |        1 |
--|         5 | kiran       |        3 |
--+-----------+-------------+----------+
--4 rows in set (0.00 sec)



mysql> update Patients set DoctorID = 3 where PatientID = 2;
--Query OK, 0 rows affected (0.00 sec)
--Rows matched: 0  Changed: 0  Warnings: 0



mysql> select * from Patients;
--+-----------+-------------+----------+
--| PatientID | PatientName | DoctorID |
--+-----------+-------------+----------+
--|         1 | priya       |        1 |
--|         3 | kiya        |        3 |
--|         4 | rama        |        1 |
--|         5 | kiran       |        3 |
--+-----------+-------------+----------+
--4 rows in set (0.00 sec)



mysql> update Patients set DoctorID = 3 where PatientID = 4;
--Query OK, 1 row affected (0.03 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from Patients;
--+-----------+-------------+----------+
--| PatientID | PatientName | DoctorID |
--+-----------+-------------+----------+
--|         1 | priya       |        1 |
--|         3 | kiya        |        3 |
--|         4 | rama        |        3 |
--|         5 | kiran       |        3 |
--+-----------+-------------+----------+
--4 rows in set (0.00 sec)