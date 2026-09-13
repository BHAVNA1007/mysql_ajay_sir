============================================================
14. IMPORTANT QUESTIONS TO ANSWER
============================================================

Answer the following questions in your submission.

1. Why does the appointment table contain multiple foreign keys?

Because an appointment is connected to multiple entities in my hospital database.

For example, one appointment needs to know:

Appointment
   │
   ├── patient_id     → Patient
   ├── doctor_id      → Doctor
   └── department_id  → Department

Suppose:

appointment_id = 501
patient_id     = 101
doctor_id      = 201
department_id  = 301

This means:

Appointment 501 is for Patient 101, with Doctor 201, in Department 301.   

So the appointment table contains 3 foreign keys.

*************************************************************************








2. Which tables are parent tables and which are child tables?

| Parent table   | Child table             | Foreign key                             |
| -------------- | ----------------------- | --------------------------------------- |
| `DEPARTMENT`   | `DOCTOR`                | `doctor.department_id`                  |
| `PATIENT`      | `APPOINTMENT`           | `appointment.patient_id`                |
| `DOCTOR`       | `APPOINTMENT`           | `appointment.doctor_id`                 |
| `DEPARTMENT`   | `APPOINTMENT`           | `appointment.department_id`             |
| `APPOINTMENT`  | `PRESCRIPTION`          | `prescription.appointment_id`           |
| `PATIENT`      | `PRESCRIPTION`          | `prescription.patient_id`               |
| `DOCTOR`       | `PRESCRIPTION`          | `prescription.doctor_id`                |
| `PRESCRIPTION` | `PRESCRIPTION_MEDICINE` | `prescription_medicine.prescription_id` |
| `MEDICINE`     | `PRESCRIPTION_MEDICINE` | `prescription_medicine.medicine_id`     |

The table whose primary key is being referenced = Parent table.
The table containing the foreign key = Child table.

*************************************************************************







3. What is the relationship between Patient and Appointment?

1:N ONE TO MANY

1 Patient CAN HAVE MULTIPLE Appointments

*************************************************************




4. What is the relationship between Doctor and Appointment?

1:N ONE TO MANY

1 Doctor CAN HAVE MULTIPLE Appointments

***************************************************************



5. What is the relationship between Prescription and Medicine?


Prescription ↔ Medicine = Many-to-Many (M:N)

Think about it this way:

One Prescription can contain many medicines.
One Medicine can be included in many prescriptions.

Example:

Prescription 601
   ├── Medicine 401 (Paracetamol)
   ├── Medicine 402 (Azithromycin)
   └── Medicine 403 (Cetirizine)

And:

Medicine 401 (Paracetamol)
   ├── Prescription 601
   ├── Prescription 602
   └── Prescription 605

And thats why I created the bridge table:

PRESCRIPTION
      │
      │ 1:N
      ↓
PRESCRIPTION_MEDICINE
      ↑
      │ 1:N
      │
   MEDICINE   
***************************************************************




6. Why is prescription_medicine required?


Because Prescription and Medicine have a many-to-many (M:N) relationship.

Suppose prescription 601 contains 3 medicines:

Prescription 601
   ├── Medicine 401
   ├── Medicine 402
   └── Medicine 403

And Medicine 401 can appear in many prescriptions:

Medicine 401
   ├── Prescription 601
   ├── Prescription 602
   └── Prescription 605

If we directly put medicine_id inside PRESCRIPTION, we would have a problem because one prescription can contain multiple medicines.

If we put prescription_id inside MEDICINE, we would have the opposite problem because one medicine can belong to many prescriptions.

So we create a third/bridge table:

PRESCRIPTION
      │
      │ 1:N
      ↓
PRESCRIPTION_MEDICINE
      ↑
      │ 1:N
      │
   MEDICINE

Your table:

PRESCRIPTION_MEDICINE
---------------------
prescription_id
medicine_id
dosage
duration_days
quantity
And there is another important reason

dosage, duration_days, and quantity belong to the relationship between a particular prescription and a particular medicine.

For example:

Prescription 601 + Paracetamol
→ dosage: 1-0-1
→ duration: 5 days
→ quantity: 10

The same Paracetamol could be prescribed to another patient with a different dosage:

Prescription 602 + Paracetamol
→ dosage: 1-1-1
→ duration: 3 days
→ quantity: 9

So these details cannot belong permanently to the MEDICINE table.

Thats the real purpose of PRESCRIPTION_MEDICINE: it connects a prescription with its medicines and stores the details of that particular prescription of that medicine.
***************************************************************************





7. Why is prescription_medicine using a composite primary key?

PRIMARY KEY (prescription_id, medicine_id)

because one prescription can contain many medicines, and we need to uniquely identify each prescription–medicine combination.

| prescription_id | medicine_id |
| --------------: | ----------: |
|             601 |         401 |
|             601 |         402 |
|             601 |         403 |
|             602 |         401 |

Here, prescription_id alone is not unique because 601 appears multiple times.

And medicine_id alone is not unique because 401 appears in multiple prescriptions.

But the combination is unique:

(601, 401)  ← unique
(601, 402)  ← unique
(601, 403)  ← unique
(602, 401)  ← unique

So:

prescription_id + medicine_id together uniquely identify one medicine within one prescription.

What problem does it prevent?

Suppose this already exists:

601 | 401

If we try:

INSERT INTO prescription_medicine
VALUES (601, 401, '1-0-1', 5, 10);

again, MySQL rejects it because (601, 401) already exists.

*******************************************************************************







8. Why should deleting a doctor NOT delete historical appointments?


Because an appointment is a historical record. Even if a doctor leaves the hospital, we usually need to keep the doctors past appointments for:

patient medical history
hospital records
billing/audit purposes
reports and statistics
knowing which doctor treated the patient in the past

************************************************************************






9. Why is ON DELETE SET NULL suitable for Department -> Doctor?

Because deleting a department does not mean the doctors themselves should disappear.

For example, the hospital may close the Cardiology Department, but Dr. Sharma may still work in the hospital and can later be assigned to another department.

So:

ON DELETE CASCADE 
Department deleted
        ↓
Doctors deleted

would be dangerous.

Whereas:

ON DELETE SET NULL 
Department deleted
        ↓
Doctors remain
        ↓
department_id becomes NULL

then ON DELETE SET NULL cannot work, because MySQL cannot put NULL into that column.

**********************************************************************




10. Why is ON DELETE CASCADE suitable for Patient -> Appointment
    in the given test-data scenario?





*************************************************************************









11. Why can ON DELETE CASCADE be dangerous for Medicine ->
    Prescription_Medicine?
Because PRESCRIPTION_MEDICINE contains the history of which medicines were prescribed.

ON DELETE CASCADE can be dangerous for Medicine → Prescription_Medicine because deleting a medicine would automatically delete all records showing that the medicine was used in past prescriptions.

Therefore:

ON DELETE RESTRICT

is safer because it prevents deleting a medicine that is already referenced in prescriptions.

************************************************************************









12. What is the difference between ON DELETE CASCADE and
    ON DELETE SET NULL?


| `ON DELETE CASCADE`                     | `ON DELETE SET NULL`                |
| --------------------------------------- | ----------------------------------- |
| Deletes the **child records**           | Keeps the **child records**         |
| Relationship and child data are removed | Only the foreign key becomes `NULL` |
| Child FK column can be `NOT NULL`       | FK column **must allow `NULL`**     |



CASCADE = Parent deleted → Child deleted
SET NULL = Parent deleted → Child stays, connection becomes NULL
***************************************************************************





13. What is the difference between ON UPDATE CASCADE and
    ON UPDATE SET NULL?


| `ON UPDATE CASCADE`                | `ON UPDATE SET NULL`        |
| ---------------------------------- | --------------------------- |
| Updates the child FK automatically | Sets the child FK to `NULL` |
| Keeps the relationship             | Removes the relationship    |
| FK can usually be `NOT NULL`       | FK must allow `NULL`        |


CASCADE = update the child value too.
SET NULL = remove the child’s reference by setting it to NULL.

*********************************************************************






14. What happens if you try to insert a child record with a
    non-existing parent ID?


The INSERT will fail because of the foreign key constraint.

Parent must exist before the child can reference it.

************************************************************************






15. What happens if you try to delete a parent record when
    ON DELETE RESTRICT is configured?


The DELETE operation fails if the parent record is being referenced by any child record.

Example:

Department 101
     ↓
Doctor 201
Doctor 202

If the foreign key has:

ON DELETE RESTRICT

and we run:

DELETE FROM department
WHERE department_id = 101;

MySQL will reject the deletion because doctors still reference Department 101.

we get an error like:

ERROR 1451:
Cannot delete or update a parent row


ON DELETE RESTRICT = Parent cannot be deleted while child records depend on it.


**********************************************************************************