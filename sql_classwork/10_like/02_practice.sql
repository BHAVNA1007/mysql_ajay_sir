mysql> create database Product_Management_System;
Query OK, 1 row affected (0.01 sec)



mysql> create table products(Product_ID int auto_increment primary key, Product_Name varchar(20), Category varchar(15), Brand varchar(10), City varchar(15), Price decimal(10,2), Stock int, Rating decimal(2,1), MFG_Date date);
Query OK, 0 rows affected (0.06 sec)



mysql> desc products;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| Product_ID   | int           | NO   | PRI | NULL    | auto_increment |
| Product_Name | varchar(20)   | YES  |     | NULL    |                |
| Category     | varchar(15)   | YES  |     | NULL    |                |
| Brand        | varchar(10)   | YES  |     | NULL    |                |
| City         | varchar(15)   | YES  |     | NULL    |                |
| Price        | decimal(10,2) | YES  |     | NULL    |                |
| Stock        | int           | YES  |     | NULL    |                |
| Rating       | decimal(2,1)  | YES  |     | NULL    |                |
| MFG_Date     | date          | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)






mysql> insert into products(Product_Name, Category, Brand, City, Price, Stock, Rating, MFG_Date) values('laptop', 'Electronic', 'HP', 'Mumbai', 50000, 50, 4.9, '2021-03-18'),
    ->      ('AC', 'Electronic', 'LG', 'Pune', 65000, 90, 4.4, '2021-09-28'),
    ->      ('Washing Machine', 'Electronic', 'Samsung', 'Indore', 15000, 65, 3.4, '2022-04-23'),
    ->      ('Almira', 'Furniture', 'Usa', 'Pune', 10000, 55, 3.9, '2023-09-27'),
    ->      ('Sofa', 'Furniture', 'WoodStreet', 'Mumbai', 30000, 45, 5, '2022-10-17'),
    ->      ('Dining Table', 'Furniture', 'Nilkamal', 'Delhi', 10000, 40, 3.8, '2024-11-27'),
    ->      ('Dressing Table', 'Furniture', 'Nilkamal', 'Indore', 20000, 25, 3.1, '2025-10-11'),
    ->      ('Printed Kurta', 'Clothing', 'biba', 'Delhi', 2000, 95, 2.9, '2023-12-21'),
    ->      ('Slim Fit Trousers', 'Clothing', 'biba', 'Delhi', 2500, 99, 2.5, '2022-2-28'),
    ->      ('Casual Denim Jacket', 'Clothing', 'Puma', 'Mumbai', 1000, 77, 4.5, '2021-07-09'),
    ->      ('Casual Hoodie', 'Clothing', 'Puma', 'Pune', 1200, 74, 4.3, '2022-07-09'),
    ->      ('Basmati Rice', 'Grocery', 'India Gate', 'Indore', 3000, 100, 4.2, '2024-01-15'),
    ->      ('Cooking Oil', 'Grocery', 'Fortune', 'Delhi', 3500, 53, 4, '2025-12-25'),
    ->      ('Noodles', 'Grocery', 'Yeppy', 'Pune', 4300, 33, 3, '2025-10-15');
Query OK, 14 rows affected (0.02 sec)
Records: 14  Duplicates: 0  Warnings: 0




mysql> select * from products;
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          3 | Washing Machine     | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira              | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa                | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table        | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table      | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice        | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil         | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles             | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
14 rows in set (0.00 sec)




mysql> select * from products where  Price > 30000 and Rating >= 4 and City != 'Mumbai';
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category   | Brand | City | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
|          2 | AC           | Electronic | LG    | Pune | 65000.00 |    90 |    4.4 | 2021-09-28 |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
1 row in set (0.00 sec)




mysql> select * from products where Stock < 20 or Price > 75000 and Category <> 'Grocery';
Empty set (0.00 sec)




mysql> select * from products where Price between 15000 and 60000 and Rating between 3 and 5 and MFG_Date > '2022-12-31';
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
|          7 | Dressing Table | Furniture | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
1 row in set (0.00 sec)



mysql> select * from products where City in('Indore', 'Pune', 'Delhi') and Price > 20000 and Stock <> 0;
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category   | Brand | City | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
|          2 | AC           | Electronic | LG    | Pune | 65000.00 |    90 |    4.4 | 2021-09-28 |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
1 row in set (0.00 sec)




mysql> select * from products where City in('Indore', 'Pune', 'Delhi') and Price > 20000 and Stock != 0;
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category   | Brand | City | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
|          2 | AC           | Electronic | LG    | Pune | 65000.00 |    90 |    4.4 | 2021-09-28 |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
1 row in set (0.00 sec)




mysql> select * from products where  Category in('Electronic', 'Furniture');
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name    | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop          | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC              | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          3 | Washing Machine | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira          | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa            | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table    | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table  | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where  Category in('Electronic', 'Clothing', 'Grocery');
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          3 | Washing Machine     | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice        | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil         | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles             | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
10 rows in set (0.00 sec)





mysql> select * from products where  City not in('Indore', 'Bhopal');
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          4 | Almira              | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa                | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table        | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         13 | Cooking Oil         | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles             | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
11 rows in set (0.00 sec)




mysql> select * from products where Brand not in('LG', 'Samsung', 'Sony');
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          4 | Almira              | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa                | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table        | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table      | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice        | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil         | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles             | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
12 rows in set (0.00 sec)





mysql> select * from products where Price between 10000 and 50000;
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name    | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop          | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          3 | Washing Machine | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira          | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa            | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table    | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table  | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
6 rows in set (0.00 sec)





mysql> select * from products where Stock between 20 and 60;
+------------+----------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop         | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          4 | Almira         | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa           | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table   | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|         13 | Cooking Oil    | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+------------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where Rating between 3 and 5 and Price > 20000;
+------------+--------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop       | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC           | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          5 | Sofa         | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
+------------+--------------+------------+------------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)





mysql> select * from products where MFG_Date between '2023-01-01' and '2025-12-31' and Category in('Electronic', 'Furniture');
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa      | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)





mysql> select * from products Product_Name like 's%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'like 's%'' at line 1
mysql> select * from products where Product_Name like 's%';
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
|          5 | Sofa              | Furniture | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          9 | Slim Fit Trousers | Clothing  | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
2 rows in set (0.00 sec)





mysql> select * from products where Product_Name like '%phone%';
Empty set (0.00 sec)



mysql> select * from products where Brand like '%a';
+------------+---------------------+-----------+-------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category  | Brand | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+-----------+-------+--------+----------+-------+--------+------------+
|          4 | Almira              | Furniture | Usa   | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          8 | Printed Kurta       | Clothing  | biba  | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing  | biba  | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing  | Puma  | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing  | Puma  | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
+------------+---------------------+-----------+-------+--------+----------+-------+--------+------------+
5 rows in set (0.00 sec)

mysql> select * from products where City in('Indore', 'Pune') and Price between 20000 and 70000 and Rating >= 4;
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category   | Brand | City | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
|          2 | AC           | Electronic | LG    | Pune | 65000.00 |    90 |    4.4 | 2021-09-28 |
+------------+--------------+------------+-------+------+----------+-------+--------+------------+
1 row in set (0.00 sec)





mysql> select * from products where Category in('Electronic', 'Furniture') and Stock > 10 and Price < 60000 and MFG_Date > '2022-12-31';
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa      | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
3 rows in set (0.02 sec)





mysql> select * from products where Product_Name like '%a%' and Price not between 10000 and 50000 and stock > 5;
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice        | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
5 rows in set (0.00 sec)




mysql> select * from products where MFG_Date between '2022-01-01' and '2025-12-31' and Category in('Electronic', 'Clothing', 'Furniture') and Rating > 3 and City <> 'Mumbai';
+------------+-----------------+------------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name    | Category   | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-----------------+------------+----------+--------+----------+-------+--------+------------+
|          3 | Washing Machine | Electronic | Samsung  | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira          | Furniture  | Usa      | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table    | Furniture  | Nilkamal | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table  | Furniture  | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|         11 | Casual Hoodie   | Clothing   | Puma     | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
+------------+-----------------+------------+----------+--------+----------+-------+--------+------------+
5 rows in set (0.00 sec)




mysql> select * from products where Product_Name like 's%' or Product_Name like 'm%' and city not in('Indore', 'Mumbai') and Price between 15000 and 80000 and Rating >= 4 and MFG_Date > '2023-12-31';
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
|          5 | Sofa              | Furniture | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          9 | Slim Fit Trousers | Clothing  | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
2 rows in set (0.00 sec)