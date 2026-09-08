waq to find highest salary in each department considaring only active employees;


mysql> SELECT department, max(salary) from employee_h where employment_type = 'FULL_TIME' group by department;
+------------+-------------+
| department | max(salary) |
+------------+-------------+
| IT         |    85000.00 |
| HR         |    70000.00 |
| Sales      |    90000.00 |
| Finance    |    75000.00 |
+------------+-------------+
4 rows in set (0.00 sec)



WAQ to find num of active employees fro each department and city

mysql> select department, city, count(*) from employee_s where status = 'active' group by department, city;
mysql> select * from employee_h;

+-------------+---------------+------------+--------+------------+----------+-----------------+
| employee_id | employee_name | department | city   | experience | salary   | employment_type |
+-------------+---------------+------------+--------+------------+----------+-----------------+
|           1 | Amit          | IT         | Indore |          3 | 45000.00 | FULL_TIME       |
|           2 | Rahul         | IT         | Bhopal |          5 | 65000.00 | FULL_TIME       |
|           3 | Priya         | IT         | Indore |          7 | 85000.00 | FULL_TIME       |
|           4 | Neha          | HR         | Bhopal |          4 | 55000.00 | FULL_TIME       |
|           5 | Vikas         | HR         | Indore |          2 | 40000.00 | PART_TIME       |
|           6 | Sneha         | HR         | Bhopal |          6 | 70000.00 | FULL_TIME       |
|           7 | Ravi          | Sales      | Indore |          5 | 60000.00 | FULL_TIME       |
|           8 | Pooja         | Sales      | Bhopal |          3 | 45000.00 | PART_TIME       |
|           9 | Karan         | Sales      | Indore |          8 | 90000.00 | FULL_TIME       |
|          10 | Anjali        | Finance    | Bhopal |          4 | 60000.00 | FULL_TIME       |
|          11 | Manish        | Finance    | Indore |          6 | 75000.00 | FULL_TIME       |
|          12 | Kavya         | Finance    | Bhopal |          2 | 40000.00 | PART_TIME       |
+-------------+---------------+------------+--------+------------+----------+-----------------+
12 rows in set (0.00 sec)



mysql> select department, city, count(*) from employee_h where employment_type = 'FULL_TIME' group by department, city;
+------------+--------+----------+
| department | city   | count(*) |
+------------+--------+----------+
| IT         | Indore |        2 |
| IT         | Bhopal |        1 |
| HR         | Bhopal |        2 |
| Sales      | Indore |        2 |
| Finance    | Bhopal |        1 |
| Finance    | Indore |        1 |
+------------+--------+----------+
6 rows in set (0.00 sec)



HAVING CLAUSE IN MYSQL:

having is a sql clause use to filter groups created by the group the group by clause.


where clause filters individual rows.

where as having clause filters groups.


WAQ. TO FIND DEPARTMENTS HAVING MORE THEN TWO EMPLOYEES.


where : it filter rows. where: it works before group by

having : it filter goups  where : works after group by


where: it used with individual col

having: it commonly used with aggregate functions



ORDER:

table--- where--- filter rows--- group by--- gropuss--- aggregate function--- having------ filter groups --- order by----- limit


WAQ. TO FIND DEPARTMENTS WHERE TOTAL SALARY IS GREATER THEN 2 LAKHS.

mysql> SELECT DEPARTMENT, SUM(SALARY) FROM employee_h group by department having sum(salary) > 200000;
Empty set (0.00 sec)




WAQ TO FIND DEPARTMENTS WHERE EMPLOYEE COUNT IS GREATER THEN 2 AND AVG SALARY IS GREATER THEN 50000

mysql> select department, count(*) as total_emp, avg(salary) from employee_h group by department having count(*) > 2 and avg(salary) > 50000;
+------------+-----------+--------------+
| department | total_emp | avg(salary)  |
+------------+-----------+--------------+
| IT         |         3 | 65000.000000 |
| HR         |         3 | 55000.000000 |
| Sales      |         3 | 65000.000000 |
| Finance    |         3 | 58333.333333 |
+------------+-----------+--------------+
4 rows in set (0.01 sec)



WAQ. to find departments having at least 2 active employees.


mysql> select department, count(*) from employee_h where employment_type = 'FULL_TIME' group by department having count(*) >= 2;
+------------+----------+
| department | count(*) |
+------------+----------+
| IT         |        3 |
| HR         |        2 |
| Sales      |        2 |
| Finance    |        2 |
+------------+----------+
4 rows in set (0.00 sec)



WAQ to find departments the number of active employee is at leat 5.

mysql> select department, count(*) from employee_h where employment_type = 'FULL_TIME' group by department having count(*) >= 5;
Empty set (0.00 sec)



GROUP BY RULES:

1. selected normal column should be in group by.


mysql> select city, count(*) from employee_h where employment_type = 'FULL_TIME' group by department having count(*) >= 5;

ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'batch18.employee_h.city' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

2. IF multiple columns are selected then put them in group by.


mysql> select employee_name, sum(salary) from employee_h group by employee_name;
+---------------+-------------+
| employee_name | sum(salary) |
+---------------+-------------+
| Amit          |    45000.00 |
| Rahul         |    65000.00 |
| Priya         |    85000.00 |
| Neha          |    55000.00 |
| Vikas         |    40000.00 |
| Sneha         |    70000.00 |
| Ravi          |    60000.00 |
| Pooja         |    45000.00 |
| Karan         |    90000.00 |
| Anjali        |    60000.00 |
| Manish        |    75000.00 |
| Kavya         |    40000.00 |
+---------------+-------------+
12 rows in set (0.00 sec)



mysql> select department, employee_name, sum(salary) from employee_h group by department, employee_name;
+------------+---------------+-------------+
| department | employee_name | sum(salary) |
+------------+---------------+-------------+
| IT         | Amit          |    45000.00 |
| IT         | Rahul         |    65000.00 |
| IT         | Priya         |    85000.00 |
| HR         | Neha          |    55000.00 |
| HR         | Vikas         |    40000.00 |
| HR         | Sneha         |    70000.00 |
| Sales      | Ravi          |    60000.00 |
| Sales      | Pooja         |    45000.00 |
| Sales      | Karan         |    90000.00 |
| Finance    | Anjali        |    60000.00 |
| Finance    | Manish        |    75000.00 |
| Finance    | Kavya         |    40000.00 |
+------------+---------------+-------------+
12 rows in set (0.00 sec)


3. aggregate functions are not required in the group by

mysql> select department, count(*) as total from employee_h group by department, count(*);
ERROR 1056 (42000): Cant group on 'total'



mysql> select department from employee_h group by department;
+------------+
| department |
+------------+
| IT         |
| HR         |
| Sales      |
| Finance    |
+------------+
4 rows in set (0.00 sec)

but here no summary .


use aggregate functions to summarise group data.

mysql> select department, salary from employee_h group by department;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'batch18.employee_h.salary' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by


mysql> select department, salary from employee_h group by department, salary;
+------------+----------+
| department | salary   |
+------------+----------+
| IT         | 45000.00 |
| IT         | 65000.00 |
| IT         | 85000.00 |
| HR         | 55000.00 |
| HR         | 40000.00 |
| HR         | 70000.00 |
| Sales      | 60000.00 |
| Sales      | 45000.00 |
| Sales      | 90000.00 |
| Finance    | 60000.00 |
| Finance    | 75000.00 |
| Finance    | 40000.00 |
+------------+----------+
12 rows in set (0.00 sec)


where clause must be first.

mysql> SELECT DEPARTMENT, SUM(SALARY) FROM employee_h group by department where salary> 50000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where salary> 50000' at line 1






mysql> SELECT DEPARTMENT, SUM(SALARY) FROM employee_h group by department having salary> 50000;
ERROR 1054 (42S22): Unknown column 'salary' in 'having clause'



with having clause we need aggregate function.


mysql> SELECT DEPARTMENT, SUM(SALARY) FROM employee_h having sum(salary)> 50000;

ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'batch18.employee_h.department'; this is incompatible with sql_mode=only_full_group_by




mysql> select sum(salary) from employee_h where sum(salary)>50000;
ERROR 1111 (HY000): Invalid use of group function
m


mysql> select sum(salary) from employee_h having sum(salary)>50000;
+-------------+
| sum(salary) |
+-------------+
|   730000.00 |
+-------------+
1 row in set (0.00 sec)



with rollup : is an extention of group by that automatically adds summary rows such as sub totals to the result. 


SYNTAX:

SELECT col1, aggregate(col2) from employee group by col1 with rollup;


mysql> select department, sum(salary) from employee_h group by department with rollup;

+------------+-------------+
| department | sum(salary) |
+------------+-------------+
| Finance    |   175000.00 |
| HR         |   165000.00 |
| IT         |   195000.00 |
| Sales      |   195000.00 |
| NULL       |   730000.00 |
+------------+-------------+
5 rows in set (0.01 sec)





mysql> select department,city,  sum(salary) from employee_h group by department, city with rollup;

+------------+--------+-------------+
| department | city   | sum(salary) |
+------------+--------+-------------+
| Finance    | Bhopal |   100000.00 |
| Finance    | Indore |    75000.00 |
| Finance    | NULL   |   175000.00 |
| HR         | Bhopal |   125000.00 |
| HR         | Indore |    40000.00 |
| HR         | NULL   |   165000.00 |
| IT         | Bhopal |    65000.00 |
| IT         | Indore |   130000.00 |
| IT         | NULL   |   195000.00 |
| Sales      | Bhopal |    45000.00 |
| Sales      | Indore |   150000.00 |
| Sales      | NULL   |   195000.00 |
| NULL       | NULL   |   730000.00 |
+------------+--------+-------------+
13 rows in set (0.00 sec)




we can use group by without aggregate also in that case it will give one row for each unique group. 


mysql> select department, city from employee_h group by department, city;

+------------+--------+
| department | city   |
+------------+--------+
| IT         | Indore |
| IT         | Bhopal |
| HR         | Bhopal |
| HR         | Indore |
| Sales      | Indore |
| Sales      | Bhopal |
| Finance    | Bhopal |
| Finance    | Indore |
+------------+--------+
8 rows in set (0.00 sec)



mysql> select city from employee_h group by city ;

+--------+
| city   |
+--------+
| Indore |
| Bhopal |
+--------+
2 rows in set (0.00 sec)



HW.
*********************
distinct Vs group by
*********************