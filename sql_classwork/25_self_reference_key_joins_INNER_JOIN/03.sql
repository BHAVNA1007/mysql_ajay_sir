TYPES OF JOINS:
===============

INNER JOIN:
===========

IT returns only those rows for which a maching condition exists in both tables.
bydefault 


mysql> select e.empname, d.deptname from  employee18 as e INNER join department18 as d on e.deptid = d.deptid;

--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| kanak    | HR       |
--| thapaji  | finance  |
--| rashmika | sales    |
--+----------+----------+
--4 rows in set (0.00 sec)



mysql> select e.empname, d.deptname from  department18 as d  INNER join employee18 as e on e.deptid = d.deptid;

--+----------+----------+
--| empname  | deptname |
--+----------+----------+
--| deepika  | HR       |
--| kanak    | HR       |
--| thapaji  | finance  |
--| rashmika | sales    |
--+----------+----------+
--4 rows in set (0.00 sec)