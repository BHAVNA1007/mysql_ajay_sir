LEFT JOIN :
===========

it returns all the rows from the left table, matching row from the right  table

display evry employee along with thier derpartment name if an emp is not assign to any valid department still display that emp.

mysql> select e.empname, d.deptname from employee18 as e left join department18 as d on e.deptid = d.deptid;

--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| thapaji  | finance  |
--| kanak    | HR       |
--| katappa  | NULL     |
--| rashmika | sales    |
--+----------+----------+
--5 rows in set (0.05 sec)




mysql> select e.empname, d.deptname from department18 as d left join employee18 as e on e.deptid = d.deptid;

--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | HR        |
--| kanak    | HR        |
--| NULL     | marketing |
--| thapaji  | finance   |
--| rashmika | sales     |
--+----------+-----------+
--5 rows in set (0.00 sec)




left join all the recort from left table are guarantee
*****************************************************

RIGHT JOIN:
===========

right join returns all the rows from the right table maching rows from the left table if no matching rows exists in the left table then null values are return for the left table columns.


mysql> select e.empname, d.deptname from department18 as d right join employee18 as e on e.deptid = d.deptid;

--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| thapaji  | finance  |
--| kanak    | HR       |
--| katappa  | NULL     |
--| rashmika | sales    |
--+----------+----------+
--5 rows in set (0.00 sec)



mysql> select e.empname, d.deptname from employee18 as e right join department18 as d on e.deptid = d.deptid;

--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | HR        |
--| kanak    | HR        |
--| NULL     | marketing |
--| thapaji  | finance   |
--| rashmika | sales     |
--+----------+-----------+
--5 rows in set (0.00 sec)

*****************************************************


CROSS JOIN:
===========

It combines every row of the first table with every row of the second table. 


cross join = every row of the first table * every row of second table


A ..... 3
B ...... 4


12 total rows will be there.

CROSS JOIN in useful when  we want intentionally all possible combination between two sets of data

generate all product and color combination.
generate all student and subject
generate all size with products.

generate all city with delhievery slot



mysql> select e.empname, d.deptname from employee18 as e cross join department18 as d ;

--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | sales     |
--| deepika  | finance   |
--| deepika  | marketing |
--| deepika  | HR        |
--| thapaji  | sales     |
--| thapaji  | finance   |
--| thapaji  | marketing |
--| thapaji  | HR        |
--| kanak    | sales     |
--| kanak    | finance   |
--| kanak    | marketing |
--| kanak    | HR        |
--| katappa  | sales     |
--| katappa  | finance   |
--| katappa  | marketing |
--| katappa  | HR        |
--| rashmika | sales     |
--| rashmika | finance   |
--| rashmika | marketing |
--| rashmika | HR        |
--+----------+-----------+
--20 rows in set (0.00 sec)




In cross we do not use ON condition because it dose not find matching rows. 

mysql>  select e.empname, d.deptname from  employee18 as e join department18 as d;

--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | sales     |
--| deepika  | finance   |
--| deepika  | marketing |
--| deepika  | HR        |
--| thapaji  | sales     |
--| thapaji  | finance   |
--| thapaji  | marketing |
--| thapaji  | HR        |
--| kanak    | sales     |
--| kanak    | finance   |
--| kanak    | marketing |
--| kanak    | HR        |
--| katappa  | sales     |
--| katappa  | finance   |
--| katappa  | marketing |
--| katappa  | HR        |
--| rashmika | sales     |
--| rashmika | finance   |
--| rashmika | marketing |
--| rashmika | HR        |
--+----------+-----------+
--20 rows in set (0.00 sec)



mysql> create table product18(pid int primary key, pname varchar(30));
Query OK, 0 rows affected (0.08 sec)

mysql> create table color18(colorid int primary key, colorname varchar(20));
Query OK, 0 rows affected (0.03 sec)

Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0



mysql> select * from product18;

--+-----+--------+
--| pid | pname  |
--+-----+--------+
--| 101 | jeans  |
--| 102 | Tshirt |
--| 103 | jacket |
--+-----+--------+
--3 rows in set (0.00 sec)




mysql> insert into color18 values(1, 'red'),(2, 'black'),(3, 'blue');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0




mysql> select * from color18;
--+---------+-----------+
--| colorid | colorname |
--+---------+-----------+
--|       1 | red       |
--|       2 | black     |
--|       3 | blue      |
--+---------+-----------+
--3 rows in set (0.00 sec)




mysql> select p.pname, c.colorname from product18 as p  cross join  color18 as c;

--+--------+-----------+
--| pname  | colorname |
--+--------+-----------+
--| jacket | red       |
--| Tshirt | red       |
--| jeans  | red       |
--| jacket | black     |
--| Tshirt | black     |
--| jeans  | black     |
--| jacket | blue      |
--| Tshirt | blue      |
--| jeans  | blue      |
--+--------+-----------+
--9 rows in set (0.00 sec)



mysql> select p.pname, c.colorname from product18 as p  cross join  color18 as c order by p.pname, c.colorname ASC;

--+--------+-----------+
--| pname  | colorname |
--+--------+-----------+
--| jacket | black     |
--| jacket | blue      |
--| jacket | red       |
--| jeans  | black     |
--| jeans  | blue      |
--| jeans  | red       |
--| Tshirt | black     |
--| Tshirt | blue      |
--| Tshirt | red       |
--+--------+-----------+
--9 rows in set (0.00 sec)


*****************************************************

SELF JOIN:
=========

IS a join in which a table is join with itself. it means the same table plays two diffrent rols.


mysql> select * from  selfemployee;

--+-------+----------+-----------+
--| empid | empname  | managerid |
--+-------+----------+-----------+
--|   101 | deepika  |      NULL |
--|   102 | thapaji  |       101 |
--|   103 | rashmika |       102 |
--|   104 | umesh    |       101 |
--|   105 | abhi     |       105 |
--+-------+----------+-----------+
--5 rows in set (0.02 sec)




WAQ to display every employee along with there managers name.

mysql> select e.empname as employee , m.empname as manager from selfemployee as e join selfemployee as m on e.managerid = m.empid;

--+----------+---------+
--| employee | manager |
--+----------+---------+
--| thapaji  | deepika |
--| rashmika | thapaji |
--| umesh    | deepika |
--| abhi     | abhi    |
--+----------+---------+
--4 rows in set (0.00 sec)



WAQ to display every employee including employees who do not have a manager. 



mysql> SELECT e.empname AS employee,
    ->        m.empname AS manager
    -> FROM selfemployee AS e
    -> LEFT JOIN selfemployee AS m
    -> ON e.managerid = m.empid;


--+----------+---------+
--| employee | manager |
--+----------+---------+
--| deepika  | NULL    |
--| thapaji  | deepika |
--| rashmika | thapaji |
--| umesh    | deepika |
--| abhi     | abhi    |
--+----------+---------+
--5 rows in set (0.00 sec)





“If I want both left and right data, can I use a FULL JOIN? Does MySQL support it?”

Answer: No. MySQL does not directly support FULL OUTER JOIN

How to get FULL JOIN result in MySQL
------------------------------------

We usually combine LEFT JOIN + RIGHT JOIN using UNION

So, MySQL → no FULL OUTER JOIN keyword, but you can achieve the same result using LEFT JOIN + RIGHT JOIN + UNION.



mysql> select e.empname, d.deptname from department18 as d right join employee18 as e on e.deptid = d.deptid UNION select e.empname, d.deptname from department18 as d left join employee18 as e on e.deptid = d.deptid;


--+----------+-----------+
--| empname  | deptname  |
--+----------+-----------+
--| deepika  | HR        |
--| thapaji  | finance   |
--| kanak    | HR        |
--| katappa  | NULL      |
--| rashmika | sales     |
--| NULL     | marketing |
--+----------+-----------+
--6 rows in set (0.01 sec)


LEFT Keeps all employees, even employees without a department.

RIGHT Keeps all departments, even departments without employees.

UNION Combines both results and removes duplicate rows.


