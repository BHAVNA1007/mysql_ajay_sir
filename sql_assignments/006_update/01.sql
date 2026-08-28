QNO 1:
Table Name: staff_update

| Column         | Data Type                      |
| -------------- | ------------------------------ |
| `staff_id`     | INT PRIMARY KEY AUTO_INCREMENT |
| `staff_name`   | VARCHAR(50)                    |
| `department`   | VARCHAR(30)                    |
| `city`         | VARCHAR(30)                    |
| `salary`       | DECIMAL(10,2)                  |
| `experience`   | INT                            |
| `age`          | INT                            |
| `joining_date` | DATE                           |
| `status`       | VARCHAR(20)                    |
===================================================


DATA:--
('Aarav', 'IT', 'Indore', 48000, 3, 26, '2022-04-15', 'Active'),
('Bhavna', 'HR', 'Bhopal', 56000, 5, 31, '2020-08-20', 'Active'),
('Chetan', 'Finance', 'Delhi', 62000, 7, 35, '2018-03-10', 'Active'),
('Divya', 'IT', 'Pune', 78000, 9, 38, '2016-11-05', 'Active'),
('Eshan', 'Sales', 'Indore', 51000, 4, 29, '2021-06-18', 'Inactive'),
('Farah', 'HR', NULL, 68000, 6, 34, '2019-01-25', 'Active');



Questions

Q1. Aaravs salary needs to be revised to ₹52,000. Update his salary using his employee ID.

Q2. Bhavna has been transferred to the Finance department in Indore. Update both her department and city.

Q3. Give a ₹4,000 increment to employees whose salary is below ₹60,000, who have at least 3 years of experience, and who do not belong to Sales.

Q4. Give a ₹3,000 increment to employees who either belong to IT with at least 3 years of experience or belong to HR with at least 5 years of experience.

Q5. Give a 10% increment to employees from IT or Finance whose current salary is below ₹70,000.

Q6. Give a ₹2,500 increment to employees who are neither from HR nor Sales and have between 5 and 8 years of experience.

Q7. Give a ₹5,000 increment to employees whose salary is between ₹50,000 and ₹70,000, excluding Finance employees.

Q8. Give a 7% increment to employees whose names start with either A or D.

Q9. Farahs city is missing. Update her city to Mumbai without modifying employees whose city is already available.

Q10. Give a 10% increment to employees who joined before January 1, 2020 and whose salary is below ₹70,000.

Q11. For IT employees having at least 5 years of experience, increase salary by 8%, increase experience by 1 year, and change their status to Promoted.

Q12. Give a ₹6,000 increment to employees having at least 5 years of experience, salary below ₹75,000, and belonging to either HR or Finance.

Q13. Apply the following salary revisions in a single statement:

IT → 12%
HR → 9%
Finance → 8%
Sales → 5%

Q14. Apply salary increments according to experience:

8 or more years → 15%
5–7 years → 10%
3–4 years → 7%
Less than 3 years → 5%

Q15. Apply these salary revisions in a single statement:

IT employees with at least 8 years → 18%
Other IT employees → 10%
HR employees with at least 6 years → 12%
Other HR employees → 7%
Finance employees → 8%
Sales employees → 5%

Q16. Update the status of every employee according to salary:

₹75,000 or more → Senior
₹60,000–₹74,999 → Experienced
₹50,000–₹59,999 → Regular
Below ₹50,000 → Junior

Q17. Display all employees with departments arranged in this business priority:

Finance → IT → HR → Sales

Do not change the actual department values.

Q18. Display all employees with departments arranged in this order:

IT → HR → Finance → Sales

Within each department, display the employee with the highest salary first.

Q19. Display employees according to experience priority:

8+ years → 5–7 years → 3–4 years → below 3 years

Q20. Give a ₹5,000 increment to only one employee. The employee must belong to IT or HR, have at least 3 years of experience, and earn less than ₹70,000. If multiple employees qualify, update only the lowest-paid employee.

Q21. Give a 10% increment to only one employee. The employee must be Active and have at least 5 years of experience. If multiple employees qualify, update only the highest-paid employee.

Q22. Give a ₹3,000 increment to only one employee who is neither from HR nor Sales and has at least 3 years of experience. If multiple employees qualify, update the lowest-paid employee.

Q23. Change the status to Promoted for only the highest-paid IT employee.

Q24. Give a 12% increment to employees who are either IT employees with at least 5 years of experience or Finance employees earning below ₹65,000. In addition, only Active employees earning below ₹80,000 should receive the increment.

Q25. Apply the following salary revision in one statement:

IT + 8 or more years → 18%
IT + 5–7 years → 12%
HR + at least 6 years → 10%
HR + less than 6 years → 7%
Finance + salary below ₹65,000 → 10%
Finance + salary ₹65,000 or above → 7%
Sales + at least 4 years → 6%
All remaining employees → 3%

Q26. Update both salary and status according to experience:

8+ years → salary +15%, status Promoted
5–7 years → salary +10%, status Eligible
3–4 years → salary +7%, status Regular
Below 3 years → salary +5%, status Junior

Q27. Change the status to Promoted for employees who have at least 6 years of experience, salary of at least ₹60,000, are Active, and belong to IT, HR, or Finance.

Q28. Employees belonging to IT, having at least 5 years of experience, and currently living in Pune or Delhi should receive a 10% salary increment, have their city changed to Bangalore, and their status changed to Transferred.

Q29. Give a ₹7,000 special increment to only one eligible employee. The employee must belong to IT, HR, or Finance, have at least 4 years of experience, be Active, and earn less than ₹75,000. If multiple employees qualify, update only the lowest-paid employee.

Q30. The company wants to perform an annual salary revision using one statement:

IT + experience >= 8 + salary >= ₹70,000 → 18%
IT + experience >= 5 → 12%
HR + experience >= 6 → 10%
HR + experience < 6 → 7%
Finance + salary < ₹65,000 → 10%
Finance + salary >= ₹65,000 → 7%
Sales + experience >= 4 → 6%
All remaining employees → 3%

Employees whose status is Inactive must not receive any increment.

Additionally, update the status based on the applicable increment:

15% or more → Promoted
10%–14.99% → Eligible
Below 10% → Under Review







mysql> create table staff_update(staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name VARCHAR(50), department VARCHAR(30), city VARCHAR(30), salary DECIMAL(10,2), experience INT, age INT, joining_date DATE, status VARCHAR(20));
Query OK, 0 rows affected (0.05 sec)

mysql> desc staff_update;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| staff_id     | int           | NO   | PRI | NULL    | auto_increment |
| staff_name   | varchar(50)   | YES  |     | NULL    |                |
| department   | varchar(30)   | YES  |     | NULL    |                |
| city         | varchar(30)   | YES  |     | NULL    |                |
| salary       | decimal(10,2) | YES  |     | NULL    |                |
| experience   | int           | YES  |     | NULL    |                |
| age          | int           | YES  |     | NULL    |                |
| joining_date | date          | YES  |     | NULL    |                |
| status       | varchar(20)   | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
9 rows in set (0.03 sec)




mysql> insert into staff_update(staff_name,  department,  city,  salary, experience,  age, joining_date, status)
    -> values('Aarav', 'IT', 'Indore', 48000, 3, 26, '2022-04-15', 'Active'),
    -> ('Bhavna', 'HR', 'Bhopal', 56000, 5, 31, '2020-08-20', 'Active'),
    -> ('Chetan', 'Finance', 'Delhi', 62000, 7, 35, '2018-03-10', 'Active'),
    -> ('Divya', 'IT', 'Pune', 78000, 9, 38, '2016-11-05', 'Active'),
    -> ('Eshan', 'Sales', 'Indore', 51000, 4, 29, '2021-06-18', 'Inactive'),
    -> ('Farah', 'HR', NULL, 68000, 6, 34, '2019-01-25', 'Active');



Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from  staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 48000.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | HR         | Bhopal | 56000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 62000.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 78000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 68000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)






Q1. Aaravs salary needs to be revised to ₹52,000. Update his salary using his employee ID.


mysql> update staff_update set  salary = 52000 where staff_id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from  staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 52000.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | HR         | Bhopal | 56000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 62000.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 78000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 68000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)



Q2. Bhavna has been transferred to the Finance department in Indore. Update both her department and city.

mysql> update staff_update set  department='Finance', city='Indore' where staff_id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from  staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 52000.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 56000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 62000.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 78000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 68000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql>


Q3. Give a ₹4,000 increment to employees whose salary is below ₹60,000, who have at least 3 years of experience, and who do not belong to Sales.

mysql> update staff_update set salary = salary+4000 where salary < 60000 and experience >= 3 and department <> 'Sales';
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 56000.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 60000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 62000.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 78000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 68000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+



Q4. Give a ₹3,000 increment to employees who either belong to IT with at least 3 years of experience or belong to HR with at least 5 years of experience.

mysql> update staff_update set salary = salary + 3000 where (department = 'IT' AND  experience >= 3) OR (department = 'HR' AND  experience >= 5);
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 59000.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 60000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 62000.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 81000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)








Q5. Give a 10% increment to employees from IT or Finance whose current salary is below ₹70,000.


mysql> update staff_update set salary = salary * 1.10 where department IN('IT', 'Finance') and salary < 70000;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 64900.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 66000.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 68200.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 81000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)





Q6. Give a ₹2,500 increment to employees who are neither from HR nor Sales and have between 5 and 8 years of experience.

mysql> update staff_update set salary = salary + 2500 where department NOT IN('HR', 'Sales') and experience between 5 and 8;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 64900.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 68500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 70700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 81000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 51000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)



Q7. Give a ₹5,000 increment to employees whose salary is between ₹50,000 and ₹70,000, excluding Finance employees.


mysql> update staff_update set salary = salary + 5000 where salary between 50000 AND 70000 AND department <> 'Finance';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 69900.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 68500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 70700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 81000.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 56000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)




Q8. Give a 7% increment to employees whose names start with either A or D.

mysql> update staff_update set salary = salary * 1.07 where  staff_name like 'a%' OR  staff_name like 'd%';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 74793.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 68500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 70700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 86670.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 56000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | NULL   | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql>






Q9. Farahs city is missing. Update her city to Mumbai without modifying employees whose city is already available.


mysql> update staff_update set city = 'Mumbai' where staff_id = 6 AND city IS NULL;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 74793.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 68500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 70700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 86670.00 |          9 |   38 | 2016-11-05   | Active   |
|        5 | Eshan      | Sales      | Indore | 56000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)




Q10. Give a 10% increment to employees who joined before January 1, 2020 and whose salary is below ₹70,000.

mysql> update staff_update set salary = salary*1.10  where joining_date < '2020-01-01' AND salary < 70000;
Query OK, 0 rows affected (0.01 sec)
Rows matched: 0  Changed: 0  Warnings: 0



Q11. For IT employees having at least 5 years of experience, increase salary by 8%, increase experience by 1 year, and change their status to Promoted.


mysql> update staff_update set salary = salary * 1.08, experience =  experience + 1, status = 'Promoted' where department = 'IT' and experience >= 5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 74793.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 68500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 70700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 93603.60 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore | 56000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai | 71000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+




Q12. Give a ₹6,000 increment to employees having at least 5 years of experience, salary below ₹75,000, and belonging to either HR or Finance.

mysql> update staff_update set salary = salary + 6000 where experience >= 5 AND salary < 75000 AND department IN('HR', 'Finance');

Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | joining_date | status   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 74793.00 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore | 74500.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  | 76700.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 93603.60 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore | 56000.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai | 77000.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)



Q13. Apply the following salary revisions in a single statement:

IT → 12%
HR → 9%
Finance → 8%
Sales → 5%



mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)


mysql> update staff_update set salary =
    -> CASE
    -> WHEN department = 'IT' then salary*1.12
    -> WHEN department = 'HR' then salary*1.09
    -> WHEN department = 'Finance' then salary*1.08
    -> WHEN department = 'Sales' then salary*1.05
    -> ELSE salary
    -> end;

Query OK, 6 rows affected, 1 warning (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 1

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore |  83768.16 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore |  80460.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  |  82836.00 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 104836.03 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore |  58800.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai |  83930.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)




Q14. Apply salary increments according to experience:

8 or more years → 15%
5–7 years → 10%
3–4 years → 7%
Less than 3 years → 5%



mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update staff_update set salary =
    -> CASE
    -> WHEN experience >= 8 THEN salary * 1.15
    -> WHEN experience BETWEEN 5 AND 7 THEN salary * 1.10
    -> WHEN experience BETWEEN 3 AND 4 THEN salary * 1.07
    -> WHEN experience < 3 THEN salary * 1.05
    -> ELSE salary
    -> END;
Query OK, 6 rows affected, 2 warnings (0.00 sec)
Rows matched: 6  Changed: 6  Warnings: 2


mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore |  89631.93 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore |  88506.00 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  |  91119.60 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 120561.43 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore |  62916.00 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai |  92323.00 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)




Q15. Apply these salary revisions in a single statement:

IT employees with at least 8 years → 18%
Other IT employees → 10%
HR employees with at least 6 years → 12%
Other HR employees → 7%
Finance employees → 8%
Sales employees → 5%



mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update staff_update set salary =
    -> CASE
    -> WHEN department = 'IT' AND experience >= 8 then salary * 1.18
    -> WHEN department = 'IT' then salary * 1.10
    -> WHEN department = 'HR' AND experience >= 6 then salary * 1.12
    -> WHEN department = 'HR' then salary * 1.07
    -> WHEN department = 'Finance' then salary * 1.08
    -> WHEN department = 'Sales' THEN salary * 1.05
    -> ELSE salary
    -> END;
Query OK, 6 rows affected, 3 warnings (0.00 sec)
Rows matched: 6  Changed: 6  Warnings: 3


mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Active   |
|        2 | Bhavna     | Finance    | Indore |  95586.48 |          5 |   31 | 2020-08-20   | Active   |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Active   |
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Inactive |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Active   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SHOW WARNINGS;
Empty set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)





Q16. Update the status of every employee according to salary:

₹75,000 or more → Senior
₹60,000–₹74,999 → Experienced
₹50,000–₹59,999 → Regular
Below ₹50,000 → Junior



mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> update staff_update set status =
    -> CASE
    -> WHEN salary >= 75000 then 'Senior'
    -> WHEN salary BETWEEN 60000 AND 74999 then 'Experienced'
    -> WHEN salary BETWEEN 50000 AND 59999 then 'Regular'
    -> WHEN salary < 50000 then 'Junior'
    -> ELSE status
    -> END;
Query OK, 6 rows affected (0.00 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        2 | Bhavna     | Finance    | Indore |  95586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Senior      |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)




Q17. Display all employees with departments arranged in this business priority:

Finance → IT → HR → Sales

Do not change the actual department values.

mysql> select * from staff_update order by
    -> CASE
    -> WHEN department = 'Finance' then 1
    -> WHEN department = 'IT' then 2
    -> WHEN department = 'HR' then 3
    -> WHEN department = 'Sales' then 4
    -> END;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        2 | Bhavna     | Finance    | Indore |  95586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Senior      |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)





Q18. Display all employees with departments arranged in this order:

IT → HR → Finance → Sales

Within each department, display the employee with the highest salary first.

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from staff_update order by
    -> case
    -> WHEN department = 'IT' then 1
    -> WHEN department = 'HR' then 2
    -> WHEN department = 'Finance' then 3
    -> WHEN department = 'Sales' then 4
    -> END,
    -> salary DESC;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Senior      |
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        2 | Bhavna     | Finance    | Indore |  95586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)



Q19. Display employees according to experience priority:

8+ years → 5–7 years → 3–4 years → below 3 years

mysql> select * from staff_update order by
    -> CASE
    -> when experience >= 8 then 1
    -> when experience between 5 and 7 then 2
    -> when experience between 3 and 4 then 3
    -> when experience < 3 then 4
    -> end;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Senior      |
|        2 | Bhavna     | Finance    | Indore |  95586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)




Q20. Give a ₹5,000 increment to only one employee. The employee must belong to IT or HR, have at least 3 years of experience, and earn less than ₹70,000. If multiple employees qualify, update only the lowest-paid employee.


mysql> update staff_update set salary = salary + 5000 where department in('IT', 'HR') AND experience >= 3 AND salary < 70000 order by salary ASC limit 1;

Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0





Q21. Give a 10% increment to only one employee. The employee must be Active and have at least 5 years of experience. If multiple employees qualify, update only the highest-paid employee.


mysql> update staff_update set salary = salary * 1.10 where status = 'Active' and experience >= 5 order by salary DESC limit 1;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0









Q22. Give a ₹3,000 increment to only one employee who is neither from HR nor Sales and has at least 3 years of experience. If multiple employees qualify, update the lowest-paid employee.


mysql> update staff_update set salary = salary + 3000 where department not in('HR', 'Sales') AND experience >= 3 order by salary ASC limit 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        2 | Bhavna     | Finance    | Indore |  98586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Senior      |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
+----------+------------+------------+--------+-----------+------------+------+--------------+------------





Q23. Change the status to Promoted for only the highest-paid IT employee.

mysql> update staff_update set status = 'Promoted' where department = 'IT' order by salary DESC limit 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        1 | Aarav      | IT         | Indore |  98595.12 |          3 |   26 | 2022-04-15   | Senior      |
|        2 | Bhavna     | Finance    | Indore |  98586.48 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  |  98409.17 |          7 |   35 | 2018-03-10   | Senior      |
|        4 | Divya      | IT         | Pune   | 142262.49 |         10 |   38 | 2016-11-05   | Promoted    |
|        5 | Eshan      | Sales      | Indore |  66061.80 |          4 |   29 | 2021-06-18   | Experienced |
|        6 | Farah      | HR         | Mumbai | 103401.76 |          6 |   34 | 2019-01-25   | Senior      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)





Q24. Give a 12% increment to employees who are either IT employees with at least 5 years of experience or Finance employees earning below ₹65,000. In addition, only Active employees earning below ₹80,000 should receive the increment.


mysql> update staff_update set salary = salary * 1.12 where ((department ='IT' AND experience >= 5)  OR  (department ='Finance' AND salary < 65000)) AND status ='Active' and salary < 80000 ;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0







Q25. Apply the following salary revision in one statement:

IT + 8 or more years → 18%
IT + 5–7 years → 12%
HR + at least 6 years → 10%
HR + less than 6 years → 7%
Finance + salary below ₹65,000 → 10%
Finance + salary ₹65,000 or above → 7%
Sales + at least 4 years → 6%
All remaining employees → 3%


mysql> update staff_update set salary =
    -> CASE
    -> WHEN department = 'IT' AND experience >= 8 then salary * 1.18
    -> WHEN department = 'IT' AND experience between 5 and 7 then salary * 1.12
    -> WHEN department = 'HR' AND experience >= 6 then salary * 1.10
    -> WHEN department = 'HR' AND experience < 6 then salary * 1.07
    -> WHEN department = 'Finance' AND salary < 65000 then salary * 1.10
    -> WHEN department = 'Finance' AND salary >= 65000 then salary * 1.07
    -> WHEN department = 'Sales' AND experience >= 4 then salary * 1.06
    -> ELSE salary * 1.03
    -> END;
Query OK, 6 rows affected, 6 warnings (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 6

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
|        1 | Aarav      | IT         | Indore | 101552.97 |          3 |   26 | 2022-04-15   | Senior      |
|        2 | Bhavna     | Finance    | Indore | 105487.53 |          5 |   31 | 2020-08-20   | Senior      |
|        3 | Chetan     | Finance    | Delhi  | 105297.81 |          7 |   35 | 2018-03-10   | Senior      |
|        4 | Divya      | IT         | Pune   | 167869.74 |         10 |   38 | 2016-11-05   | Promoted    |
|        5 | Eshan      | Sales      | Indore |  70025.51 |          4 |   29 | 2021-06-18   | Experienced |
|        6 | Farah      | HR         | Mumbai | 113741.94 |          6 |   34 | 2019-01-25   | Senior      |
+----------+------------+------------+--------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)







Q26. Update both salary and status according to experience:

8+ years → salary +15%, status Promoted
5–7 years → salary +10%, status Eligible
3–4 years → salary +7%, status Regular
Below 3 years → salary +5%, status Junior


mysql> UPDATE staff_update set salary =
    -> CASE
    -> when experience >= 8 then salary * 1.15
    -> when experience between 5 and 7 then salary * 1.10
    -> when experience between 3 and 4 then salary * 1.07
    -> when experience < 3  then salary * 1.05
    -> ELSE salary
    -> END,
    -> status =
    -> CASE
    -> when experience >= 8 then 'Promoted'
    -> when experience between 5 and 7 then 'Eligible'
    -> when experience between 3 and 4 then 'Regular'
    -> when experience < 3  then 'Junior'
    -> ELSE status
    -> END;
Query OK, 6 rows affected, 6 warnings (0.03 sec)
Rows matched: 6  Changed: 6  Warnings: 6

mysql> select * from staff_update;
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
| staff_id | staff_name | department | city   | salary    | experience | age  | joining_date | status   |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
|        1 | Aarav      | IT         | Indore | 108661.68 |          3 |   26 | 2022-04-15   | Regular  |
|        2 | Bhavna     | Finance    | Indore | 116036.28 |          5 |   31 | 2020-08-20   | Eligible |
|        3 | Chetan     | Finance    | Delhi  | 115827.59 |          7 |   35 | 2018-03-10   | Eligible |
|        4 | Divya      | IT         | Pune   | 193050.20 |         10 |   38 | 2016-11-05   | Promoted |
|        5 | Eshan      | Sales      | Indore |  74927.30 |          4 |   29 | 2021-06-18   | Regular  |
|        6 | Farah      | HR         | Mumbai | 125116.13 |          6 |   34 | 2019-01-25   | Eligible |
+----------+------------+------------+--------+-----------+------------+------+--------------+----------+
6 rows in set (0.00 sec)






Q27. Change the status to Promoted for employees who have at least 6 years of experience, salary of at least ₹60,000, are Active, and belong to IT, HR, or Finance.


mysql> update staff_update set status = 'Promoted' where experience >= 6 and salary >= 60000 and status = 'Active' AND department in('IT', 'HR', 'Finance');
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0



Q28. Employees belonging to IT, having at least 5 years of experience, and currently living in Pune or Delhi should receive a 10% salary increment, have their city changed to Bangalore, and their status changed to Transferred.


mysql> update staff_update set salary = salary * 1.10, city = 'Bangalore', status= 'Transferred' where department='IT' and experience >= 5 and city in('pune', 'Delhi');
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from staff_update;
+----------+------------+------------+-----------+-----------+------------+------+--------------+-------------+
| staff_id | staff_name | department | city      | salary    | experience | age  | joining_date | status      |
+----------+------------+------------+-----------+-----------+------------+------+--------------+-------------+
|        1 | Aarav      | IT         | Indore    | 108661.68 |          3 |   26 | 2022-04-15   | Regular     |
|        2 | Bhavna     | Finance    | Indore    | 116036.28 |          5 |   31 | 2020-08-20   | Eligible    |
|        3 | Chetan     | Finance    | Delhi     | 115827.59 |          7 |   35 | 2018-03-10   | Eligible    |
|        4 | Divya      | IT         | Bangalore | 212355.22 |         10 |   38 | 2016-11-05   | Transferred |
|        5 | Eshan      | Sales      | Indore    |  74927.30 |          4 |   29 | 2021-06-18   | Regular     |
|        6 | Farah      | HR         | Mumbai    | 125116.13 |          6 |   34 | 2019-01-25   | Eligible    |
+----------+------------+------------+-----------+-----------+------------+------+--------------+-------------+
6 rows in set (0.00 sec)





Q29. Give a ₹7,000 special increment to only one eligible employee. The employee must belong to IT, HR, or Finance, have at least 4 years of experience, be Active, and earn less than ₹75,000. If multiple employees qualify, update only the lowest-paid employee.


mysql> update staff_update set salary = salary + 7000 where department in('IT', 'HR', 'Finance') AND experience >= 4 and status = 'Active' and salary < 75000 order by salary ASC limit 1;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0



Q30. The company wants to perform an annual salary revision using one statement:

IT + experience >= 8 + salary >= ₹70,000 → 18%
IT + experience >= 5 → 12%
HR + experience >= 6 → 10%
HR + experience < 6 → 7%
Finance + salary < ₹65,000 → 10%
Finance + salary >= ₹65,000 → 7%
Sales + experience >= 4 → 6%
All remaining employees → 3%

Employees whose status is Inactive must not receive any increment.

Additionally, update the status based on the applicable increment:

15% or more → Promoted
10%–14.99% → Eligible
Below 10% → Under Review



mysql> UPDATE staff_update set salary =
    -> CASE
    -> WHEN department = 'IT' AND experience >= 8 AND salary >= 70000 then salary * 1.18
    -> WHEN department = 'IT' AND experience >= 5  then salary * 1.12
    -> WHEN department = 'HR' AND experience >= 6 then salary * 1.10
    -> WHEN department = 'HR' AND experience < 6 then salary * 1.07
    -> WHEN department = 'Finance' AND salary < 65000 then salary * 1.10
    -> WHEN department = 'Finance' AND salary >= 65000 then salary * 1.07
    -> WHEN department = 'Sales' AND experience >= 4 then salary * 1.06
    -> ELSE salary * 1.03
    -> END,
    -> status =
    -> CASE
    -> when status = 'Inactive' then status
    -> WHEN department = 'IT' AND experience >= 8 AND salary >= 70000 then 'Promoted'
    -> WHEN department = 'IT' AND experience >= 5  then 'Eligible'
    -> WHEN department = 'HR' AND experience >= 6 then 'Eligible'
    -> WHEN department = 'HR' AND experience < 6 then 'Under Review'
    -> WHEN department = 'Finance' AND salary < 65000 then 'Eligible'
    -> WHEN department = 'Finance' AND salary >= 65000 then  'Under Review'
    -> WHEN department = 'Sales' AND experience >= 4 then  'Under Review'
    -> else  'Under Review'
    -> END;
Query OK, 6 rows affected, 6 warnings (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 6

mysql> select * from staff_update;
+----------+------------+------------+-----------+-----------+------------+------+--------------+--------------+
| staff_id | staff_name | department | city      | salary    | experience | age  | joining_date | status       |
+----------+------------+------------+-----------+-----------+------------+------+--------------+--------------+
|        1 | Aarav      | IT         | Indore    | 111921.53 |          3 |   26 | 2022-04-15   | Under Review |
|        2 | Bhavna     | Finance    | Indore    | 124158.82 |          5 |   31 | 2020-08-20   | Under Review |
|        3 | Chetan     | Finance    | Delhi     | 123935.52 |          7 |   35 | 2018-03-10   | Under Review |
|        4 | Divya      | IT         | Bangalore | 250579.16 |         10 |   38 | 2016-11-05   | Promoted     |
|        5 | Eshan      | Sales      | Indore    |  79422.94 |          4 |   29 | 2021-06-18   | Under Review |
|        6 | Farah      | HR         | Mumbai    | 137627.74 |          6 |   34 | 2019-01-25   | Eligible     |
+----------+------------+------------+-----------+-----------+------------+------+--------------+--------------+
6 rows in set (0.00 sec)
