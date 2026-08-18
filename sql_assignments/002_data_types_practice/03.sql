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



****************************************************************

mysql> create database Library_Management;
Query OK, 1 row affected (0.01 sec)

mysql> use Library_Management;
Database changed

mysql> create table Books(book_id int auto_increment primary key, Book_title varchar(30), Author_name varchar(50), ISBN_number char(6), Price decimal(5,2), book_stock smallint, Book_category varchar(10), Publication date, availability enum('available','not_available'), book_description tinytext);
Query OK, 0 rows affected (0.04 sec)

mysql> desc Books;
+------------------+-----------------------------------+------+-----+---------+----------------+
| Field            | Type                              | Null | Key | Default | Extra          |
+------------------+-----------------------------------+------+-----+---------+----------------+
| book_id          | int                               | NO   | PRI | NULL    | auto_increment |
| Book_title       | varchar(30)                       | YES  |     | NULL    |                |
| Author_name      | varchar(50)                       | YES  |     | NULL    |                |
| ISBN_number      | char(6)                           | YES  |     | NULL    |                |
| Price            | decimal(5,2)                      | YES  |     | NULL    |                |
| book_stock       | smallint                          | YES  |     | NULL    |                |
| Book_category    | varchar(10)                       | YES  |     | NULL    |                |
| Publication      | date                              | YES  |     | NULL    |                |
| availability     | enum('available','not_available') | YES  |     | NULL    |                |
| book_description | tinytext                          | YES  |     | NULL    |                |
+------------------+-----------------------------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)


********************
 TABLE 1.  FOR BOOKS
********************

mysql> INSERT INTO Books
    -> (book_title, Author_name, ISBN_number, Price, book_stock, Book_category, Publication_date, availability, book_description)
    -> VALUES
    -> ('The Alchemist', 'Paulo Coelho', 'ISBN01', 399.00, 25, 'Fiction', '1988-04-15', 'available', 'A story about dreams and destiny'),
    ->
    -> ('Atomic Habits', 'James Clear', 'ISBN02', 550.00, 40, 'SelfHelp', '2018-10-16', 'available', 'A guide to building good habits'),
    ->
    -> ('Clean Code', 'Robert Martin', 'ISBN03', 699.00, 15, 'Technology', '2008-08-01', 'available', 'A book about writing clean software'),
    ->
    -> ('Rich Dad Poor Dad', 'Robert Kiyosaki', 'ISBN04', 450.00, 30, 'Finance', '1997-04-01', 'available', 'A book about financial education'),
    ->
    -> ('Wings of Fire', 'A P J Abdul Kalam', 'ISBN05', 299.00, 50, 'Biography', '1999-01-01', 'available', 'Autobiography of A P J Abdul Kalam'),
    ->
    -> ('Ikigai', 'Hector Garcia', 'ISBN06', 350.00, 20, 'SelfHelp', '2016-09-01', 'available', 'A book about finding purpose in life'),
    ->
    -> ('The Hobbit', 'J R R Tolkien', 'ISBN07', 499.00, 12, 'Fantasy', '1937-09-21', 'available', 'A fantasy adventure story'),
    ->
    -> ('Python Crash', 'Eric Matthes', 'ISBN08', 650.00, 18, 'Technology', '2016-01-01', 'available', 'Introduction to Python programming'),
    ->
    -> ('Think and Grow', 'Napoleon Hill', 'ISBN09', 320.00, 35, 'Finance', '1937-03-01', 'available', 'A book about success and mindset'),
    ->
    -> ('Harry Potter', 'J K Rowling', 'ISBN10', 599.00, 0, 'Fantasy', '1997-06-26', 'not_available', 'A magical adventure story');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0


mysql> select * from Books;
+---------+-------------------+-------------------+-------------+--------+------------+---------------+------------------+---------------+--------------------------------------+
| book_id | Book_title        | Author_name       | ISBN_number | Price  | book_stock | Book_category | Publication_date | availability  | book_description                     |
+---------+-------------------+-------------------+-------------+--------+------------+---------------+------------------+---------------+--------------------------------------+
|       1 | The Alchemist     | Paulo Coelho      | ISBN01      | 399.00 |         25 | Fiction       | 1988-04-15       | available     | A story about dreams and destiny     |
|       2 | Atomic Habits     | James Clear       | ISBN02      | 550.00 |         40 | SelfHelp      | 2018-10-16       | available     | A guide to building good habits      |
|       3 | Clean Code        | Robert Martin     | ISBN03      | 699.00 |         15 | Technology    | 2008-08-01       | available     | A book about writing clean software  |
|       4 | Rich Dad Poor Dad | Robert Kiyosaki   | ISBN04      | 450.00 |         30 | Finance       | 1997-04-01       | available     | A book about financial education     |
|       5 | Wings of Fire     | A P J Abdul Kalam | ISBN05      | 299.00 |         50 | Biography     | 1999-01-01       | available     | Autobiography of A P J Abdul Kalam   |
|       6 | Ikigai            | Hector Garcia     | ISBN06      | 350.00 |         20 | SelfHelp      | 2016-09-01       | available     | A book about finding purpose in life |
|       7 | The Hobbit        | J R R Tolkien     | ISBN07      | 499.00 |         12 | Fantasy       | 1937-09-21       | available     | A fantasy adventure story            |
|       8 | Python Crash      | Eric Matthes      | ISBN08      | 650.00 |         18 | Technology    | 2016-01-01       | available     | Introduction to Python programming   |
|       9 | Think and Grow    | Napoleon Hill     | ISBN09      | 320.00 |         35 | Finance       | 1937-03-01       | available     | A book about success and mindset     |
|      10 | Harry Potter      | J K Rowling       | ISBN10      | 599.00 |          0 | Fantasy       | 1997-06-26       | not_available | A magical adventure story            |
+---------+-------------------+-------------------+-------------+--------+------------+---------------+------------------+---------------+--------------------------------------+
10 rows in set (0.00 sec)




********************
TABLE 2 FOR STUDENTS
********************


mysql> create table Students(student_id int auto_increment primary key, Student_name varchar(30), Enrollment varchar(10), age tinyint unsigned, Gender enum('Male','Female'), dob date, Contact_number varchar(12), Email varchar(50), student_status enum('active','inactive'), student_registration datetime);
Query OK, 0 rows affected (0.04 sec)


mysql> INSERT INTO Students
    -> (Student_name, Enrollment, age, Gender, dob, Contact_number, Email, student_status, student_registration)
    -> VALUES
    -> ('Rahul Sharma', 'ENR001', 21, 'Male', '2005-03-15', '9876543210', 'rahul.sharma@gmail.com', 'active', '2026-01-10 09:30:00'),
    -> ('Priya Verma', 'ENR002', 20, 'Female', '2006-07-22', '9876543211', 'priya.verma@gmail.com', 'active', '2026-01-11 10:15:00'),
    -> ('Amit Patel', 'ENR003', 22, 'Male', '2004-05-18', '9876543212', 'amit.patel@gmail.com', 'active', '2026-01-12 11:20:00'),
    -> ('Neha Singh', 'ENR004', 19, 'Female', '2007-01-10', '9876543213', 'neha.singh@gmail.com', 'active', '2026-01-13 09:45:00'),
    -> ('Rohit Gupta', 'ENR005', 23, 'Male', '2003-11-25', '9876543214', 'rohit.gupta@gmail.com', 'inactive', '2026-01-14 12:10:00'),
    -> ('Sneha Joshi', 'ENR006', 21, 'Female', '2005-02-14', '9876543215', 'sneha.joshi@gmail.com', 'active', '2026-01-15 10:30:00'),
    -> ('Vikas Yadav', 'ENR007', 20, 'Male', '2006-09-05', '9876543216', 'vikas.yadav@gmail.com', 'active', '2026-01-16 11:00:00'),
    -> ('Anjali Mehta', 'ENR008', 22, 'Female', '2004-06-30', '9876543217', 'anjali.mehta@gmail.com', 'active', '2026-01-17 09:15:00'),
    -> ('Karan Malviya', 'ENR009', 24, 'Male', '2002-12-12', '9876543218', 'karan.malviya@gmail.com', 'inactive', '2026-01-18 14:20:00'),
    -> ('Pooja Tiwari', 'ENR010', 19, 'Female', '2007-04-08', '9876543219', 'pooja.tiwari@gmail.com', 'active', '2026-01-19 10:45:00'),
    -> ('Simran Gupta', 'ENR020', 19, 'Female', '2007-02-02', '9876543229', 'simran.gupta@gmail.com', 'active', '2026-01-29 09:40:00');
Query OK, 11 rows affected (0.03 sec)
Records: 11  Duplicates: 0  Warnings: 0


mysql> desc students;
+----------------------+---------------------------+------+-----+---------+----------------+
| Field                | Type                      | Null | Key | Default | Extra          |
+----------------------+---------------------------+------+-----+---------+----------------+
| student_id           | int                       | NO   | PRI | NULL    | auto_increment |
| Student_name         | varchar(30)               | YES  |     | NULL    |                |
| Enrollment           | varchar(10)               | YES  |     | NULL    |                |
| age                  | tinyint unsigned          | YES  |     | NULL    |                |
| Gender               | enum('Male','Female')     | YES  |     | NULL    |                |
| dob                  | date                      | YES  |     | NULL    |                |
| Contact_number       | varchar(12)               | YES  |     | NULL    |                |
| Email                | varchar(50)               | YES  |     | NULL    |                |
| student_status       | enum('active','inactive') | YES  |     | NULL    |                |
| student_registration | datetime                  | YES  |     | NULL    |                |
+----------------------+---------------------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)



mysql> select * from students;
+------------+---------------+------------+------+--------+------------+----------------+-------------------------+----------------+----------------------+
| student_id | Student_name  | Enrollment | age  | Gender | dob        | Contact_number | Email                   | student_status | student_registration |
+------------+---------------+------------+------+--------+------------+----------------+-------------------------+----------------+----------------------+
|          1 | Rahul Sharma  | ENR001     |   21 | Male   | 2005-03-15 | 9876543210     | rahul.sharma@gmail.com  | active         | 2026-01-10 09:30:00  |
|          2 | Priya Verma   | ENR002     |   20 | Female | 2006-07-22 | 9876543211     | priya.verma@gmail.com   | active         | 2026-01-11 10:15:00  |
|          3 | Amit Patel    | ENR003     |   22 | Male   | 2004-05-18 | 9876543212     | amit.patel@gmail.com    | active         | 2026-01-12 11:20:00  |
|          4 | Neha Singh    | ENR004     |   19 | Female | 2007-01-10 | 9876543213     | neha.singh@gmail.com    | active         | 2026-01-13 09:45:00  |
|          5 | Rohit Gupta   | ENR005     |   23 | Male   | 2003-11-25 | 9876543214     | rohit.gupta@gmail.com   | inactive       | 2026-01-14 12:10:00  |
|          6 | Sneha Joshi   | ENR006     |   21 | Female | 2005-02-14 | 9876543215     | sneha.joshi@gmail.com   | active         | 2026-01-15 10:30:00  |
|          7 | Vikas Yadav   | ENR007     |   20 | Male   | 2006-09-05 | 9876543216     | vikas.yadav@gmail.com   | active         | 2026-01-16 11:00:00  |
|          8 | Anjali Mehta  | ENR008     |   22 | Female | 2004-06-30 | 9876543217     | anjali.mehta@gmail.com  | active         | 2026-01-17 09:15:00  |
|          9 | Karan Malviya | ENR009     |   24 | Male   | 2002-12-12 | 9876543218     | karan.malviya@gmail.com | inactive       | 2026-01-18 14:20:00  |
|         10 | Pooja Tiwari  | ENR010     |   19 | Female | 2007-04-08 | 9876543219     | pooja.tiwari@gmail.com  | active         | 2026-01-19 10:45:00  |
|         11 | Simran Gupta  | ENR020     |   19 | Female | 2007-02-02 | 9876543229     | simran.gupta@gmail.com  | active         | 2026-01-29 09:40:00  |
+------------+---------------+------------+------+--------+------------+----------------+-------------------------+----------------+----------------------+
11 rows in set (0.00 sec)



**************************
TABLE 3. FOR library_data
**************************


mysql> create table  library_data(library_id int auto_increment primary key , student_id int, book_id int, Issue_date date, Expected_return date, Actual_return date, fine_amount decimal(8,2) DEFAULT 0, return_status enum('returned','not_returned'), remarks tinytext, transaction datetime DEFAULT CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.03 sec)

mysql> desc library_data;
+-----------------+---------------------------------+------+-----+-------------------+-------------------+
| Field           | Type                            | Null | Key | Default           | Extra             |
+-----------------+---------------------------------+------+-----+-------------------+-------------------+
| library_id      | int                             | NO   | PRI | NULL              | auto_increment    |
| student_id      | int                             | YES  |     | NULL              |                   |
| book_id         | int                             | YES  |     | NULL              |                   |
| Issue_date      | date                            | YES  |     | NULL              |                   |
| Expected_return | date                            | YES  |     | NULL              |                   |
| Actual_return   | date                            | YES  |     | NULL              |                   |
| fine_amount     | decimal(8,2)                    | YES  |     | 0.00              |                   |
| return_status   | enum('returned','not_returned') | YES  |     | NULL              |                   |
| remarks         | tinytext                        | YES  |     | NULL              |                   |
| transaction     | datetime                        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-----------------+---------------------------------+------+-----+-------------------+-------------------+
10 rows in set (0.00 sec)



mysql> INSERT INTO library_data
    -> (student_id, book_id, Issue_date, Expected_return, Actual_return,
    ->  fine_amount, return_status, remarks)
    -> VALUES
    -> (1, 1, '2026-08-01', '2026-08-15', '2026-08-14',
    ->  0.00, 'returned', 'Returned on time'),
    ->
    -> (2, 2, '2026-08-02', '2026-08-16', '2026-08-18',
    ->  20.00, 'returned', 'Returned two days late'),
    ->
    -> (3, 3, '2026-08-03', '2026-08-17', NULL,
    ->  0.00, 'not_returned', 'Book is still with student'),
    ->
    -> (4, 4, '2026-08-04', '2026-08-18', '2026-08-17',
    ->  0.00, 'returned', 'Returned before due date'),
    ->
    -> (5, 5, '2026-08-05', '2026-08-19', NULL,
    ->  0.00, 'not_returned', 'Return pending'),
    ->
    -> (6, 6, '2026-08-06', '2026-08-20', '2026-08-23',
    ->  30.00, 'returned', 'Returned three days late'),
    ->
    -> (7, 7, '2026-08-07', '2026-08-21', '2026-08-20',
    ->  0.00, 'returned', 'Returned in good condition'),
    ->
    -> (8, 8, '2026-08-08', '2026-08-22', NULL,
    ->  0.00, 'not_returned', 'Student has not returned the book'),
    ->
    -> (9, 9, '2026-08-09', '2026-08-23', '2026-08-25',
    ->  20.00, 'returned', 'Returned two days late'),
    ->
    -> (10, 10, '2026-08-10', '2026-08-24', '2026-08-24',
    ->  0.00, 'returned', 'Returned on due date');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0




mysql> select * from library_data;
+------------+------------+---------+------------+-----------------+---------------+-------------+---------------+-----------------------------------+---------------------+
| library_id | student_id | book_id | Issue_date | Expected_return | Actual_return | fine_amount | return_status | remarks                           | transaction         |
+------------+------------+---------+------------+-----------------+---------------+-------------+---------------+-----------------------------------+---------------------+
|          1 |          1 |       1 | 2026-08-01 | 2026-08-15      | 2026-08-14    |        0.00 | returned      | Returned on time                  | 2026-08-19 02:45:10 |
|          2 |          2 |       2 | 2026-08-02 | 2026-08-16      | 2026-08-18    |       20.00 | returned      | Returned two days late            | 2026-08-19 02:45:10 |
|          3 |          3 |       3 | 2026-08-03 | 2026-08-17      | NULL          |        0.00 | not_returned  | Book is still with student        | 2026-08-19 02:45:10 |
|          4 |          4 |       4 | 2026-08-04 | 2026-08-18      | 2026-08-17    |        0.00 | returned      | Returned before due date          | 2026-08-19 02:45:10 |
|          5 |          5 |       5 | 2026-08-05 | 2026-08-19      | NULL          |        0.00 | not_returned  | Return pending                    | 2026-08-19 02:45:10 |
|          6 |          6 |       6 | 2026-08-06 | 2026-08-20      | 2026-08-23    |       30.00 | returned      | Returned three days late          | 2026-08-19 02:45:10 |
|          7 |          7 |       7 | 2026-08-07 | 2026-08-21      | 2026-08-20    |        0.00 | returned      | Returned in good condition        | 2026-08-19 02:45:10 |
|          8 |          8 |       8 | 2026-08-08 | 2026-08-22      | NULL          |        0.00 | not_returned  | Student has not returned the book | 2026-08-19 02:45:10 |
|          9 |          9 |       9 | 2026-08-09 | 2026-08-23      | 2026-08-25    |       20.00 | returned      | Returned two days late            | 2026-08-19 02:45:10 |
|         10 |         10 |      10 | 2026-08-10 | 2026-08-24      | 2026-08-24    |        0.00 | returned      | Returned on due date              | 2026-08-19 02:45:10 |
+------------+------------+---------+------------+-----------------+---------------+-------------+---------------+-----------------------------------+---------------------+
10 rows in set (0.00 sec)
