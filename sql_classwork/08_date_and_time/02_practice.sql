QNO  1: Create and Populate students Table
Columns:

id INT

name VARCHAR(100)

age INT

gender VARCHAR(10)

address VARCHAR(150)

phone VARCHAR(15)

email VARCHAR(100)

Task:

Insert 5 different student records with dummy data.

QNO  2: Create and Populate books Table
Columns:

book_id INT

title VARCHAR(150)

author VARCHAR(100)

genre VARCHAR(50)

publication_year INT

price DECIMAL(6,2)

publisher VARCHAR(100)

Task:

Insert 4 book records.

QNO  3: ALTER students Table
Task:

Add a column dob DATE

Rename column phone to mobile_number

Modify column age to SMALLINT

Drop column email

QNO  4: RENAME Table
Task:

Rename books table to library_books

QNO  5: TRUNCATE Table
Task:

Truncate all data from students table

QNO  6: DROP Table
Task:

Drop the library_books table

QNO  7: Create and Insert into products Table
Columns:

product_id INT

product_name VARCHAR(100)

category VARCHAR(50)

price DECIMAL(7,2)

stock_quantity INT

supplier_name VARCHAR(100)

manufacture_date DATE

expiry_date DATE

Task:

Insert 6 products (some with expiry dates, some without)

QNO  8: Create and Insert into employees Table
Columns:

emp_id INT

emp_name VARCHAR(100)

gender VARCHAR(10)

dob DATE

department VARCHAR(100)

position VARCHAR(100)

salary DECIMAL(8,2)

joining_date DATE

phone VARCHAR(15)

Task:

Insert 5 employee records




QNO 9:


You are designing a system to store movie reviews. Start with basic details and then evolve the table structure using ALTER, RENAME, TRUNCATE, and DROP, and perform INSERT operations at each stage.

 Initial Table Creation:
Create a table movie_reviews with the following columns:

review_id INT

movie_title VARCHAR(150)

reviewer_name VARCHAR(100)

rating DECIMAL(2,1)

review_text TEXT

 Insert 3 sample movie reviews

Step 1: Add More Columns (ALTER)
Add the following columns using ALTER:

review_date DATE

platform VARCHAR(50) — (e.g., IMDb, Rotten Tomatoes)

likes INT

 Insert 2 more rows with new columns

 Step 2: Rename a Column
Rename the column reviewer_name to critic_name

 Step 3: Modify Column Types
Modify:

rating to DECIMAL(3,1)

movie_title to VARCHAR(200)

 Step 4: Drop an Unnecessary Column
Drop the likes column

 Step 5: Truncate the Table
Truncate the table so all data is removed

 Step 6: Rename the Table
Rename movie_reviews to archived_reviews

 Step 7: Drop the Table
Finally, drop the archived_reviews table









mysql> create database practice;
Query OK, 1 row affected (0.01 sec)

mysql> use practice;
Database changed

mysql> create table students(id INT, name VARCHAR(100), age INT, gender VARCHAR(10), address VARCHAR(150), phone VARCHAR(15), email VARCHAR(100));
Query OK, 0 rows affected (0.04 sec)

mysql> desc students;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int          | YES  |     | NULL    |       |
| name    | varchar(100) | YES  |     | NULL    |       |
| age     | int          | YES  |     | NULL    |       |
| gender  | varchar(10)  | YES  |     | NULL    |       |
| address | varchar(150) | YES  |     | NULL    |       |
| phone   | varchar(15)  | YES  |     | NULL    |       |
| email   | varchar(100) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> insert into students values(101, 'bhavna', 25, 'female', 'indore', 8907654321, 'bhavna@123gmail.com'),(102, 'siya', 24, 'female', 'Bhopal', 867599384, 'siya@456gmail.com'),(103, 'piya', 21, 'female', 'ujjain', 8688730998,'piya789@gmail.com'),(104, 'umesh', 22, 'male', 'nimach', 673846575, 'umesh@123gmail.com'),(105, 'amit', 27, 'male', 'betul', 784758697, 'amit@234gmail.com');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------+--------+------+--------+---------+------------+---------------------+
| id   | name   | age  | gender | address | phone      | email               |
+------+--------+------+--------+---------+------------+---------------------+
|  101 | bhavna |   25 | female | indore  | 8907654321 | bhavna@123gmail.com |
|  102 | siya   |   24 | female | Bhopal  | 867599384  | siya@456gmail.com   |
|  103 | piya   |   21 | female | ujjain  | 8688730998 | piya789@gmail.com   |
|  104 | umesh  |   22 | male   | nimach  | 673846575  | umesh@123gmail.com  |
|  105 | amit   |   27 | male   | betul   | 784758697  | amit@234gmail.com   |
+------+--------+------+--------+---------+------------+---------------------+
5 rows in set (0.02 sec)

mysql> create table books(book_id INT, title VARCHAR(150), author VARCHAR(100), genre VARCHAR(50), publication_year INT, price DECIMAL(6,2), publisher VARCHAR(100));
Query OK, 0 rows affected (0.03 sec)

mysql> desc books;
+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| book_id          | int          | YES  |     | NULL    |       |
| title            | varchar(150) | YES  |     | NULL    |       |
| author           | varchar(100) | YES  |     | NULL    |       |
| genre            | varchar(50)  | YES  |     | NULL    |       |
| publication_year | int          | YES  |     | NULL    |       |
| price            | decimal(6,2) | YES  |     | NULL    |       |
| publisher        | varchar(100) | YES  |     | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> insert into books values(101, 'The Alchemist', 'Paulo Coelho', 'Adventure', 1990, 110, 'abc'),(102, 'Harry Potter', 'J. K. Rowling', 'Fantasy', 1989, 138, 'xyz'),(103, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1998, 220.20, 'ijk'),(104, 'Atomic Habits', 'James Clear', 'Self-help', 2000, 121.40, 'opq');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from books;
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
| book_id | title            | author              | genre     | publication_year | price  | publisher |
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
|     101 | The Alchemist    | Paulo Coelho        | Adventure |             1990 | 110.00 | abc       |
|     102 | Harry Potter     | J. K. Rowling       | Fantasy   |             1989 | 138.00 | xyz       |
|     103 | The Great Gatsby | F. Scott Fitzgerald | Classic   |             1998 | 220.20 | ijk       |
|     104 | Atomic Habits    | James Clear         | Self-help |             2000 | 121.40 | opq       |
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
4 rows in set (0.02 sec)

mysql> Rename table books to library_books;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from library_books;
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
| book_id | title            | author              | genre     | publication_year | price  | publisher |
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
|     101 | The Alchemist    | Paulo Coelho        | Adventure |             1990 | 110.00 | abc       |
|     102 | Harry Potter     | J. K. Rowling       | Fantasy   |             1989 | 138.00 | xyz       |
|     103 | The Great Gatsby | F. Scott Fitzgerald | Classic   |             1998 | 220.20 | ijk       |
|     104 | Atomic Habits    | James Clear         | Self-help |             2000 | 121.40 | opq       |
+---------+------------------+---------------------+-----------+------------------+--------+-----------+
4 rows in set (0.01 sec)



mysql> desc students;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int          | YES  |     | NULL    |       |
| name    | varchar(100) | YES  |     | NULL    |       |
| age     | int          | YES  |     | NULL    |       |
| gender  | varchar(10)  | YES  |     | NULL    |       |
| address | varchar(150) | YES  |     | NULL    |       |
| phone   | varchar(15)  | YES  |     | NULL    |       |
| email   | varchar(100) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


mysql> alter table students add column dob DATE;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table students rename column phone to mobile_number;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> alter table students modify column age SMALLINT;
Query OK, 5 rows affected (0.09 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> select * from students;
+------+--------+------+--------+---------+---------------+---------------------+------+
| id   | name   | age  | gender | address | mobile_number | email               | dob  |
+------+--------+------+--------+---------+---------------+---------------------+------+
|  101 | bhavna |   25 | female | indore  | 8907654321    | bhavna@123gmail.com | NULL |
|  102 | siya   |   24 | female | Bhopal  | 867599384     | siya@456gmail.com   | NULL |
|  103 | piya   |   21 | female | ujjain  | 8688730998    | piya789@gmail.com   | NULL |
|  104 | umesh  |   22 | male   | nimach  | 673846575     | umesh@123gmail.com  | NULL |
|  105 | amit   |   27 | male   | betul   | 784758697     | amit@234gmail.com   | NULL |
+------+--------+------+--------+---------+---------------+---------------------+------+
5 rows in set (0.00 sec)



mysql> alter table students drop column email;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc students;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| id            | int          | YES  |     | NULL    |       |
| name          | varchar(100) | YES  |     | NULL    |       |
| age           | smallint     | YES  |     | NULL    |       |
| gender        | varchar(10)  | YES  |     | NULL    |       |
| address       | varchar(150) | YES  |     | NULL    |       |
| mobile_number | varchar(15)  | YES  |     | NULL    |       |
| dob           | date         | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


mysql> truncate table students;
Query OK, 0 rows affected (0.05 sec)

mysql> select * from students;
Empty set (0.00 sec)


mysql> drop table students;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from students;
ERROR 1146 (42S02): Table 'practice.students' doesnt exist


mysql> drop table library_books;
Query OK, 0 rows affected (0.03 sec)


mysql> select * from library_books;
ERROR 1146 (42S02): Table 'practice.library_books' doesnt exist


****************************************************************************
****************************************************************************

mysql> show tables;
+--------------------+
| Tables_in_practice |
+--------------------+
| products           |
+--------------------+
1 row in set (0.03 sec)





mysql> select * from products;
+------------+---------------------+-------------+----------+----------------+----------------------+------------------+-------------+
| product_id | product_name        | category    | price    | stock_quantity | supplier_name        | manufacture_date | expiry_date |
+------------+---------------------+-------------+----------+----------------+----------------------+------------------+-------------+
|        111 | laptop              | electronic  |  1200.60 |            120 | patidar electronics  | 2000-09-01       | 2027-09-01  |
|        112 | dryer               | electronic  |  1100.20 |             20 | kushwah electronics  | 2001-12-01       | 2028-09-01  |
|        113 | i_phones            | electronics | 20000.00 |            900 | potphode electronics | 2015-08-19       | 2029-10-10  |
|        114 | infrarate_induction | electronic  |  8000.00 |            500 | sharma electronics   | 2010-09-10       | 2030-01-01  |
|        115 | TV                  | electronic  | 15000.60 |           3000 | Tiwari electronics   | 2000-09-01       | NULL        |
|        116 | wahing machine      | electronic  | 25000.00 |            600 | dubey electronics    | 2022-10-10       | NULL        |
+------------+---------------------+-------------+----------+----------------+----------------------+------------------+-------------+
6 rows in set (0.02 sec)



mysql> show create table products;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                                                                                                      |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| products | CREATE TABLE `products` (
  `product_id` int DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)



********************************************************************************
********************************************************************************


mysql> create table movie_reviews(review_id INT, movie_title VARCHAR(150), reviewer_name VARCHAR(100), rating DECIMAL(2,1), review_text TEXT);
Query OK, 0 rows affected (0.04 sec)

mysql> desc movie_reviews;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| review_id     | int          | YES  |     | NULL    |       |
| movie_title   | varchar(150) | YES  |     | NULL    |       |
| reviewer_name | varchar(100) | YES  |     | NULL    |       |
| rating        | decimal(2,1) | YES  |     | NULL    |       |
| review_text   | text         | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into movie_reviews values(1001, '3 Idiots', 'Bhavna potphode', 4.3, 'A funny and inspiring movie about friendship, education, and following your passion'), (1002, 'Zindagi Na Milegi Dobara', 'varsha dhote', 5, 'A beautiful movie about friendship, adventure, and enjoying life before it passes by.'), (1003, 'Andhadhun', 'Princy sonare', 4.5, 'A clever and unpredictable thriller with twists that keep you guessing until the end.');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> alter table movie_reviews add column review_date DATE;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table movie_reviews add column platform VARCHAR(50), add column likes INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc movie_reviews;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| review_id     | int          | YES  |     | NULL    |       |
| movie_title   | varchar(150) | YES  |     | NULL    |       |
| reviewer_name | varchar(100) | YES  |     | NULL    |       |
| rating        | decimal(2,1) | YES  |     | NULL    |       |
| review_text   | text         | YES  |     | NULL    |       |
| review_date   | date         | YES  |     | NULL    |       |
| platform      | varchar(50)  | YES  |     | NULL    |       |
| likes         | int          | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

                                                                                                                                                                                                                                                                                       


mysql> select * from movie_reviews;
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------+-------------+----------+-------+
| review_id | movie_title              | reviewer_name   | rating | review_text                                                                           | review_date | platform | likes |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------+-------------+----------+-------+
|      1001 | 3 Idiots                 | Bhavna potphode |    4.3 | A funny and inspiring movie about friendship, education, and following your passion   | NULL        | NULL     |  NULL |
|      1002 | Zindagi Na Milegi Dobara | varsha dhote    |    5.0 | A beautiful movie about friendship, adventure, and enjoying life before it passes by. | NULL        | NULL     |  NULL |
|      1003 | Andhadhun                | Princy sonare   |    4.5 | A clever and unpredictable thriller with twists that keep you guessing until the end. | NULL        | NULL     |  NULL |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------+-------------+----------+-------+
3 rows in set (0.01 sec)

mysql> insert into movie_reviews values(1004, 'Taare Zameen Par', 'SIYA', 4.9, 'An emotional and inspiring movie that shows how understanding and encouragement can help a child discover their true potential.', '2026-02-10', 'Netflix', 1234), (1005, 'Drishyam', 'Kanak kushwah', 5, 'A gripping thriller with smart storytelling, suspense, and unexpected twists that keep you interested until the end.', '2025-11-11', 'hotstart', 689263);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from  movie_reviews;
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
| review_id | movie_title              | reviewer_name   | rating | review_text                                                                                                                     | review_date | platform | likes  |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
|      1001 | 3 Idiots                 | Bhavna potphode |    4.3 | A funny and inspiring movie about friendship, education, and following your passion                                             | NULL        | NULL     |   NULL |
|      1002 | Zindagi Na Milegi Dobara | varsha dhote    |    5.0 | A beautiful movie about friendship, adventure, and enjoying life before it passes by.                                           | NULL        | NULL     |   NULL |
|      1003 | Andhadhun                | Princy sonare   |    4.5 | A clever and unpredictable thriller with twists that keep you guessing until the end.                                           | NULL        | NULL     |   NULL |
|      1004 | Taare Zameen Par         | SIYA            |    4.9 | An emotional and inspiring movie that shows how understanding and encouragement can help a child discover their true potential. | 2026-02-10  | Netflix  |   1234 |
|      1005 | Drishyam                 | Kanak kushwah   |    5.0 | A gripping thriller with smart storytelling, suspense, and unexpected twists that keep you interested until the end.            | 2025-11-11  | hotstart | 689263 |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
5 rows in set (0.00 sec)





mysql> ALTER TABLE movie_reviews RENAME column reviewer_name TO  critic_name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE movie_reviews MODIFY column rating DECIMAL(3,1), MODIFY column movie_title VARCHAR(200);
Query OK, 5 rows affected (0.08 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from movie_reviews;
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
| review_id | movie_title              | critic_name     | rating | review_text                                                                                                                     | review_date | platform | likes  |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
|      1001 | 3 Idiots                 | Bhavna potphode |    4.3 | A funny and inspiring movie about friendship, education, and following your passion                                             | NULL        | NULL     |   NULL |
|      1002 | Zindagi Na Milegi Dobara | varsha dhote    |    5.0 | A beautiful movie about friendship, adventure, and enjoying life before it passes by.                                           | NULL        | NULL     |   NULL |
|      1003 | Andhadhun                | Princy sonare   |    4.5 | A clever and unpredictable thriller with twists that keep you guessing until the end.                                           | NULL        | NULL     |   NULL |
|      1004 | Taare Zameen Par         | SIYA            |    4.9 | An emotional and inspiring movie that shows how understanding and encouragement can help a child discover their true potential. | 2026-02-10  | Netflix  |   1234 |
|      1005 | Drishyam                 | Kanak kushwah   |    5.0 | A gripping thriller with smart storytelling, suspense, and unexpected twists that keep you interested until the end.            | 2025-11-11  | hotstart | 689263 |
+-----------+--------------------------+-----------------+--------+---------------------------------------------------------------------------------------------------------------------------------+-------------+----------+--------+
5 rows in set (0.00 sec)

mysql> desc movie_reviews;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| review_id   | int          | YES  |     | NULL    |       |
| movie_title | varchar(200) | YES  |     | NULL    |       |
| critic_name | varchar(100) | YES  |     | NULL    |       |
| rating      | decimal(3,1) | YES  |     | NULL    |       |
| review_text | text         | YES  |     | NULL    |       |
| review_date | date         | YES  |     | NULL    |       |
| platform    | varchar(50)  | YES  |     | NULL    |       |
| likes       | int          | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.03 sec)

mysql> ALTER TABLE movie_reviews DROP COLUMN likes;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc movie_reviews;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| review_id   | int          | YES  |     | NULL    |       |
| movie_title | varchar(200) | YES  |     | NULL    |       |
| critic_name | varchar(100) | YES  |     | NULL    |       |
| rating      | decimal(3,1) | YES  |     | NULL    |       |
| review_text | text         | YES  |     | NULL    |       |
| review_date | date         | YES  |     | NULL    |       |
| platform    | varchar(50)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> TRUNCATE TABLE movie_reviews;
Query OK, 0 rows affected (0.04 sec)

mysql> desc movie_reviews;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| review_id   | int          | YES  |     | NULL    |       |
| movie_title | varchar(200) | YES  |     | NULL    |       |
| critic_name | varchar(100) | YES  |     | NULL    |       |
| rating      | decimal(3,1) | YES  |     | NULL    |       |
| review_text | text         | YES  |     | NULL    |       |
| review_date | date         | YES  |     | NULL    |       |
| platform    | varchar(50)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select * from movie_reviews;
Empty set (0.00 sec)

mysql> RENAME TABLE movie_reviews TO archived_reviews;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from archived_reviews;
Empty set (0.00 sec)

mysql> drop table archived_reviews;
Query OK, 0 rows affected (0.03 sec)


mysql> desc archived_reviews;
ERROR 1146 (42S02): Table practice.archived_reviews doesnt exist









