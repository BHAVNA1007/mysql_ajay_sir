============================================================
9. RELATIONSHIPS TO IDENTIFY
============================================================

Identify and implement the following relationships:

1. Department -> Doctor  1: N

ONE department can have many doctors.
LIKE : CORDIOLOGY 

DOC 1
DOC 2...


2. Patient -> Appointment 1: N

One   Patient can have multiple appointments
LIKE : Patient 101

Appointment 1 
Appointment 2...



3. Doctor -> Appointment  1: N

4. Department -> Appointment  1: N

5. Appointment -> Prescription 1:N

6. Patient -> Prescription 1:N

7. Doctor -> Prescription 1:N

8. Prescription -> Prescription_Medicine M:N

PRESCRIPTION_MEDICINE IS a bridge table 

1 Prescription  Prescription_Medicine   1 Medicine


9. Medicine -> Prescription_Medicine 1:N





*****************************************************************************************
