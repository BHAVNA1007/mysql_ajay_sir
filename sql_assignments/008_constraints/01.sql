--1.
--Create a table named Students with the following columns:

--StudentID (INT, Primary Key)
--Name (VARCHAR(50), NOT NULL)
--Age (INT, should be between 18 and 25)
--Marks (DECIMAL(5,2), should be between 0 and 100)


mysql> create table students(StudentID INT Primary Key, Name VARCHAR(50) NOT NULL, Age INT check(Age between 18 and 25), Marks DECIMAL(5,2) check(Marks between 0 and 100));

--Query OK, 0 rows affected (0.05 sec)



mysql> select * from students;
--Empty set (0.03 sec)



mysql> desc students;
--+-----------+--------------+------+-----+---------+-------+
--| Field     | Type         | Null | Key | Default | Extra |
--+-----------+--------------+------+-----+---------+-------+
--| StudentID | int          | NO   | PRI | NULL    |       |
--| Name      | varchar(50)  | NO   |     | NULL    |       |
--| Age       | int          | YES  |     | NULL    |       |
--| Marks     | decimal(5,2) | YES  |     | NULL    |       |
--+-----------+--------------+------+-----+---------+-------+
--4 rows in set (0.01 sec)




--Insert the following records and observe what happens:
--(101, 'Alice', 20, 85.5)


mysql> insert into students values(101, 'Alice', 20, 85.5);
--Query OK, 1 row affected (0.01 sec)


mysql> select * from students;
--+-----------+-------+------+-------+
--| StudentID | Name  | Age  | Marks |
--+-----------+-------+------+-------+
--|       101 | Alice |   20 | 85.50 |
--+-----------+-------+------+-------+
--1 row in set (0.00 sec)


--(102, 'Bob', 17, 90.0) (This should fail due to Age constraint)

mysql> insert into students values(102, 'Bob', 17, 90.0);
ERROR 3819 (HY000): Check constraint 'students_chk_1' is violated.


--(103, 'Charlie', 22, 105.0) (This should fail due to Marks constraint)

mysql> insert into students values(103, 'Charlie', 22, 105.0);
ERROR 3819 (HY000): Check constraint 'students_chk_2' is violated.


--(104, 'David', 24, 75.0)

mysql> insert into students values(104, 'David', 24, 75.0);
--Query OK, 1 row affected (0.01 sec)


mysql> select * from students;
--+-----------+-------+------+-------+
--| StudentID | Name  | Age  | Marks |
--+-----------+-------+------+-------+
--|       101 | Alice |   20 | 85.50 |
--|       104 | David |   24 | 75.00 |
--+-----------+-------+------+-------+
--2 rows in set (0.00 sec)



*********************************************************************

2.

Create a table Patients with:

PatientID (INT, Primary Key)
PatientName (VARCHAR(50), NOT NULL)
Age (INT, should be between 1 and 100)
AdmissionStatus (VARCHAR(15), should be 'Admitted' or 'Discharged', DEFAULT 'Admitted')
TreatmentCost (DECIMAL(10,2), should be at least 1000)




mysql> CREATE TABLE Patients (
    ->     PatientID INT PRIMARY KEY,
    ->     PatientName VARCHAR(50) NOT NULL,
    ->     Age INT CHECK (Age BETWEEN 1 AND 100),
    ->     AdmissionStatus VARCHAR(15) DEFAULT 'Admitted'
    ->         CHECK (AdmissionStatus IN ('Admitted', 'Discharged')),
    ->     TreatmentCost DECIMAL(10,2)
    ->         CHECK (TreatmentCost >= 1000)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc  Patients;
+-----------------+---------------+------+-----+----------+-------+
| Field           | Type          | Null | Key | Default  | Extra |
+-----------------+---------------+------+-----+----------+-------+
| PatientID       | int           | NO   | PRI | NULL     |       |
| PatientName     | varchar(50)   | NO   |     | NULL     |       |
| Age             | int           | YES  |     | NULL     |       |
| AdmissionStatus | varchar(15)   | YES  |     | Admitted |       |
| TreatmentCost   | decimal(10,2) | YES  |     | NULL     |       |
+-----------------+---------------+------+-----+----------+-------+
5 rows in set (0.01 sec)




Insert records and check constraints:

(201, 'Michael', 25, 'Admitted', 5000)

mysql> insert into Patients values(201, 'Michael', 25, 'Admitted', 5000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from  Patients;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
+-----------+-------------+------+-----------------+---------------+
1 row in set (0.00 sec)



(202, 'Linda', 105, 'Admitted', 8000) (Should fail due to Age constraint)

mysql> insert into Patients values(202, 'Linda', 105, 'Admitted', 8000);
ERROR 3819 (HY000): Check constraint 'patients_chk_1' is violated.



(203, 'David', 40, DEFAULT, 1200) (Should insert 'Admitted' as default)

mysql> insert into Patients values(203, 'David', 40, DEFAULT, 1200);
Query OK, 1 row affected (0.01 sec)

mysql> select * from  Patients;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | Age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)




(204, 'Sarah', 30, 'Discharged', 700) (Should fail due to TreatmentCost constraint)

mysql> insert into Patients values(204, 'Sarah', 30, 'Discharged', 700);
ERROR 3819 (HY000): Check constraint 'patients_chk_3' is violated.

***************************************************************



3.
Create a table GymMembers with:

MemberID (INT, Primary Key)
MemberName (VARCHAR(50), NOT NULL)
MembershipType (VARCHAR(15), should be 'Basic', 'Premium', or 'VIP', DEFAULT 'Basic')
MonthlyFee (DECIMAL(6,2), should be at least 500)




mysql> Create  table GymMembers
    -> (MemberID INT Primary Key,
    -> MemberName VARCHAR(50) NOT NULL,
    -> MembershipType VARCHAR(15) DEFAULT 'Basic'
    ->    check(MembershipType IN ('Basic', 'Premium', 'VIP')),
    -> MonthlyFee DECIMAL(6,2)
    ->    check(MonthlyFee >= 500));
Query OK, 0 rows affected (0.03 sec)

mysql> desc GymMembers;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| MemberID       | int          | NO   | PRI | NULL    |       |
| MemberName     | varchar(50)  | NO   |     | NULL    |       |
| MembershipType | varchar(15)  | YES  |     | Basic   |       |
| MonthlyFee     | decimal(6,2) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)





Insert records and check constraints:

(501, 'John', 'Premium', 1200)

mysql> insert into GymMembers values(501, 'John', 'Premium', 1200);
Query OK, 1 row affected (0.01 sec)



(502, 'Emma', 'Gold', 800) (Should fail due to MembershipType constraint)


mysql> insert into GymMembers values(502, 'Emma', 'Gold', 800);
ERROR 3819 (HY000): Check constraint 'gymmembers_chk_1' is violated.



(503, 'Daniel', DEFAULT, 700) (Should insert 'Basic' as default)

mysql> insert into GymMembers values(503, 'Daniel', DEFAULT, 700);
Query OK, 1 row affected (0.01 sec)

mysql> select * from  GymMembers;
+----------+------------+----------------+------------+
| MemberID | MemberName | MembershipType | MonthlyFee |
+----------+------------+----------------+------------+
|      501 | John       | Premium        |    1200.00 |
|      503 | Daniel     | Basic          |     700.00 |
+----------+------------+----------------+------------+
2 rows in set (0.00 sec)



(504, 'Sophia', 'VIP', 300) (Should fail due to MonthlyFee constraint)

mysql> insert into GymMembers values(504, 'Sophia', 'VIP', 300);
ERROR 3819 (HY000): Check constraint 'gymmembers_chk_2' is violated.

***************************************************************



4.
Create a table Events with:
EventID (Primary Key, Auto Increment)
EventName (VARCHAR)
EventDate (DATE, must be in the future)

mysql> Create table Events
    -> (EventID int Primary Key auto_increment,
    -> EventName VARCHAR(20),
    -> EventDate DATE CHECK (EventDate > curdate());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4


mysql> select version();
+-----------+
| version() |
+-----------+
| 8.0.37    |
+-----------+
1 row in set (0.02 sec)



mysql> Create table Events
    -> (EventID int Primary Key auto_increment,
    -> EventName VARCHAR(20),
    -> EventDate DATE);
Query OK, 0 rows affected (0.04 sec)



Insert sample records. Ensure past dates are not allowed.

mysql> INSERT INTO Events (EventName, EventDate)
    -> VALUES
    -> ('Tech Conference', '2026-09-10'),
    -> ('AI Workshop', '2026-09-15');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from  Events;
+---------+-----------------+------------+
| EventID | EventName       | EventDate  |
+---------+-----------------+------------+
|       1 | Tech Conference | 2026-09-10 |
|       2 | AI Workshop     | 2026-09-15 |
+---------+-----------------+------------+
2 rows in set (0.00 sec)


mysql> INSERT INTO Events (EventName, EventDate)
    -> VALUES ('Old Meeting', '2026-08-20');
ERROR 1644 (45000): EventDate must be in the future




Retrieve all upcoming events.

mysql> SELECT * FROM EVENTS where eventdate > curdate() order by eventdate;
+---------+-----------------+------------+
| EventID | EventName       | EventDate  |
+---------+-----------------+------------+
|       1 | Tech Conference | 2026-09-10 |
|       2 | AI Workshop     | 2026-09-15 |
+---------+-----------------+--



5.
Create a table MovieTickets with:
TicketID (Primary Key, Auto Increment)
CustomerName (VARCHAR)
ShowTime (DATETIME, must be at least 2 hours after booking)
BookingTime (DATETIME, default to current time)


mysql> Create table MovieTickets
    -> (TicketID int Primary Key Auto_Increment,
    -> CustomerName VARCHAR(20),
    -> ShowTime DATETIME,
    -> bookingtime datetime default CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.04 sec)



mysql> DELIMITER //
mysql> create trigger check_showtime
    -> before insert on MovieTickets
    -> for each row
    -> begin
    ->     if new.showtime < date_add(new.bookingtime, INTERVAL 2 HOUR) THEN
    ->          signal sqlstate '45000'
    ->          set message_text = 'ShowTime must be at least 2 hours after BookingTime';
    ->     end if;
    -> end//
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;

Insert sample bookings.


mysql> INSERT INTO MovieTickets (CustomerName, ShowTime, BookingTime)
    -> VALUES
    -> ('Rahul', '2026-09-02 15:00:00', '2026-09-02 12:00:00'),
    -> ('Priya', '2026-09-02 18:00:00', '2026-09-02 14:00:00'),
    -> ('Amit', '2026-09-03 20:00:00', '2026-09-03 16:00:00');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from  MovieTickets;
+----------+--------------+---------------------+---------------------+
| TicketID | CustomerName | ShowTime            | bookingtime         |
+----------+--------------+---------------------+---------------------+
|        1 | Rahul        | 2026-09-02 15:00:00 | 2026-09-02 12:00:00 |
|        2 | Priya        | 2026-09-02 18:00:00 | 2026-09-02 14:00:00 |
|        3 | Amit         | 2026-09-03 20:00:00 | 2026-09-03 16:00:00 |
+----------+--------------+---------------------+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO MovieTickets (CustomerName, ShowTime)
    -> VALUES
    -> ('Vikas', DATE_ADD(NOW(), INTERVAL 3 HOUR));
Query OK, 1 row affected (0.01 sec)

mysql> select * from  MovieTickets;
+----------+--------------+---------------------+---------------------+
| TicketID | CustomerName | ShowTime            | bookingtime         |
+----------+--------------+---------------------+---------------------+
|        1 | Rahul        | 2026-09-02 15:00:00 | 2026-09-02 12:00:00 |
|        2 | Priya        | 2026-09-02 18:00:00 | 2026-09-02 14:00:00 |
|        3 | Amit         | 2026-09-03 20:00:00 | 2026-09-03 16:00:00 |
|        4 | Vikas        | 2026-09-02 02:47:02 | 2026-09-01 23:47:02 |
+----------+--------------+---------------------+---------------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO MovieTickets (CustomerName, ShowTime, BookingTime)
    -> VALUES
    -> ('Sneha', '2026-09-02 13:00:00', '2026-09-02 12:00:00');
ERROR 1644 (45000): ShowTime must be at least 2 hours after BookingTime




Retrieve all upcoming movie shows.



mysql> select * from  MovieTickets;

+----------+--------------+---------------------+---------------------+
| TicketID | CustomerName | ShowTime            | bookingtime         |
+----------+--------------+---------------------+---------------------+
|        1 | Rahul        | 2026-09-02 15:00:00 | 2026-09-02 12:00:00 |
|        2 | Priya        | 2026-09-02 18:00:00 | 2026-09-02 14:00:00 |
|        3 | Amit         | 2026-09-03 20:00:00 | 2026-09-03 16:00:00 |
|        4 | Vikas        | 2026-09-02 02:47:02 | 2026-09-01 23:47:02 |
+----------+--------------+---------------------+---------------------+
4 rows in set (0.00 sec)
