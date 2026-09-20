Enter your choice: 12
12. Display Customers Who Have Not Placed Any Order
--------------------------------------------------
Customer ID     | Customer Name   
--------------------------------------------------
5               | Karan           
--------------------------------------------------
connection closed successfully

Enter your choice: 11
11. Display Customers Who Have Placed at Least One Order
--------------------------------------------------
Customer ID     | Customer Name   
--------------------------------------------------
1               | Amit            
2               | Priya           
3               | Rahul           
4               | Neha            
6               | Bhavna          
--------------------------------------------------
connection closed successfully


Enter your choice: 10

10. Display Products Costing More Than Average ProductPrice
--------------------------------------------------
Product ID      | Product Name    | Price     
--------------------------------------------------
101             | Laptop          | 55000.00  
105             | Monitor         | 12000.00  
--------------------------------------------------
connection closed successfully




Enter your choice: 9
9. Display Customer-wise Total Purchase Amount
--------------------------------------------------
Customer ID     | Customer Name   | amount    
--------------------------------------------------
1               | Amit            | 56800.00  
2               | Priya           | 1500.00   
3               | Rahul           | 24500.00  
4               | Neha            | 55000.00  
6               | Bhavna          | 80.00     
--------------------------------------------------
connection closed successfully


Enter your choice: 8
8. Delete Order
Enter Order ID: 1007
Order deleted successfully.
connection closed successfully

mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Delivered    |
|     1006 |           4 |        101 |        1 | Pending      |
|     1008 |           6 |        107 |        2 | Pending      |
+----------+-------------+------------+----------+--------------+
7 rows in set (0.00 sec)


mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Delivered    |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
|     1008 |           6 |        107 |        2 | Pending      |
+----------+-------------+------------+----------+--------------+
8 rows in set (0.00 sec)

Enter your choice: 7
7. Update Order Status
Enter Order ID: 1005
Enter New Status: Delivered
Order status updated successfully
connection closed successfully


mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Delivered    |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
|     1008 |           6 |        107 |        2 | Pending      |
+----------+-------------+------------+----------+--------------+
8 rows in set (0.00 sec)

mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Pending      |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
|     1008 |           6 |        107 |        2 | Pending      |
+----------+-------------+------------+----------+--------------+
8 rows in set (0.00 sec)



Enter your choice: 6  
6. Update Product Price
Enter Product ID: 102
Enter New Price: 900
connection closed successfully

mysql> select * from product_order_pdbc;
+------------+--------------+-------------+----------+-------+
| product_id | product_name | category    | price    | stock |
+------------+--------------+-------------+----------+-------+
|        101 | Laptop       | Electronics | 55000.00 |    10 |
|        102 | Mouse        | Electronics |   900.00 |    50 |
|        103 | Keyboard     | Electronics |  1500.00 |    30 |
|        104 | Notebook     | Stationery  |   100.00 |   100 |
|        105 | Monitor      | Electronics | 12000.00 |    15 |
|        106 | Pen          |  Stationery |    20.00 |   200 |
|        107 | Erasor       | Stationery  |    40.00 |    50 |
+------------+--------------+-------------+----------+-------+
7 rows in set (0.00 sec)


mysql> select * from product_order_pdbc;
+------------+--------------+-------------+----------+-------+
| product_id | product_name | category    | price    | stock |
+------------+--------------+-------------+----------+-------+
|        101 | Laptop       | Electronics | 55000.00 |    10 |
|        102 | Mouse        | Electronics |   800.00 |    50 |
|        103 | Keyboard     | Electronics |  1500.00 |    30 |
|        104 | Notebook     | Stationery  |   100.00 |   100 |
|        105 | Monitor      | Electronics | 12000.00 |    15 |
|        106 | Pen          |  Stationery |    20.00 |   200 |
|        107 | Erasor       | Stationery  |    40.00 |    50 |
+------------+--------------+-------------+----------+-------+
7 rows in set (0.00 sec)

Enter your choice: 5 
5. Search Customer by Name
Enter customer name to search: an
--------------------------------------------------
Customer ID     | Customer Name   | City      
--------------------------------------------------
5               | Karan           | Dewas     
--------------------------------------------------
connection closed successfully


Enter your choice: 4
4. Display All Orders with Customer and Product Details
----------------------------------------------------------------------------------------------------
Order_ID   | Customer_Name   | Product_Name    | Quantity | Price      | Amount     | Status    
----------------------------------------------------------------------------------------------------
1001       | Amit            | Laptop          | 1        | 55000.00   | 55000.00   | Delivered 
1002       | Amit            | Mouse           | 2        | 800.00     | 1600.00    | Delivered 
1003       | Priya           | Keyboard        | 1        | 1500.00    | 1500.00    | Shipped   
1004       | Rahul           | Monitor         | 2        | 12000.00   | 24000.00   | Delivered 
1005       | Rahul           | Notebook        | 5        | 100.00     | 500.00     | Pending   
1006       | Neha            | Laptop          | 1        | 55000.00   | 55000.00   | Pending   
1007       | Karan           | Pen             | 10       | 20.00      | 200.00     | Delivered 
1008       | Bhavna          | Erasor          | 2        | 40.00      | 80.00      | Pending   
----------------------------------------------------------------------------------------------------
connection closed successfully


Enter your choice: 3
3. Place Order
Enter order id: 1008
Enter customer id: 6
Enter product id: 107
Enter order quantity: 2
Enter order status: Pending
Order placed successfully.
connection closed successfully

mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Pending      |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
+----------+-------------+------------+----------+--------------+
7 rows in set (0.02 sec)

mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Pending      |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
|     1008 |           6 |        107 |        2 | Pending      |
+----------+-------------+------------+----------+--------------+
8 rows in set (0.00 sec)




Enter your choice: 2
2. Add Product
Enter product id: 107
Enter product name: Erasor
enter product category: Stationery
Enter product price: 40
Enter product stock: 50
product added successfully
connection closed successfully

mysql> select * from product_order_pdbc;
+------------+--------------+-------------+----------+-------+
| product_id | product_name | category    | price    | stock |
+------------+--------------+-------------+----------+-------+
|        101 | Laptop       | Electronics | 55000.00 |    10 |
|        102 | Mouse        | Electronics |   800.00 |    50 |
|        103 | Keyboard     | Electronics |  1500.00 |    30 |
|        104 | Notebook     | Stationery  |   100.00 |   100 |
|        105 | Monitor      | Electronics | 12000.00 |    15 |
|        106 | Pen          |  Stationery |    20.00 |   200 |
+------------+--------------+-------------+----------+-------+
6 rows in set (0.02 sec)

mysql> select * from product_order_pdbc;
+------------+--------------+-------------+----------+-------+
| product_id | product_name | category    | price    | stock |
+------------+--------------+-------------+----------+-------+
|        101 | Laptop       | Electronics | 55000.00 |    10 |
|        102 | Mouse        | Electronics |   800.00 |    50 |
|        103 | Keyboard     | Electronics |  1500.00 |    30 |
|        104 | Notebook     | Stationery  |   100.00 |   100 |
|        105 | Monitor      | Electronics | 12000.00 |    15 |
|        106 | Pen          |  Stationery |    20.00 |   200 |
|        107 | Erasor       | Stationery  |    40.00 |    50 |
+------------+--------------+-------------+----------+-------+
7 rows in set (0.00 sec)







Enter your choice: 1
1. Add Customer
Enter customer id: 6
Enter customer name: Bhavna
Enter customer cityBhopal
Enter customer emailBhavna@gmail.com
customer added successfully
connection closed successfully

mysql> select * from  customer_order_pdbc;
+-------------+---------------+--------+------------------+
| customer_id | customer_name | city   | email            |
+-------------+---------------+--------+------------------+
|           1 | Amit          | Indore | amit@gmail.com   |
|           2 | Priya         | Bhopal | priya@gmail.com  |
|           3 | Rahul         | Indore | rahul@gmail.com  |
|           4 | Neha          | Ujjain | neha@gmail.com   |
|           5 | Karan         | Dewas  | karan@gmail.com  |
|           6 | Bhavna        | Bhopal | Bhavna@gmail.com |
+-------------+---------------+--------+------------------+
6 rows in set (0.00 sec)



TABLE 1: customer_order_pdbc
----------------------------
Column       Data Type
--------------------------------
(customer_id  INT PRIMARY KEY, customer_name VARCHAR(60), city VARCHAR(40), email VARCHAR(80));

SAMPLE DATA
-----------
customer_id  customer_name  city       email
---------------------------------------------------------
(1, 'Amit',  'Indore', 'amit@gmail.com'),
(2, 'Priya', 'Bhopal', 'priya@gmail.com'),
(3, 'Rahul', 'Indore', 'rahul@gmail.com'),
(4, 'Neha',  'Ujjain', 'neha@gmail.com'),
(5, 'Karan', 'Dewas ', 'karan@gmail.com');





TABLE 2: product_order_pdbc
---------------------------
Column       Data Type
--------------------------------
(product_id   INT PRIMARY KEY, product_name VARCHAR(80), category VARCHAR(40), price DECIMAL(10,2), stock INT)

product_id  product_name  category       price      stock
------------------------------------------------------------
(101, 'Laptop',  'Electronics', 55000,  10),
(102, 'Mouse',  'Electronics', 800,  50),
(103, 'Keyboard',  'Electronics', 1500,  30),
(104, 'Notebook',  'Stationery', 100, 100),
(105, 'Monitor',  'Electronics', 12000,  15),
(106, 'Pen',  ' Stationery', 20,  200);


TABLE 3: customer_order_details
-------------------------------
Column       Data Type
--------------------------------
(order_id INT PRIMARY KEY, customer_id  INT, constraint customer_key FOREIGN KEY(customer_id) references customer_order_pdbc(customer_id), product_id INT , constraint product_key FOREIGN KEY(product_id) references product_order_pdbc(product_id), quantity INT, order_status VARCHAR(30));

Foreign keys:
customer_id references customer_order_pdbc(customer_id)
product_id references product_order_pdbc(product_id)

SAMPLE DATA
-----------
order_id  customer_id  product_id  quantity  order_status
------------------------------------------------------------
(1001, 1, 101, 1,  'Delivered'),
(1002, 1, 102, 2,  'Delivered'),
(1003, 2, 103, 1,  'Shipped'),
(1004, 3, 105, 2,  'Delivered'),
(1005, 3, 104, 5,  'Pending'),
(1006, 4, 101, 1,  'Pending'),
(1007, 5, 106, 10, 'Delivered');











mysql> select database();
+---------------+
| database()    |
+---------------+
| pdbc_practice |
+---------------+
1 row in set (0.00 sec)

mysql> create table customer_order_pdbc (customer_id  INT PRIMARY KEY, customer_name VARCHAR(60), city VARCHAR(40), email VARCHAR(80));
Query OK, 0 rows affected (0.08 sec)

mysql> desc customer_order_pdbc;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| customer_id   | int         | NO   | PRI | NULL    |       |
| customer_name | varchar(60) | YES  |     | NULL    |       |
| city          | varchar(40) | YES  |     | NULL    |       |
| email         | varchar(80) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)




mysql> select * from customer_order_pdbc;
+-------------+---------------+--------+-----------------+
| customer_id | customer_name | city   | email           |
+-------------+---------------+--------+-----------------+
|           1 | Amit          | Indore | amit@gmail.com  |
|           2 | Priya         | Bhopal | priya@gmail.com |
|           3 | Rahul         | Indore | rahul@gmail.com |
|           4 | Neha          | Ujjain | neha@gmail.com  |
|           5 | Karan         | Dewas  | karan@gmail.com |
+-------------+---------------+--------+-----------------+
5 rows in set (0.00 sec)




mysql> create table product_order_pdbc (product_id   INT PRIMARY KEY, product_name VARCHAR(80), category VARCHAR(40), price DECIMAL(10,2), stock INT);
Query OK, 0 rows affected (0.03 sec)


mysql> desc product_order_pdbc;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| product_id   | int           | NO   | PRI | NULL    |       |
| product_name | varchar(80)   | YES  |     | NULL    |       |
| category     | varchar(40)   | YES  |     | NULL    |       |
| price        | decimal(10,2) | YES  |     | NULL    |       |
| stock        | int           | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
5 rows in set (0.00 sec)


mysql> insert into product_order_pdbc values
    -> (101, 'Laptop',  'Electronics', 55000,  10),
    -> (102, 'Mouse',  'Electronics', 800,  50),
    -> (103, 'Keyboard',  'Electronics', 1500,  30),
    -> (104, 'Notebook',  'Stationery', 100, 100),
    -> (105, 'Monitor',  'Electronics', 12000,  15),
    -> (106, 'Pen',  ' Stationery', 20,  200);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0


mysql> select  * from product_order_pdbc;
+------------+--------------+-------------+----------+-------+
| product_id | product_name | category    | price    | stock |
+------------+--------------+-------------+----------+-------+
|        101 | Laptop       | Electronics | 55000.00 |    10 |
|        102 | Mouse        | Electronics |   800.00 |    50 |
|        103 | Keyboard     | Electronics |  1500.00 |    30 |
|        104 | Notebook     | Stationery  |   100.00 |   100 |
|        105 | Monitor      | Electronics | 12000.00 |    15 |
|        106 | Pen          |  Stationery |    20.00 |   200 |
+------------+--------------+-------------+----------+-------+
6 rows in set (0.00 sec)




mysql> create table customer_order_details  (order_id INT PRIMARY KEY, customer_id  INT, constraint customer_key FOREIGN KEY(customer_id) references customer_order_pdbc(customer_id), product_id INT , constraint product_key FOREIGN KEY(product_id) references product_order_pdbc(product_id), quantity INT, order_status VARCHAR(30));
Query OK, 0 rows affected (0.09 sec)

mysql> desc customer_order_details;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| order_id     | int         | NO   | PRI | NULL    |       |
| customer_id  | int         | YES  | MUL | NULL    |       |
| product_id   | int         | YES  | MUL | NULL    |       |
| quantity     | int         | YES  |     | NULL    |       |
| order_status | varchar(30) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into customer_order_details values
    -> (1001, 1, 101, 1,  'Delivered'),
    -> (1002, 1, 102, 2,  'Delivered'),
    -> (1003, 2, 103, 1,  'Shipped'),
    -> (1004, 3, 105, 2,  'Delivered'),
    -> (1005, 3, 104, 5,  'Pending'),
    -> (1006, 4, 101, 1,  'Pending'),
    -> (1007, 5, 106, 10, 'Delivered');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from customer_order_details;
+----------+-------------+------------+----------+--------------+
| order_id | customer_id | product_id | quantity | order_status |
+----------+-------------+------------+----------+--------------+
|     1001 |           1 |        101 |        1 | Delivered    |
|     1002 |           1 |        102 |        2 | Delivered    |
|     1003 |           2 |        103 |        1 | Shipped      |
|     1004 |           3 |        105 |        2 | Delivered    |
|     1005 |           3 |        104 |        5 | Pending      |
|     1006 |           4 |        101 |        1 | Pending      |
|     1007 |           5 |        106 |       10 | Delivered    |
+----------+-------------+------------+----------+--------------+
7 rows in set (0.00 sec)

