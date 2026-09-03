GROUP BY with WHERE CLAUSE
WHERE filters indidual rows first and then group by creates groups from the remaining row.

table ---> where(filter rows)--- > group by---> aggregate functions result.

Write a query to find the average salary of employes in each department but consider only employees ,whose salary is greater > 50000.

mysql> select department, avg(salary) from employee_s where salary > 50000 group by department;
+------------+--------------+
| department | avg(salary)  |
+------------+--------------+
| IT         | 70000.000000 |
| HR         | 70000.000000 |
| Finance    | 90000.000000 |
| Sales      | 65000.000000 |
+------------+--------------+
4 rows in set (0.01 sec)




waq to find the num of employees in each department whose salary is greater then 50000. 

mysql> select department, count(*) from employee_s where salary > 50000 group by department;
+------------+----------+
| department | count(*) |
+------------+----------+
| IT         |        2 |
| HR         |        1 |
| Finance    |        1 |
| Sales      |        1 |
+------------+----------+
4 rows in set (0.00 sec)



WAQ to find the highest salary in each department considering only active employees.

mysql> select department, max(salary) from employee_s where status = 'active' group by department;
+------------+-------------+
| department | max(salary) |
+------------+-------------+
| IT         |    85000.00 |
| HR         |    35000.00 |
| Finance    |    90000.00 |
| Sales      |    30000.00 |
+------------+-------------+
4 rows in set (0.00 sec)


WAQ to find the lowest salary in each department considering only active employees.


mysql> select department, min(salary) from employee_s where status = 'active' group by department;
+------------+-------------+
| department | min(salary) |
+------------+-------------+
| IT         |    40000.00 |
| HR         |    35000.00 |
| Finance    |    90000.00 |
| Sales      |    30000.00 |
+------------+-------------+
4 rows in set (0.00 sec)




WAQ to find the number of active employess for each department and city.


WAQ TO FIND DEPARTMENT WISE employees count who join after january 2025.

mysql> select department, count(*) from employee_s where joining_date> '2025-01-01' group by department;


group by with order by:
=======================

WAQ TO FIND TOTAL SALARY OF EACH DEPARTMENT AND DISPLAY DEPARTMENTS FROM HIGHEST TOTAL SALARY TO LOWEST TOTAL SALARY.



mysql> select department, SUM(salary) from employee_s group by department ORDER BY SUM(SALARY) DESC;
+------------+-------------+
| department | SUM(salary) |
+------------+-------------+
| IT         |   208000.00 |
| Finance    |   132000.00 |
| HR         |   105000.00 |
| Sales      |    95000.00 |
+------------+-------------+
4 rows in set (0.00 sec)



mysql> select department, SUM(salary) AS TOTAL from employee_s group by department ORDER BY SUM(SALARY) DESC;
+------------+-----------+
| department | TOTAL     |
+------------+-----------+
| IT         | 208000.00 |
| Finance    | 132000.00 |
| HR         | 105000.00 |
| Sales      |  95000.00 |
+------------+-----------+
4 rows in set (0.01 sec)


WAQ. TO FIND NUMBER OF EMPLOYEES IN EACH DEPARTMENT AND DISPLAY DEPARTMENTS FROM HIGEST  EMPLOYEES TO LOWEST EMPLOYEES.


mysql> select department, COUNT(*) AS COUNT from employee_s group by department ORDER BY COUNT DESC;
+------------+-------+
| department | COUNT |
+------------+-------+
| IT         |     4 |
| HR         |     2 |
| Finance    |     2 |
| Sales      |     2 |
+------------+-------+
4 rows in set (0.00 sec)



WAQ TO FIND TOP TWO DEPARTMENTS BASED ON TOTAL SALARY.

mysql> select department, SUM(SALARY) AS TOTAL from employee_s group by department ORDER BY TOTAL DESC LIMIT 2;
+------------+-----------+
| department | TOTAL     |
+------------+-----------+
| IT         | 208000.00 |
| Finance    | 132000.00 |
+------------+-----------+
2 rows in set (0.00 sec)


HW. CAN WE USE OFFSET HERE: yesssssssss we cannnnnnn.

mysql> select department, SUM(SALARY) AS TOTAL from employee_s group by department ORDER BY TOTAL DESC LIMIT 2 offset 1;
+------------+-----------+
| department | TOTAL     |
+------------+-----------+
| Finance    | 132000.00 |
| HR         | 105000.00 |
+------------+-----------+
2 rows in set (0.00 sec)


2nd highest:
 
mysql> select department, SUM(SALARY) AS TOTAL from employee_s group by department ORDER BY TOTAL DESC LIMIT 1 offset 1;
+------------+-----------+
| department | TOTAL     |
+------------+-----------+
| Finance    | 132000.00 |
+------------+-----------+
1 row in set (0.00 sec)
