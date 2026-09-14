Assignment 4:
 
Customer and Orders

Problem Statement:

A retail store wants to generate a report displaying all customers and their latest order details. The report should include customers who have not placed any orders.

Tables:

Customer (cust_id, cust_name)
Orders (order_id, cust_id, order_date, total_amount)

Query 1:

Write an SQL query using LEFT JOIN to display all customers with their order details, ensuring that customers with no orders are still included in the result.

Query 2:

Problem Statement:

The store wants to generate a report including all orders placed, even if the customer record is missing (i.e., orphan orders due to data inconsistency).


Query 3:

The store wants a comprehensive report showing all customers and all orders, even if some customers have no orders and some orders have missing customer details.


Query 4:

Problem Statement:

The store wants to analyze all possible customer-order pairings, regardless of actual transactions.



mysql> create table Customer (cust_id int primary key, cust_name   varchar(30));

--Query OK, 0 rows affected (0.13 sec)



mysql> insert into Customer values (101, 'tiya'), (102, 'kiya'), (103, 'siya'), (104, 'riya'), (105, 'sneha');

--Query OK, 5 rows affected (0.02 sec)
--Records: 5  Duplicates: 0  Warnings: 0



mysql> select * from Customer;

--+---------+-----------+
--| cust_id | cust_name |
--+---------+-----------+
--|     101 | tiya      |
--|     102 | kiya      |
--|     103 | siya      |
--|     104 | riya      |
--|     105 | sneha     |
--+---------+-----------+
--5 rows in set (0.00 sec)




mysql> create table Orders (order_id int primary key, cust_id int, order_date date, total_amount decimal(10,2));

--Query OK, 0 rows affected (0.03 sec)


mysql> insert into Orders values
    -> (1, 101, '2026-07-10', 4000),
    -> (2, 102, '2026-08-20', 6000),
    -> (3, 101, '2025-09-28', 8000),
    -> (4, 103, '2025-10-10', 7000),
    -> (5, 104, '1026-04-26', 3000),
    -> (6, null, NULL, NULL);

--Query OK, 6 rows affected (0.03 sec)
--Records: 6  Duplicates: 0  Warnings: 0



mysql> select * from Orders;

--+----------+---------+------------+--------------+
--| order_id | cust_id | order_date | total_amount |
--+----------+---------+------------+--------------+
--|        1 |     101 | 2026-07-10 |      4000.00 |
--|        2 |     102 | 2026-08-20 |      6000.00 |
--|        3 |     101 | 2025-09-28 |      8000.00 |
--|        4 |     103 | 2025-10-10 |      7000.00 |
--|        5 |     104 | 1026-04-26 |      3000.00 |
--|        6 |    NULL | NULL       |         NULL |
--+----------+---------+------------+--------------+
--6 rows in set (0.00 sec)



Query 1:

Write an SQL query using LEFT JOIN to display all customers with their order details, ensuring that customers with no orders are still included in the result.

mysql> select * from Customer as c LEFT JOIN orders as o on c.cust_id = o.cust_id;

--+---------+-----------+----------+---------+------------+--------------+
--| cust_id | cust_name | order_id | cust_id | order_date | total_amount |
--+---------+-----------+----------+---------+------------+--------------+
--|     101 | tiya      |        3 |     101 | 2025-09-28 |      8000.00 |
--|     101 | tiya      |        1 |     101 | 2026-07-10 |      4000.00 |
--|     102 | kiya      |        2 |     102 | 2026-08-20 |      6000.00 |
--|     103 | siya      |        4 |     103 | 2025-10-10 |      7000.00 |
--|     104 | riya      |        5 |     104 | 1026-04-26 |      3000.00 |
--|     105 | sneha     |     NULL |    NULL | NULL       |         NULL |
--+---------+-----------+----------+---------+------------+--------------+
--6 rows in set (0.00 sec)




Query 2:

Problem Statement:

The store wants to generate a report including all orders placed, even if the customer record is missing (i.e., orphan orders due to data inconsistency).


mysql> select * from  orders as o left join  customer as c on  c.cust_id = o.cust_id;

--+----------+---------+------------+--------------+---------+-----------+
--| order_id | cust_id | order_date | total_amount | cust_id | cust_name |
--+----------+---------+------------+--------------+---------+-----------+
--|        1 |     101 | 2026-07-10 |      4000.00 |     101 | tiya      |
--|        2 |     102 | 2026-08-20 |      6000.00 |     102 | kiya      |
--|        3 |     101 | 2025-09-28 |      8000.00 |     101 | tiya      |
--|        4 |     103 | 2025-10-10 |      7000.00 |     103 | siya      |
--|        5 |     104 | 1026-04-26 |      3000.00 |     104 | riya      |
--|        6 |    NULL | NULL       |         NULL |    NULL | NULL      |
--+----------+---------+------------+--------------+---------+-----------+
--6 rows in set (0.00 sec)



Query 3:

The store wants a comprehensive report showing all customers and all orders, even if some customers have no orders and some orders have missing customer details.


mysql> select * from customer as c left join orders as o on c.cust_id = o.cust_id
    -> union
    -> select * from customer as c right join orders as o on c.cust_id = o.cust_id;

--+---------+-----------+----------+---------+------------+--------------+
--| cust_id | cust_name | order_id | cust_id | order_date | total_amount |
--+---------+-----------+----------+---------+------------+--------------+
--|     101 | tiya      |        3 |     101 | 2025-09-28 |      8000.00 |
--|     101 | tiya      |        1 |     101 | 2026-07-10 |      4000.00 |
--|     102 | kiya      |        2 |     102 | 2026-08-20 |      6000.00 |
--|     103 | siya      |        4 |     103 | 2025-10-10 |      7000.00 |
--|     104 | riya      |        5 |     104 | 1026-04-26 |      3000.00 |
--|     105 | sneha     |     NULL |    NULL | NULL       |         NULL |
--|    NULL | NULL      |        6 |    NULL | NULL       |         NULL |
--+---------+-----------+----------+---------+------------+--------------+
--7 rows in set (0.00 sec)



Query 4:

Problem Statement:

The store wants to analyze all possible customer-order pairings, regardless of actual transactions.


mysql> select cust_name, order_id from customer cross join orders as o ;

--+-----------+----------+
--| cust_name | order_id |
--+-----------+----------+
--| sneha     |        1 |
--| riya      |        1 |
--| siya      |        1 |
--| kiya      |        1 |
--| tiya      |        1 |
--| sneha     |        2 |
--| riya      |        2 |
--| siya      |        2 |
--| kiya      |        2 |
--| tiya      |        2 |
--| sneha     |        3 |
--| riya      |        3 |
--| siya      |        3 |
--| kiya      |        3 |
--| tiya      |        3 |
--| sneha     |        4 |
--| riya      |        4 |
--| siya      |        4 |
--| kiya      |        4 |
--| tiya      |        4 |
--| sneha     |        5 |
--| riya      |        5 |
--| siya      |        5 |
--| kiya      |        5 |
--| tiya      |        5 |
--| sneha     |        6 |
--| riya      |        6 |
--| siya      |        6 |
--| kiya      |        6 |
--| tiya      |        6 |
--+-----------+----------+
--30 rows in set (0.00 sec)