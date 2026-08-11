ASSIGNMENT 3 – PRODUCT MANAGEMENT SYSTEM

Q1. Create a database named shop_db and use the database.

Q2. Create a table named product with:
- product_id – INT, PRIMARY KEY, AUTO_INCREMENT
- product_name – VARCHAR(50)
- category – VARCHAR(50)
- brand – VARCHAR(50)
- price – INT
- quantity – INT

Q3. Insert the following 10 product records:

product_name | category | brand | price | quantity
Laptop | Electronics | Dell | 55000 | 10
Smartphone | Electronics | Samsung | 25000 | 15
Keyboard | Accessories | Logitech | 1500 | 25
Mouse | Accessories | HP | 800 | 30
Monitor | Electronics | LG | 18000 | 12
Headphones | Accessories | Sony | 3000 | 20
Printer | Electronics | Canon | 12000 | 8
Tablet | Electronics | Lenovo | 22000 | 14
Webcam | Accessories | Logitech | 2500 | 18
Speaker | Accessories | JBL | 4500 | 16

Q4. Display the structure of the product table using DESC.

Q5. Display all records from the product table.


-------------------------------------------------------------------


mysql> create database shop_db;
Query OK, 1 row affected (0.03 sec)


mysql> use shop_db;
Database changed


mysql> create table product(product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(50),category VARCHAR(50), brand VARCHAR(50), price INT,quantity INT);
Query OK, 0 rows affected (0.04 sec)


mysql> desc product;

+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| product_id   | int         | NO   | PRI | NULL    | auto_increment |
| product_name | varchar(50) | YES  |     | NULL    |                |
| category     | varchar(50) | YES  |     | NULL    |                |
| brand        | varchar(50) | YES  |     | NULL    |                |
| price        | int         | YES  |     | NULL    |                |
| quantity     | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)



mysql> insert into product(product_name, category, brand, price, quantity) values('Laptop', 'Electronics', 'Dell', 55000, 10),('Smartphone', 'Electronics', 'Samsung', 25000, 15),('Keyboard', 'Accessories', 'Logitech', 1500 , 25),('Mouse', 'Accessories', 'HP', 800, 30),('Monitor', 'Electronics', 'LG', 18000, 12),('Headphones', 'Accessories', 'Sony', 3000, 20),('Printer', 'Electronics', 'Canon', 12000, 8),('Tablet', 'Electronics', 'Lenovo', 22000, 14),('Webcam', 'Accessories', 'Logitech', 2500, 18),('Speaker', 'Accessories', 'JBL', 4500, 16);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0



mysql> select * from product;
+------------+--------------+-------------+----------+-------+----------+
| product_id | product_name | category    | brand    | price | quantity |
+------------+--------------+-------------+----------+-------+----------+
|          1 | Laptop       | Electronics | Dell     | 55000 |       10 |
|          2 | Smartphone   | Electronics | Samsung  | 25000 |       15 |
|          3 | Keyboard     | Accessories | Logitech |  1500 |       25 |
|          4 | Mouse        | Accessories | HP       |   800 |       30 |
|          5 | Monitor      | Electronics | LG       | 18000 |       12 |
|          6 | Headphones   | Accessories | Sony     |  3000 |       20 |
|          7 | Printer      | Electronics | Canon    | 12000 |        8 |
|          8 | Tablet       | Electronics | Lenovo   | 22000 |       14 |
|          9 | Webcam       | Accessories | Logitech |  2500 |       18 |
|         10 | Speaker      | Accessories | JBL      |  4500 |       16 |
+------------+--------------+-------------+----------+-------+----------+
10 rows in set (0.00 sec)