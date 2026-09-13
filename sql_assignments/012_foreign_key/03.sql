mysql> use case_study
--Database changed


mysql> create table Department (department_id int primary key , department_name varchar(30), floor_no int);

--Query OK, 0 rows affected (0.08 sec)


mysql> desc  Department;

--+-----------------+-------------+------+-----+---------+-------+
--| Field           | Type        | Null | Key | Default | Extra |
--+-----------------+-------------+------+-----+---------+-------+
--| department_id   | int         | NO   | PRI | NULL    |       |
--| department_name | varchar(30) | YES  |     | NULL    |       |
--| floor_no        | int         | YES  |     | NULL    |       |
--+-----------------+-------------+------+-----+---------+-------+
--3 rows in set (0.03 sec)



mysql> alter table  Department modify department_name varchar(30) unique not null, modify  floor_no int not null;

--Query OK, 0 rows affected (0.12 sec)
--Records: 0  Duplicates: 0  Warnings: 0


mysql> desc  Department;

--+-----------------+-------------+------+-----+---------+-------+
--| Field           | Type        | Null | Key | Default | Extra |
--+-----------------+-------------+------+-----+---------+-------+
--| department_id   | int         | NO   | PRI | NULL    |       |
--| department_name | varchar(30) | NO   | UNI | NULL    |       |
--| floor_no        | int         | NO   |     | NULL    |       |
--+-----------------+-------------+------+-----+---------+-------+
--3 rows in set (0.00 sec)


mysql> select * from department;

--+---------------+-----------------+----------+
--| department_id | department_name | floor_no |
--+---------------+-----------------+----------+
--|           101 | Cardiology      |        3 |
--|           102 | Neurology       |        4 |
--|           103 | Orthopedics     |        2 |
--|           104 | Dermatology     |        1 |
--+---------------+-----------------+----------+
--4 rows in set (0.00 sec)



mysql> create table  DOCTOR (doctor_id int primary key, doctor_name varchar(30) not null, specialization varchar(50) not null, department_id int, CONSTRAINT DOCTER_FK FOREIGN KEY (department_id) references department(department_id) ON DELETE SET NULL ON UPDATE CASCADE);

--Query OK, 0 rows affected (0.05 sec)



mysql> desc DOCTOR;

--+----------------+-------------+------+-----+---------+-------+
--| Field          | Type        | Null | Key | Default | Extra |
--+----------------+-------------+------+-----+---------+-------+
--| doctor_id      | int         | NO   | PRI | NULL    |       |
--| doctor_name    | varchar(30) | NO   |     | NULL    |       |
--| specialization | varchar(50) | NO   |     | NULL    |       |
--| department_id  | int         | YES  | MUL | NULL    |       |
--+----------------+-------------+------+-----+---------+-------+
--4 rows in set (0.00 sec)


mysql> insert into DOCTOR values (201, 'Dr. Rajesh Sharma', 'Cardiologist', 101), (202, 'Dr. Neha Verma', 'Neurologist', 102), (203, 'Dr. Amit Jain', 'Orthopedic', 103), (204, ' Dr. Priya Singh', 'Dermatologist', 104), (205, 'Dr. Karan Mehta', 'Cardiologist', 101);

--Query OK, 5 rows affected (0.08 sec)
--Records: 5  Duplicates: 0  Warnings: 0


mysql> select * from  DOCTOR;

--+-----------+-------------------+----------------+---------------+
--| doctor_id | doctor_name       | specialization | department_id |
--+-----------+-------------------+----------------+---------------+
--|       201 | Dr. Rajesh Sharma | Cardiologist   |           101 |
--|       202 | Dr. Neha Verma    | Neurologist    |           102 |
--|       203 | Dr. Amit Jain     | Orthopedic     |           103 |
--|       204 |  Dr. Priya Singh  | Dermatologist  |           104 |
--|       205 | Dr. Karan Mehta   | Cardiologist   |           101 |
--+-----------+-------------------+----------------+---------------+
--5 rows in set (0.01 sec)



mysql> create table  patient (patient_id int primary key,  patient_name varchar(30) not null, gender enum('Male', 'Female') , city varchar(30) not null);

--Query OK, 0 rows affected (0.05 sec)



mysql> desc patient;

--+--------------+-----------------------+------+-----+---------+-------+
--| Field        | Type                  | Null | Key | Default | Extra |
--+--------------+-----------------------+------+-----+---------+-------+
--| patient_id   | int                   | NO   | PRI | NULL    |       |
--| patient_name | varchar(30)           | NO   |     | NULL    |       |
--| gender       | enum('Male','Female') | YES  |     | NULL    |       |
--| city         | varchar(30)           | NO   |     | NULL    |       |
--+--------------+-----------------------+------+-----+---------+-------+
--4 rows in set (0.04 sec)



mysql> insert into patient values(301, 'Rahul Verma', 'Male', 'Indore'), (302, 'Sneha Sharma', 'Female', 'Bhopal'), (303, 'Amit Patel', 'Male', 'Indore'), (304, 'Pooja Gupta', 'Female', 'Ujjain'), (305, 'Rohan Jain', 'Male', 'Dewas'), (306, 'Neha Patel', 'Female', 'Indore');
--Query OK, 6 rows affected (0.01 sec)
--Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from patient;
--
--+------------+--------------+--------+--------+
--| patient_id | patient_name | gender | city   |
--+------------+--------------+--------+--------+
--|        301 | Rahul Verma  | Male   | Indore |
--|        302 | Sneha Sharma | Female | Bhopal |
--|        303 | Amit Patel   | Male   | Indore |
--|        304 | Pooja Gupta  | Female | Ujjain |
--|        305 | Rohan Jain   | Male   | Dewas  |
--|        306 | Neha Patel   | Female | Indore |
--+------------+--------------+--------+--------+
--6 rows in set (0.00 sec)



mysql> create table medicine (medicine_id int primary key, medicine_name varchar(50) unique not null, manufacturer varchar(100) not null, price decimal(10,2) not null);
--Query OK, 0 rows affected (0.06 sec)


mysql> desc medicine;

--+---------------+---------------+------+-----+---------+-------+
--| Field         | Type          | Null | Key | Default | Extra |
--+---------------+---------------+------+-----+---------+-------+
--| medicine_id   | int           | NO   | PRI | NULL    |       |
--| medicine_name | varchar(50)   | NO   | UNI | NULL    |       |
--| manufacturer  | varchar(100)  | NO   |     | NULL    |       |
--| price         | decimal(10,2) | NO   |     | NULL    |       |
--+---------------+---------------+------+-----+---------+-------+
--4 rows in set (0.00 sec)


mysql> insert into medicine values(401, 'Paracetamol', 'ABC Pharma', 30), (402, 'Azithromycin', 'XYZ Pharma', 120), (403, 'Pantoprazole', 'MedLife', 80)
, (404, 'moxicillin', 'HealthCare Pharma', 150), (405, 'Ibuprofen', 'ABC Pharma', 60), (406, 'Cetirizine', 'MedLife', 45);

--Query OK, 6 rows affected (0.01 sec)
--Records: 6  Duplicates: 0  Warnings: 0



mysql> select * from medicine;

--+-------------+---------------+-------------------+--------+
--| medicine_id | medicine_name | manufacturer      | price  |
--+-------------+---------------+-------------------+--------+
--|         401 | Paracetamol   | ABC Pharma        |  30.00 |
--|         402 | Azithromycin  | XYZ Pharma        | 120.00 |
--|         403 | Pantoprazole  | MedLife           |  80.00 |
--|         404 | moxicillin    | HealthCare Pharma | 150.00 |
--|         405 | Ibuprofen     | ABC Pharma        |  60.00 |
--|         406 | Cetirizine    | MedLife           |  45.00 |
--+-------------+---------------+-------------------+--------+
--6 rows in set (0.00 sec)



mysql> CREATE TABLE appointment (
    ->     appointment_id INT PRIMARY KEY,
    ->     appointment_date DATE,
    ->     appointment_time TIME,
    ->
    ->     patient_id INT NOT NULL,
    ->     CONSTRAINT app_patient_key
    ->         FOREIGN KEY (patient_id)
    ->         REFERENCES patient(patient_id)
    ->         ON DELETE CASCADE,
    ->
    ->     doctor_id INT NOT NULL,
    ->     CONSTRAINT app_doctor_key
    ->         FOREIGN KEY (doctor_id)
    ->         REFERENCES doctor(doctor_id)
    ->         ON DELETE CASCADE,
    ->
    ->     department_id INT NOT NULL,
    ->     CONSTRAINT app_department_key
    ->         FOREIGN KEY (department_id)
    ->         REFERENCES department(department_id)
    ->         ON DELETE CASCADE,
    ->
    ->     status ENUM('Completed', 'Scheduled') NOT NULL
    -> );
--Query OK, 0 rows affected (0.07 sec)


mysql> desc appointment;

--+------------------+-------------------------------+------+-----+---------+-------+
--| Field            | Type                          | Null | Key | Default | Extra |
--+------------------+-------------------------------+------+-----+---------+-------+
--| appointment_id   | int                           | NO   | PRI | NULL    |       |
--| appointment_date | date                          | YES  |     | NULL    |       |
--| appointment_time | time                          | YES  |     | NULL    |       |
--| patient_id       | int                           | NO   | MUL | NULL    |       |
--| doctor_id        | int                           | NO   | MUL | NULL    |       |
--| department_id    | int                           | NO   | MUL | NULL    |       |
--| status           | enum('Completed','Scheduled') | NO   |     | NULL    |       |
--+------------------+-------------------------------+------+-----+---------+-------+
--7 rows in set (0.02 sec)


mysql> insert into appointment values (501, '2026-09-01', '10:00', 301, 201, 101, 'Completed'), (502, '2026-09-01', '11:00', 302, 202, 102, 'Completed'), (503, '2026-09-02', '09:30', 303, 203, 103, 'Completed'), (504, '2026-09-02', '12:00', 304, 204, 104, 'Completed'), (505, '2026-09-03', '10:30', 301,  205, 101, 'Completed'), (506, '2026-09-03', '11:30', 305, 203, 103, 'Completed'), (507, '2026-09-04', '09:00', 306, 201, 101, 'Scheduled'), (508, '2026-09-04', '14:00', 302, 202, 102, 'Scheduled');
--Query OK, 8 rows affected (0.03 sec)
--Records: 8  Duplicates: 0  Warnings: 0


mysql> select * from appointment;

--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |       203 |           103 | Completed |
--|            504 | 2026-09-02       | 12:00:00         |        304 |       204 |           104 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |       203 |           103 | Completed |
--|            507 | 2026-09-04       | 09:00:00         |        306 |       201 |           101 | Scheduled |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--8 rows in set (0.00 sec)



mysql> CREATE TABLE prescription (
    ->     prescription_id INT PRIMARY KEY,
    ->     prescription_date DATE,
    ->
    ->     appointment_id INT NOT NULL,
    ->     CONSTRAINT pre_appointment_key
    ->         FOREIGN KEY (appointment_id)
    ->         REFERENCES appointment(appointment_id)
    ->         ON DELETE CASCADE,
    ->
    ->     patient_id INT NOT NULL,
    ->     CONSTRAINT pre_patient_key
    ->         FOREIGN KEY (patient_id)
    ->         REFERENCES patient(patient_id),
    ->
    ->     doctor_id INT NOT NULL,
    ->     CONSTRAINT pre_doctor_key
    ->         FOREIGN KEY (doctor_id)
    ->         REFERENCES doctor(doctor_id),
    ->
    ->     remarks VARCHAR(255)
    -> );
--Query OK, 0 rows affected (0.05 sec)


mysql> desc prescription;

--+-------------------+--------------+------+-----+---------+-------+
--| Field             | Type         | Null | Key | Default | Extra |
--+-------------------+--------------+------+-----+---------+-------+
--| prescription_id   | int          | NO   | PRI | NULL    |       |
--| prescription_date | date         | YES  |     | NULL    |       |
--| appointment_id    | int          | NO   | MUL | NULL    |       |
--| patient_id        | int          | NO   | MUL | NULL    |       |
--| doctor_id         | int          | NO   | MUL | NULL    |       |
--| remarks           | varchar(255) | YES  |     | NULL    |       |
--+-------------------+--------------+------+-----+---------+-------+
--6 rows in set (0.00 sec)



mysql> insert into PRESCRIPTION values
    -> (601, '2026-09-01', 501, 301, 201, 'BP observation'),
    -> (602, '2026-09-01', 502, 302, 202, 'Migraine treatment'),
    -> (603, '2026-09-02', 503, 303, 203, 'Knee pain'),
    -> (604, '2026-09-03', 505, 301, 205, 'Heart checkup'),
    -> (605, '2026-09-03', 506, 305, 203, 'Back pain');
--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0



mysql> select * from PRESCRIPTION;

--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--| prescription_id | prescription_date | appointment_id | patient_id | doctor_id | remarks            |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--|             601 | 2026-09-01        |            501 |        301 |       201 | BP observation     |
--|             602 | 2026-09-01        |            502 |        302 |       202 | Migraine treatment |
--|             603 | 2026-09-02        |            503 |        303 |       203 | Knee pain          |
--|             604 | 2026-09-03        |            505 |        301 |       205 | Heart checkup      |
--|             605 | 2026-09-03        |            506 |        305 |       203 | Back pain          |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--5 rows in set (0.00 sec)



mysql> create table PRESCRIPTION_MEDICINE (
    -> prescription_id INT NOT NULL,
    -> CONSTRAINT pre_medicine FOREIGN KEY (prescription_id)
    -> references prescription(prescription_id) ON DELETE CASCADE,
    -> medicine_id INT NOT NULL,
    -> CONSTRAINT med_medicine
    -> FOREIGN KEY (medicine_id)
    -> references medicine(medicine_id) ON DELETE RESTRICT,
    -> constraint pk_pre_medicine
    -> PRIMARY KEY (prescription_id, medicine_id),
    -> dosage varchar(20),
    -> duration_days int,
    -> quantity int);
--Query OK, 0 rows affected (0.05 sec)



mysql> desc PRESCRIPTION_MEDICINE;

--+-----------------+-------------+------+-----+---------+-------+
--| Field           | Type        | Null | Key | Default | Extra |
--+-----------------+-------------+------+-----+---------+-------+
--| prescription_id | int         | NO   | PRI | NULL    |       |
--| medicine_id     | int         | NO   | PRI | NULL    |       |
--| dosage          | varchar(20) | YES  |     | NULL    |       |
--| duration_days   | int         | YES  |     | NULL    |       |
--| quantity        | int         | YES  |     | NULL    |       |
--+-----------------+-------------+------+-----+---------+-------+
--5 rows in set (0.00 sec)



mysql> insert into PRESCRIPTION_MEDICINE values(601, 401, '1-0-1', 5, 10);
--Query OK, 1 row affected (0.01 sec)



mysql> select * from PRESCRIPTION_MEDICINE;

--+-----------------+-------------+--------+---------------+----------+
--| prescription_id | medicine_id | dosage | duration_days | quantity |
--+-----------------+-------------+--------+---------------+----------+
--|             601 |         401 | 1-0-1  |             5 |       10 |
--+-----------------+-------------+--------+---------------+----------+
--1 row in set (0.00 sec)



mysql> ALTER TABLE PRESCRIPTION_MEDICINE modify dosage varchar(20) not null, modify duration_days int not null, modify quantity int not null;

--Query OK, 0 rows affected (0.12 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> desc PRESCRIPTION_MEDICINE;

--+-----------------+-------------+------+-----+---------+-------+
--| Field           | Type        | Null | Key | Default | Extra |
--+-----------------+-------------+------+-----+---------+-------+
--| prescription_id | int         | NO   | PRI | NULL    |       |
--| medicine_id     | int         | NO   | PRI | NULL    |       |
--| dosage          | varchar(20) | NO   |     | NULL    |       |
--| duration_days   | int         | NO   |     | NULL    |       |
--| quantity        | int         | NO   |     | NULL    |       |
--+-----------------+-------------+------+-----+---------+-------+
--5 rows in set (0.00 sec)



mysql> insert into PRESCRIPTION_MEDICINE values
    -> (601, 403, '1-0-0', 5, 5),
    -> (602, 403, '1-0-0', 7, 7),
    -> (602, 406, '0-0-1', 5, 5),
    -> (603, 405, '1-0-1', 5, 10),
    -> (603, 403, '1-0-0', 5, 5),
    -> (604, 401, '1-0-1', 3, 6),
    -> (604, 403, '1-0-0', 3, 3),
    -> (605, 405, '1-0-1', 7, 14);
--Query OK, 8 rows affected (0.02 sec)
--Records: 8  Duplicates: 0  Warnings: 0



mysql> select * from PRESCRIPTION_MEDICINE;

--+-----------------+-------------+--------+---------------+----------+
--| prescription_id | medicine_id | dosage | duration_days | quantity |
--+-----------------+-------------+--------+---------------+----------+
--|             601 |         401 | 1-0-1  |             5 |       10 |
--|             601 |         403 | 1-0-0  |             5 |        5 |
--|             602 |         403 | 1-0-0  |             7 |        7 |
--|             602 |         406 | 0-0-1  |             5 |        5 |
--|             603 |         403 | 1-0-0  |             5 |        5 |
--|             603 |         405 | 1-0-1  |             5 |       10 |
--|             604 |         401 | 1-0-1  |             3 |        6 |
--|             604 |         403 | 1-0-0  |             3 |        3 |
--|             605 |         405 | 1-0-1  |             7 |       14 |
--+-----------------+-------------+--------+---------------+----------+
--9 rows in set (0.00 sec)



