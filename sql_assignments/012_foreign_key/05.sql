SCENARIO A - DEPARTMENT CLOSED
--------------------------------

Department 104 (Dermatology) is closed permanently.

However, doctors who worked in that department should NOT be deleted.

Their department_id should become NULL.

Requirement:

Department -> Doctor

Use an appropriate ON DELETE action so that:

Doctor remains
department_id becomes NULL



mysql> delete from Department where Department_id = 104;
--Query OK, 1 row affected (0.02 sec)


mysql> select * from Department;
--+---------------+-----------------+----------+
--| department_id | department_name | floor_no |
--+---------------+-----------------+----------+
--|           101 | Cardiology      |        3 |
--|           102 | Neurology       |        4 |
--|           103 | Orthopedics     |        2 |
--+---------------+-----------------+----------+
--3 rows in set (0.00 sec)



mysql> select * from Doctor;
--+-----------+-------------------+----------------+---------------+
--| doctor_id | doctor_name       | specialization | department_id |
--+-----------+-------------------+----------------+---------------+
--|       201 | Dr. Rajesh Sharma | Cardiologist   |           101 |
--|       202 | Dr. Neha Verma    | Neurologist    |           102 |
--|       203 | Dr. Amit Jain     | Orthopedic     |           103 |
--|       204 |  Dr. Priya Singh  | Dermatologist  |          NULL |
--|       205 | Dr. Karan Mehta   | Cardiologist   |           101 |
--+-----------+-------------------+----------------+---------------+
--5 rows in set (0.00 sec)




SCENARIO B - DOCTOR LEAVES THE HOSPITAL
-----------------------------------------

Doctor 203 leaves the hospital.

The hospital wants to retain historical appointment records.

Therefore, deleting the doctor must NOT delete the appointments.

The doctor reference in existing appointments should become NULL.

Requirement:

Doctor -> Appointment

Use:

ON DELETE SET NULL

*********************************************************************
WRONG I HAVE NEED TO CORRECT ON DELETE OPERATIO

mysql> delete from Doctor where doctor_id = 203;
--Query OK, 1 row affected (0.01 sec)



mysql> select * from Doctor;
--+-----------+-------------------+----------------+---------------+
--| doctor_id | doctor_name       | specialization | department_id |
--+-----------+-------------------+----------------+---------------+
--|       201 | Dr. Rajesh Sharma | Cardiologist   |           101 |
--|       202 | Dr. Neha Verma    | Neurologist    |           102 |
--|       204 |  Dr. Priya Singh  | Dermatologist  |          NULL |
--|       205 | Dr. Karan Mehta   | Cardiologist   |           101 |
--+-----------+-------------------+----------------+---------------+
--4 rows in set (0.00 sec)



mysql> select * from Appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            507 | 2026-09-04       | 09:00:00         |        306 |       201 |           101 | Scheduled |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--5 rows in set (0.00 sec)
*******************************************************************


mysql> ALTER TABLE Appointment
    -> DROP FOREIGN KEY app_doctor_key;
--Query OK, 0 rows affected (0.03 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> ALTER TABLE Appointment
    -> MODIFY doctor_id INT NULL;
--Query OK, 0 rows affected (0.12 sec)
--Records: 0  Duplicates: 0  Warnings: 0


mysql> ALTER TABLE Appointment
    -> ADD CONSTRAINT app_doctors_key
    -> FOREIGN KEY (doctor_id)
    -> REFERENCES doctor(doctor_id)
    -> ON DELETE SET NULL;
--Query OK, 5 rows affected (0.11 sec)
--Records: 5  Duplicates: 0  Warnings: 0


mysql> insert into doctor values(203, 'Dr. Amit Jain', 'Orthopedic', 103);
--Query OK, 1 row affected (0.03 sec)


mysql> insert into appointment values(503, '2026-09-02', '09:30', 303, 203, 103, 'Completed'),(506, '2026-09-03', '11:30', 305, 203, 103, 'Completed');
--Query OK, 2 rows affected (0.02 sec)
--Records: 2  Duplicates: 0  Warnings: 0


mysql> select * from appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |       203 |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |       203 |           103 | Completed |
--|            507 | 2026-09-04       | 09:00:00         |        306 |       201 |           101 | Scheduled |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--7 rows in set (0.00 sec)

CORRECT ON DELETE OPERATION 

mysql> delete from Doctor where doctor_id = 203;
--Query OK, 1 row affected (0.01 sec)


mysql> select * from Doctor;
--+-----------+-------------------+----------------+---------------+
--| doctor_id | doctor_name       | specialization | department_id |
--+-----------+-------------------+----------------+---------------+
--|       201 | Dr. Rajesh Sharma | Cardiologist   |           101 |
--|       202 | Dr. Neha Verma    | Neurologist    |           102 |
--|       204 |  Dr. Priya Singh  | Dermatologist  |          NULL |
--|       205 | Dr. Karan Mehta   | Cardiologist   |           101 |
--+-----------+-------------------+----------------+---------------+
--4 rows in set (0.00 sec)


mysql> select * from Appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |      NULL |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |      NULL |           103 | Completed |
--|            507 | 2026-09-04       | 09:00:00         |        306 |       201 |           101 | Scheduled |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--7 rows in set (0.00 sec)

******************************************************************************
******************************************************************************


SCENARIO C - TEST PATIENT IS DELETED
-------------------------------------

Patient 306 is test/demo data and management wants to permanently
remove this patient.

Appointments belonging to this test patient should also be removed.

Requirement:

Patient -> Appointment

Use:

ON DELETE CASCADE


mysql> DELETE FROM Patient WHERE patient_id = 306;
--Query OK, 1 row affected (0.01 sec)


mysql> select * from Patient;
--+------------+--------------+--------+--------+
--| patient_id | patient_name | gender | city   |
--+------------+--------------+--------+--------+
--|        301 | Rahul Verma  | Male   | Indore |
--|        302 | Sneha Sharma | Female | Bhopal |
--|        303 | Amit Patel   | Male   | Indore |
--|        304 | Pooja Gupta  | Female | Ujjain |
--|        305 | Rohan Jain   | Male   | Dewas  |
--+------------+--------------+--------+--------+
--5 rows in set (0.00 sec)



mysql> select * from Appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |      NULL |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |      NULL |           103 | Completed |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--6 rows in set (0.00 sec)


********************************************************************************
********************************************************************************


mysql> select * from APPOINTMENT;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |      NULL |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |      NULL |           103 | Completed |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--6 rows in set (0.00 sec)



mysql> select * from Prescription;
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--| prescription_id | prescription_date | appointment_id | patient_id | doctor_id | remarks            |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--|             601 | 2026-09-01        |            501 |        301 |       201 | BP observation     |
--|             602 | 2026-09-01        |            502 |        302 |       202 | Migraine treatment |
--|             604 | 2026-09-03        |            505 |        301 |       205 | Heart checkup      |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--3 rows in set (0.00 sec)



mysql> delete from Appointment where Appointment_id = 501;
--Query OK, 1 row affected (0.01 sec)



mysql> select * from Appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |      NULL |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |      NULL |           103 | Completed |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--5 rows in set (0.00 sec)



mysql> select * from Prescription;
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--| prescription_id | prescription_date | appointment_id | patient_id | doctor_id | remarks            |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--|             602 | 2026-09-01        |            502 |        302 |       202 | Migraine treatment |
--|             604 | 2026-09-03        |            505 |        301 |       205 | Heart checkup      |
--+-----------------+-------------------+----------------+------------+-----------+--------------------+
--2 rows in set (0.00 sec)


SCENARIO E - PRESCRIPTION IS DELETED
-------------------------------------

Prescription 601 is deleted.

Its records from prescription_medicine should automatically be removed.

Requirement:

Prescription -> Prescription_Medicine

Use:

ON DELETE CASCADE




mysql> select * from Prescription_Medicine;
--+-----------------+-------------+--------+---------------+----------+
--| prescription_id | medicine_id | dosage | duration_days | quantity |
--+-----------------+-------------+--------+---------------+----------+
--|             602 |         403 | 1-0-0  |             7 |        7 |
--|             602 |         406 | 0-0-1  |             5 |        5 |
--|             604 |         401 | 1-0-1  |             3 |        6 |
--|             604 |         403 | 1-0-0  |             3 |        3 |
--+-----------------+-------------+--------+---------------+----------+
--4 rows in set (0.00 sec)

****************************************************************************
****************************************************************************


============================================================
11. ON UPDATE CASCADE
============================================================

The hospital wants to change some department IDs during a data migration.

For example:

101 -> 1001
102 -> 1002
103 -> 1003
104 -> 1004

When a department ID changes, related foreign key values should
automatically change.

For example:

department.department_id
101 -> 1001

The related values in:

doctor.department_id
appointment.department_id

should automatically change from:

101 -> 1001

Requirement:

Use ON UPDATE CASCADE wherever appropriate.

Students must demonstrate this using an UPDATE statement.



mysql> update department set department_id = 1001 where department_id = 101;
--ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`case_study`.`appointment`, CONSTRAINT `app_department_key` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE)



mysql> ALTER TABLE appointment
    -> DROP FOREIGN KEY app_department_key;
--Query OK, 0 rows affected (0.02 sec)
--Records: 0  Duplicates: 0  Warnings: 0



mysql> ALTER TABLE appointment
    -> ADD CONSTRAINT app_department_key
    -> FOREIGN KEY (department_id)
    -> REFERENCES department(department_id)
    -> ON DELETE CASCADE
    -> ON UPDATE CASCADE;
--Query OK, 5 rows affected (0.11 sec)
--Records: 5  Duplicates: 0  Warnings: 0



mysql> update department set department_id = 1001 where department_id = 101;
--Query OK, 1 row affected (0.01 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from department;
--+---------------+-----------------+----------+
--| department_id | department_name | floor_no |
--+---------------+-----------------+----------+
--|           102 | Neurology       |        4 |
--|           103 | Orthopedics     |        2 |
--|          1001 | Cardiology      |        3 |
--+---------------+-----------------+----------+
--3 rows in set (0.00 sec)



mysql> select * from appointment;
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
--|            503 | 2026-09-02       | 09:30:00         |        303 |      NULL |           103 | Completed |
--|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |          1001 | Completed |
--|            506 | 2026-09-03       | 11:30:00         |        305 |      NULL |           103 | Completed |
--|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
--+----------------+------------------+------------------+------------+-----------+---------------+-----------+
--5 rows in set (0.00 sec)


*******************************************************************************
*******************************************************************************

============================================================
12. ON UPDATE SET NULL
============================================================

The hospital also wants to test a different update behavior.

Suppose doctor ID 203 is changed to 250 during an administrative
migration.

For a relationship configured with ON UPDATE SET NULL, the old
doctor reference in child records should become NULL rather than
automatically changing to 250.

Demonstrate:

UPDATE doctor
SET doctor_id = 250
WHERE doctor_id = 203;

Then check the related child records.

Expected behavior for the relationship configured with
ON UPDATE SET NULL:

Old doctor reference -> NULL

Students must explain the difference between:

ON UPDATE CASCADE
and
ON UPDATE SET NULL

ALREDY DELETED DOCTOR 203


TASK 9
------

Test INVALID FOREIGN KEY.

Try inserting a child record using a parent ID that does not exist.

Example:

patient_id = 999

Observe the error and explain why MySQL rejected the record.


mysql> insert into appointment values(509, '2026-09-05', '14:00', 999, 202, 103, 'Scheduled');
--ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`case_study`.`appointment`, CONSTRAINT `app_patient_key` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE)


