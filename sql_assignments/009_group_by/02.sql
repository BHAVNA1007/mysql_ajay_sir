2.
Student Performance Analysis
Use the following students table for the queries.

NOTE: use your friends names in the given table.
Table: students
student_id name class subject marks exam_date


mysql> create table student_analysis(student_id int primary key auto_increment, name varchar(20),  class int, subject varchar(20), marks int, exam_date date);
Query OK, 0 rows affected (0.07 sec)

mysql> desc student_analysis;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| student_id | int         | NO   | PRI | NULL    | auto_increment |
| name       | varchar(20) | YES  |     | NULL    |                |
| class      | int         | YES  |     | NULL    |                |
| subject    | varchar(20) | YES  |     | NULL    |                |
| marks      | int         | YES  |     | NULL    |                |
| exam_date  | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.03 sec)






1 John 10 Math 85 2023-02-10
2 Alice 10 Science 78 2023-03-15
3 Bob 9 Math 92 2023-04-20
4 David 9 Science 80 2023-05-25
5 Eve 10 Math 88 2023-06-30
6 Frank 9 Science 75 2023-07-10
7 Grace 10 Math 90 2023-08-20
8 Hank 9 Math 85 2023-09-15
9 Ivy 10 Science 82 2023-10-10
10 Jack 9 Science 79 2023-11-05


mysql> insert into  student_analysis(name, class, subject, marks, exam_date)
 values
    -> ('John', 10, 'Math', 85, '2023-02-10'),
    -> ('Alice', 10, 'Science', 78, '2023-03-15'),
    -> ('Bob', 9, 'Math', 92, '2023-04-20'),
    -> ('David', 9, 'Science', 80, '2023-05-25'),
    -> ('Eve', 10, 'Math', 88, '2023-06-30'),
    -> ('Frank', 9, 'Science', 75, '2023-07-10'),
    -> ('Grace', 10, 'Math', 90, '2023-08-20'),
    -> ('Hank', 9, 'Math', 85, '2023-09-15'),
    -> ('Ivy', 10, 'Science', 82, '2023-10-10'),
    -> ('Jack', 9, 'Science', 79, '2023-11-05');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from student_analysis;
+------------+-------+-------+---------+-------+------------+
| student_id | name  | class | subject | marks | exam_date  |
+------------+-------+-------+---------+-------+------------+
|          1 | John  |    10 | Math    |    85 | 2023-02-10 |
|          2 | Alice |    10 | Science |    78 | 2023-03-15 |
|          3 | Bob   |     9 | Math    |    92 | 2023-04-20 |
|          4 | David |     9 | Science |    80 | 2023-05-25 |
|          5 | Eve   |    10 | Math    |    88 | 2023-06-30 |
|          6 | Frank |     9 | Science |    75 | 2023-07-10 |
|          7 | Grace |    10 | Math    |    90 | 2023-08-20 |
|          8 | Hank  |     9 | Math    |    85 | 2023-09-15 |
|          9 | Ivy   |    10 | Science |    82 | 2023-10-10 |
|         10 | Jack  |     9 | Science |    79 | 2023-11-05 |
+------------+-------+-------+---------+-------+------------+
10 rows in set (0.00 sec)





Questions


Find the total number of students in each class.

mysql> select class, count(*) as total from student_analysis group by class;
+-------+-------+
| class | total |
+-------+-------+
|    10 |     5 |
|     9 |     5 |
+-------+-------+
2 rows in set (0.00 sec)






Find the highest marks scored in Math.

mysql> select max(marks) as high_score_math from student_analysis where subject = 'Math';
+-----------------+
| high_score_math |
+-----------------+
|              92 |
+-----------------+
1 row in set (0.00 sec)







Find the average marks in each subject.

mysql> select subject, avg(marks) from student_analysis group by subject;
+---------+------------+
| subject | avg(marks) |
+---------+------------+
| Math    |    88.0000 |
| Science |    78.8000 |
+---------+------------+
2 rows in set (0.01 sec)







Find the total number of students who scored above 80.

mysql> select count(*) from student_analysis where marks > 80;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)







Find the number of students who took the exam in each month.

mysql> select monthname(exam_date), count(*) from  student_analysis group by exam_date;

+----------------------+----------+
| monthname(exam_date) | count(*) |
+----------------------+----------+
| February             |        1 |
| March                |        1 |
| April                |        1 |
| May                  |        1 |
| June                 |        1 |
| July                 |        1 |
| August               |        1 |
| September            |        1 |
| October              |        1 |
| November             |        1 |
+----------------------+----------+






Find the subject where students scored the highest average marks.

mysql> select subject, avg(marks) as high_score from student_analysis group by subject order by high_score DESC limit 1;
+---------+------------+
| subject | high_score |
+---------+------------+
| Math    |    88.0000 |
+---------+------------+
1 row in set (0.00 sec)








Find the student who scored the lowest marks in Science.

mysql> select min(marks) from student_analysis where subject = 'Science';
+------------+
| min(marks) |
+------------+
|         75 |
+------------+
1 row in set (0.00 sec)






Find the number of students in each class who scored more than 85.

mysql> select class, count(*) from student_analysis where marks> 85 group by class;
+-------+----------+
| class | count(*) |
+-------+----------+
|     9 |        1 |
|    10 |        2 |
+-------+----------+
2 rows in set (0.00 sec)






Find the average marks for each subject where the average is above 80.

mysql> select subject, avg(marks) as avg_marks from student_analysis group by subject having avg_marks > 80;
+---------+-----------+
| subject | avg_marks |
+---------+-----------+
| Math    |   88.0000 |
+---------+-----------+
1 row in set (0.00 sec)






Find the student who scored the highest marks overall.

mysql> select max(marks) as highest_score from student_analysis;
+---------------+
| highest_score |
+---------------+
|            92 |
+---------------+
1 row in set (0.00 sec)