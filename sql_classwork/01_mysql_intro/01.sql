
mysql> select version();
--+-----------+
--| version() |
--+-----------+
--| 8.0.37    |
--+-----------+
--1 row in set (0.00 sec)




mysql> SELECT now();
--+---------------------+
--| now()               |
--+---------------------+
--| 2026-08-06 11:46:54 |
--+---------------------+
--1 row in set (0.02 sec)




mysql> select curtime();
--+-----------+
--| curtime() |
--+-----------+
--| 11:35:40  |
--+-----------+
--1 row in set (0.00 sec)



mysql> select user();
--+----------------+
--| user()         |
--+----------------+
--| root@localhost |
--+----------------+
--1 row in set (0.00 sec)



mysql> select database();
--+------------+
--| database() |
--+------------+
--| NULL       |
--+------------+
--1 row in set (0.00 sec)



mysql> select @@hostname;
--+-----------------+
--| @@hostname      |
--+-----------------+
--| LAPTOP-UA1I7MQJ |
--+-----------------+
--1 row in set (0.00 sec)


mysql> select @@port;
--+--------+
--| @@port |
--+--------+
--|   3306 |
--+--------+
--1 row in set (0.00 sec)



mysql> select sqrt(144);
--+-----------+
--| sqrt(144) |
--+-----------+
--|        12 |
--+-----------+
--1 row in set (0.00 sec)


mysql> select SQRT(144);
--+-----------+
--| SQRT(144) |
--+-----------+
--|        12 |
--+-----------+
--1 row in set (0.00 sec)


mysql> select POW(2,5);
--+----------+
--| POW(2,5) |
--+----------+
--|       32 |
--+----------+
--1 row in set (0.00 sec)




mysql> select RAND();
--+--------------------+
--| RAND()             |
--+--------------------+
--| 0.5762265516223634 |
--+--------------------+
--1 row in set (0.00 sec)




--same quey with diffrent way using like

mysql> SHOW VARIABLES LIKE 'hostname';
--+---------------+-----------------+
--| Variable_name | Value           |
--+---------------+-----------------+
--| hostname      | LAPTOP-UA1I7MQJ |
--+---------------+-----------------+
--1 row in set (0.02 sec)

mysql> SHOW VARIABLES LIKE 'port';
--+---------------+-------+
--| Variable_name | Value |
--+---------------+-------+
--| port          | 3306  |
--+---------------+-------+
--1 row in set (0.00 sec)

mysql> SELECT user, host FROM mysql.user;
--+------------------+-----------+
--| user             | host      |
--+------------------+-----------+
--| mysql.infoschema | localhost |
--| mysql.session    | localhost |
--| mysql.sys        | localhost |
--| root             | localhost |
--+------------------+-----------+





mysql> system cls;

-- it is used to clear the whole cmd screen 


mysql> quit
--Bye
--quit will exit us from the MySQL database.






