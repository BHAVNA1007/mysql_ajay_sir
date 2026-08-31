mysql> use batch18;
Database changed
mysql> create table orders(orderid INT PRIMARY KEY, name VARCHAR(20), pname VARCHAR(20), amount DECIMAL(10,2), orderstatus VARCHAR(20));
Query OK, 0 rows affected (0.08 sec)

mysql> desc orders;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| orderid     | int           | NO   | PRI | NULL    |       |
| name        | varchar(20)   | YES  |     | NULL    |       |
| pname       | varchar(20)   | YES  |     | NULL    |       |
| amount      | decimal(10,2) | YES  |     | NULL    |       |
| orderstatus | varchar(20)   | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
5 rows in set (0.02 sec)



mysql> insert into orders values(101, 'rahul', 'laptop', 50000, 'pending'), (102, 'amit', 'mobile', 30000, 'pending');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50000.00 | pending     |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)




mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)



mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50000.00 | pending     |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)




mysql> update orders set orderstatus = 'confirmed' where orderid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50000.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)



mysql> savepoint orderconfirmed;
Query OK, 0 rows affected (0.00 sec)



mysql> update orders set amount = amount - 5000 where orderid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 45000.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)



mysql> rollback to savepoint orderconfirmed;
Query OK, 0 rows affected (0.00 sec)




mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50000.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)




mysql> update orders set amount = amount + 500 where orderid = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0




mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)




mysql> commit;
Query OK, 0 rows affected (0.01 sec)



mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)




mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)



*****************************************************

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update orders set orderstatus = 'confirmed' where orderid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | confirmed   |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> savepoint orderconfirmed;
Query OK, 0 rows affected (0.00 sec)

mysql> update orders set amount = amount - 5000 where orderid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> release savepoint orderconfirmed;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 25000.00 | confirmed   |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)


mysql> rollback;
Query OK, 0 rows affected (0.01 sec)


mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)


mysql> rollback to savepoint orderconfirmed;
ERROR 1305 (42000): SAVEPOINT orderconfirmed does not exist


mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)


*****************************************************

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 30000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> update orders set amount = amount + 10000 where orderid = 102;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 40000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 40000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> select @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

mysql> show variables like 'autocommit';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| autocommit    | ON    |
+---------------+-------+
1 row in set (0.02 sec)



mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 40000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> update orders set amount = amount + 10000 where orderid = 102;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 50000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 50000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> set autocommit = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> select @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

mysql> show variables like 'autocommit';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| autocommit    | OFF   |
+---------------+-------+
1 row in set (0.01 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 50000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> update orders set amount = amount + 10000 where orderid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 60000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 50000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 50000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> update orders set amount = amount + 10000 where orderid = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+
| orderid | name  | pname  | amount   | orderstatus |
+---------+-------+--------+----------+-------------+
|     101 | rahul | laptop | 50500.00 | confirmed   |
|     102 | amit  | mobile | 60000.00 | pending     |
+---------+-------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> alter table orders add column (address VARCHAR(20));
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+---------+-------+--------+----------+-------------+---------+
| orderid | name  | pname  | amount   | orderstatus | address |
+---------+-------+--------+----------+-------------+---------+
|     101 | rahul | laptop | 50500.00 | confirmed   | NULL    |
|     102 | amit  | mobile | 60000.00 | pending     | NULL    |
+---------+-------+--------+----------+-------------+---------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+---------+-------+--------+----------+-------------+---------+
| orderid | name  | pname  | amount   | orderstatus | address |
+---------+-------+--------+----------+-------------+---------+
|     101 | rahul | laptop | 50500.00 | confirmed   | NULL    |
|     102 | amit  | mobile | 60000.00 | pending     | NULL    |
+---------+-------+--------+----------+-------------+---------+
2 rows in set (0.00 sec)

mysql> set autocommit = 1;
Query OK, 0 rows affected (0.00 sec)

mysql> show variables like 'autocommit';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| autocommit    | ON    |
+---------------+-------+
1 row in set (0.00 sec)