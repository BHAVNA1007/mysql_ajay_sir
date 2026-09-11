QNO 3:
A library maintains a record of books and their authors. If an author is removed, their books should not be deleted, but their author information should be set to NULL.

Tasks:
Create an Authors table:

AuthorID (PRIMARY KEY, AUTO_INCREMENT)
AuthorName (NOT NULL, UNIQUE)


Create a Books table:
BookID (PRIMARY KEY, AUTO_INCREMENT)
BookTitle (NOT NULL, UNIQUE)
AuthorID (FOREIGN KEY )
Insert sample data (at least 3 authors and 5 books).

Delete an author and check if books remain, but the AuthorID is set to NULL.

Update the author of a book to a new author.



mysql> create  table Authors (AuthorID INT PRIMARY KEY AUTO_INCREMENT, AuthorName VARCHAR(30) NOT NULL UNIQUE);

--Query OK, 0 rows affected (0.05 sec)


mysql> create table Books (BookID INT PRIMARY KEY AUTO_INCREMENT, BookTitle  VARCHAR(20) NOT NULL UNIQUE, AuthorID INT, FOREIGN KEY (AuthorID) references  Authors(AuthorID) on delete set null on update cascade);

--Query OK, 0 rows affected (0.07 sec)


mysql> desc Authors;

--+------------+-------------+------+-----+---------+----------------+
--| Field      | Type        | Null | Key | Default | Extra          |
--+------------+-------------+------+-----+---------+----------------+
--| AuthorID   | int         | NO   | PRI | NULL    | auto_increment |
--| AuthorName | varchar(30) | NO   | UNI | NULL    |                |
--+------------+-------------+------+-----+---------+----------------+
--2 rows in set (0.00 sec)




mysql> desc Books;

--+-----------+-------------+------+-----+---------+----------------+
--| Field     | Type        | Null | Key | Default | Extra          |
--+-----------+-------------+------+-----+---------+----------------+
--| BookID    | int         | NO   | PRI | NULL    | auto_increment |
--| BookTitle | varchar(20) | NO   | UNI | NULL    |                |
--| AuthorID  | int         | YES  | MUL | NULL    |                |
--+-----------+-------------+------+-----+---------+----------------+
--3 rows in set (0.00 sec)



mysql> INSERT INTO Authors (AuthorName)
    -> VALUES
    -> ('J.K. Rowling'),
    -> ('George Orwell'),
    -> ('Chetan Bhagat');

--Query OK, 3 rows affected (0.01 sec)
--Records: 3  Duplicates: 0  Warnings: 0



mysql> INSERT INTO Books (BookTitle, AuthorID)
    -> VALUES
    -> ('Harry Potter', 1),
    -> ('1984', 2),
    -> ('Animal Farm', 2),
    -> ('Five Point Someone', 3),
    -> ('Half Girlfriend', 3);

--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0




mysql> SELECT * FROM Authors;

--+----------+---------------+
--| AuthorID | AuthorName    |
--+----------+---------------+
--|        3 | Chetan Bhagat |
--|        2 | George Orwell |
--|        1 | J.K. Rowling  |
--+----------+---------------+
--3 rows in set (0.00 sec)




mysql> SELECT * FROM Books;

--+--------+--------------------+----------+
--| BookID | BookTitle          | AuthorID |
--+--------+--------------------+----------+
--|      1 | Harry Potter       |        1 |
--|      2 | 1984               |        2 |
--|      3 | Animal Farm        |        2 |
--|      4 | Five Point Someone |        3 |
--|      5 | Half Girlfriend    |        3 |
--+--------+--------------------+----------+
--5 rows in set (0.00 sec)




mysql> delete from authors where AuthorID = 1;

--Query OK, 1 row affected (0.01 sec)



mysql> SELECT * FROM Authors;

--+----------+---------------+
--| AuthorID | AuthorName    |
--+----------+---------------+
--|        3 | Chetan Bhagat |
--|        2 | George Orwell |
--+----------+---------------+
--2 rows in set (0.00 sec)



mysql> update authors set AuthorID = 10 where AuthorID = 3;

--Query OK, 1 row affected (0.01 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> SELECT * FROM Authors;

--+----------+---------------+
--| AuthorID | AuthorName    |
--+----------+---------------+
--|       10 | Chetan Bhagat |
--|        2 | George Orwell |
--+----------+---------------+
--2 rows in set (0.00 sec)



mysql> SELECT * FROM Books;

--+--------+--------------------+----------+
--| BookID | BookTitle          | AuthorID |
--+--------+--------------------+----------+
--|      1 | Harry Potter       |     NULL |
--|      2 | 1984               |        2 |
--|      3 | Animal Farm        |        2 |
--|      4 | Five Point Someone |       10 |
--|      5 | Half Girlfriend    |       10 |
--+--------+--------------------+----------+
--5 rows in set (0.00 sec)




QNO 4:
A university wants to track students exam results. If a student is deleted, their results should also be deleted.
Tasks:
Create a Students table:
StudentID (PRIMARY KEY, AUTO_INCREMENT)
StudentName (NOT NULL)

Create an Exams table:
ExamID (PRIMARY KEY, AUTO_INCREMENT)
SubjectName (NOT NULL, UNIQUE)

Create a Results table:
ResultID (PRIMARY KEY, AUTO_INCREMENT)
StudentID (FOREIGN key)
ExamID (FOREIGN KEY)
Score (NOT NULL, CHECK Score BETWEEN 0 AND 100)

Insert sample data (at least 3 students, 3 exams, and 5 results).

Delete a student and check if their results are removed automatically.


Update an exam’s subject name and observe the effect.




mysql> create table  Students ( StudentID INT PRIMARY KEY AUTO_INCREMENT, StudentName VARCHAR(20) NOT NULL);

--Query OK, 0 rows affected (0.04 sec)



mysql> create table Exams (ExamID INT PRIMARY KEY AUTO_INCREMENT, SubjectName VARCHAR(30) NOT NULL UNIQUE);

--Query OK, 0 rows affected (0.05 sec)




mysql> create table Results (ResultID INT PRIMARY KEY AUTO_INCREMENT, StudentID INT,constraint f_k1 FOREIGN key (StudentID) references Students(StudentID),ExamID INT, constraint f_k2 FOREIGN KEY (ExamID)  references Exams(ExamID), score decimal(10,2) not null check(score between 0 AND 100));

--Query OK, 0 rows affected (0.08 sec)


mysql> desc Students;

--+-------------+-------------+------+-----+---------+----------------+
--| Field       | Type        | Null | Key | Default | Extra          |
--+-------------+-------------+------+-----+---------+----------------+
--| StudentID   | int         | NO   | PRI | NULL    | auto_increment |
--| StudentName | varchar(20) | NO   |     | NULL    |                |
--+-------------+-------------+------+-----+---------+----------------+
--2 rows in set (0.00 sec)




mysql> desc Exams;

--+-------------+-------------+------+-----+---------+----------------+
--| Field       | Type        | Null | Key | Default | Extra          |
--+-------------+-------------+------+-----+---------+----------------+
--| ExamID      | int         | NO   | PRI | NULL    | auto_increment |
--| SubjectName | varchar(30) | NO   | UNI | NULL    |                |
--+-------------+-------------+------+-----+---------+----------------+
--2 rows in set (0.00 sec)




mysql> desc Results;

--+-----------+---------------+------+-----+---------+----------------+
--| Field     | Type          | Null | Key | Default | Extra          |
--+-----------+---------------+------+-----+---------+----------------+
--| ResultID  | int           | NO   | PRI | NULL    | auto_increment |
--| StudentID | int           | YES  | MUL | NULL    |                |
--| ExamID    | int           | YES  | MUL | NULL    |                |
--| score     | decimal(10,2) | NO   |     | NULL    |                |
--+-----------+---------------+------+-----+---------+----------------+
--4 rows in set (0.00 sec)



mysql> INSERT INTO Exams (SubjectName)
    -> VALUES
    -> ('Mathematics'),
    -> ('Java'),
    -> ('MySQL');

--Query OK, 3 rows affected (0.01 sec)
--Records: 3  Duplicates: 0  Warnings: 0




mysql> INSERT INTO Results (StudentID, ExamID, score)
    -> VALUES
    -> (1, 1, 85.50),
    -> (1, 2, 78.00),
    -> (2, 1, 92.00),
    -> (2, 3, 88.50),
    -> (3, 2, 74.00);
    
--ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`f_key_assignment`.`results`, CONSTRAINT `f_k1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`))




mysql> INSERT INTO Students (StudentName)
    -> VALUES
    -> ('Rahul'),
    -> ('Priya'),
    -> ('Amit');

--Query OK, 3 rows affected (0.01 sec)
--Records: 3  Duplicates: 0  Warnings: 0




mysql> INSERT INTO Results (StudentID, ExamID, score)
    -> VALUES
    -> (1, 1, 85.50),
    -> (1, 2, 78.00),
    -> (2, 1, 92.00),
    -> (2, 3, 88.50),
    -> (3, 2, 74.00);

--Query OK, 5 rows affected (0.01 sec)
--Records: 5  Duplicates: 0  Warnings: 0



mysql> select * from Exams;

--+--------+-------------+
--| ExamID | SubjectName |
--+--------+-------------+
--|      2 | Java        |
--|      1 | Mathematics |
--|      3 | MySQL       |
--+--------+-------------+
--3 rows in set (0.00 sec)



mysql> select * from Students;

--+-----------+-------------+
--| StudentID | StudentName |
--+-----------+-------------+
--|         1 | Rahul       |
--|         2 | Priya       |
--|         3 | Amit        |
--+-----------+-------------+
--3 rows in set (0.00 sec)




mysql> select * from  Results;

--+----------+-----------+--------+-------+
--| ResultID | StudentID | ExamID | score |
--+----------+-----------+--------+-------+
--|        6 |         1 |      1 | 85.50 |
--|        7 |         1 |      2 | 78.00 |
--|        8 |         2 |      1 | 92.00 |
--|        9 |         2 |      3 | 88.50 |
--|       10 |         3 |      2 | 74.00 |
--+----------+-----------+--------+-------+
--5 rows in set (0.00 sec)





mysql> Alter table results DROP FOREIGN KEY f_k1,  DROP FOREIGN KEY f_k2;
--Query OK, 0 rows affected (0.02 sec)
--Records: 0  Duplicates: 0  Warnings: 0




mysql> ALTER TABLE results add constraint f_k1 FOREIGN KEY (StudentID) references students(StudentID) ON DELETE CASCADE ON UPDATE CASCADE, ADD CONSTRAINT f_k2 FOREIGN KEY (ExamID) references Exams(ExamID) ON DELETE CASCADE ON UPDATE CASCADE;
--Query OK, 5 rows affected (0.10 sec)
--Records: 5  Duplicates: 0  Warnings: 0





mysql> delete from students where StudentID = 3;
--Query OK, 1 row affected (0.01 sec)



mysql> select * from Results;

--+----------+-----------+--------+-------+
--| ResultID | StudentID | ExamID | score |
--+----------+-----------+--------+-------+
--|        6 |         1 |      1 | 85.50 |
--|        7 |         1 |      2 | 78.00 |
--|        8 |         2 |      1 | 92.00 |
--|        9 |         2 |      3 | 88.50 |
--+----------+-----------+--------+-------+
--4 rows in set (0.00 sec)



mysql> delete from students where StudentID = 4;
--Query OK, 0 rows affected (0.00 sec)



mysql> select * from Results;

--+----------+-----------+--------+-------+
--| ResultID | StudentID | ExamID | score |
--+----------+-----------+--------+-------+
--|        6 |         1 |      1 | 85.50 |
--|        7 |         1 |      2 | 78.00 |
--|        8 |         2 |      1 | 92.00 |
--|        9 |         2 |      3 | 88.50 |
--+----------+-----------+--------+-------+
--4 rows in set (0.00 sec)



Update an exam’s subject name and observe the effect.


mysql> update Exams set  SubjectName = 'React' where ExamID = 1;

--Query OK, 1 row affected (0.01 sec)
--Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from Exams;

--+--------+-------------+
--| ExamID | SubjectName |
--+--------+-------------+
--|      2 | Java        |
--|      3 | MySQL       |
--|      1 | React       |
--+--------+-------------+
--3 rows in set (0.00 sec)