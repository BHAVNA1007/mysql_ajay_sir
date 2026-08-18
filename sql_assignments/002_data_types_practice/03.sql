Assignment 2 — Library Management System

Design and create a Library Management System database in MySQL.

In this assignment, you have to think and decide everything.

You will be given only the requirements. You must decide:

Database name
Table names
Column names
Data types
Primary keys
Auto-increment
Default values
Appropriate constraints/data types
Scenario

A college wants to develop a Library Management System to maintain information about books, students, and book transactions.

The system should store the following information:

1. Books

The library wants to maintain:

Unique identification of every book
Book title
Author name
ISBN number
Price
Number of available copies
Book category
Publication date
Whether the book is currently available
A short description of the book
2. Students

The library wants to maintain:

Unique identification of every student
Student name
Enrollment/registration number
Age
Gender
Date of birth
Contact number
Email
Whether the student is currently active
Student registration date
3. Book Issue/Return

Whenever a student takes a book from the library, the system should record:

Which student took the book
Which book was issued
Issue date
Expected return date
Actual return date
Fine amount, if applicable
Whether the book has been returned
Any additional remarks
Date and time when the transaction was created
Requirements
Decide how many tables are required.
Decide the name of each table.
Decide all column names yourself.
Select the most appropriate MySQL data type for every column.
Decide which columns should be PRIMARY KEY.
Decide where AUTO_INCREMENT is appropriate.
Decide where UNSIGNED is appropriate.
Decide which fields should use ENUM, BOOLEAN, DATE, DATETIME, DECIMAL, etc.
Create all tables using DDL.
Insert at least 10 books, 10 students and 15 issue/return transactions.