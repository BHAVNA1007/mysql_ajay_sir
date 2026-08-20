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



mysql> select * from products where mfg_date > '2024-01-01';
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil    | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
5 rows in set (0.00 sec)




mysql> select * from products where mfg_date < '2023-01-01';
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          3 | Washing Machine     | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          5 | Sofa                | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where mfg_date between '2022-01-01' and '2024-12-31';
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
|          3 | Washing Machine   | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira            | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa              | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table      | Furniture  | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          8 | Printed Kurta     | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         11 | Casual Hoodie     | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice      | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
8 rows in set (0.00 sec)




mysql> select * from products where mfg_date > '2023-01-01' and price > 20000;
Empty set (0.00 sec)




mysql> select * from products where mfg_date between '2023-01-01' and '2025-12-31' and rating >= 4;
+------------+--------------+----------+------------+--------+---------+-------+--------+------------+
| Product_ID | Product_Name | Category | Brand      | City   | Price   | Stock | Rating | MFG_Date   |
+------------+--------------+----------+------------+--------+---------+-------+--------+------------+
|         12 | Basmati Rice | Grocery  | India Gate | Indore | 3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil  | Grocery  | Fortune    | Delhi  | 3500.00 |    53 |    4.0 | 2025-12-25 |
+------------+--------------+----------+------------+--------+---------+-------+--------+------------+
2 rows in set (0.00 sec)




mysql> select * from products where mfg_date > '2023-01-01' and stock > 10;
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta  | Clothing  | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil    | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where mfg_date < '2024-01-01' or price > 80000;
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name        | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
|          1 | laptop              | Electronic | HP         | Mumbai | 50000.00 |    50 |    4.9 | 2021-03-18 |
|          2 | AC                  | Electronic | LG         | Pune   | 65000.00 |    90 |    4.4 | 2021-09-28 |
|          3 | Washing Machine     | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          4 | Almira              | Furniture  | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa                | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          8 | Printed Kurta       | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers   | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         10 | Casual Denim Jacket | Clothing   | Puma       | Mumbai |  1000.00 |    77 |    4.5 | 2021-07-09 |
|         11 | Casual Hoodie       | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
+------------+---------------------+------------+------------+--------+----------+-------+--------+------------+
9 rows in set (0.00 sec)





mysql> select * from products where mfg_date between '2023-01-01' and '2025-12-31' and stock <> 0;
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta  | Clothing  | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil    | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where mfg_date between '2023-01-01' and '2025-12-31' and stock != 0;
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta  | Clothing  | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil    | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where mfg_date > '2022-01-01' and price between 15000 and 60000 and rating >= 3;
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name    | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
|          3 | Washing Machine | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          5 | Sofa            | Furniture  | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          7 | Dressing Table  | Furniture  | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+-----------------+------------+------------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)




mysql> select * from products where mfg_date < '2024-01-01' and rating < 3 or stock = 0;
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
| Product_ID | Product_Name      | Category | Brand | City  | Price   | Stock | Rating | MFG_Date   |
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
|          8 | Printed Kurta     | Clothing | biba  | Delhi | 2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers | Clothing | biba  | Delhi | 2500.00 |    99 |    2.5 | 2022-02-28 |
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
2 rows in set (0.00 sec)




mysql> select * from products where mfg_date < '2024-01-01' and rating < 3 or stock = '0';
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
| Product_ID | Product_Name      | Category | Brand | City  | Price   | Stock | Rating | MFG_Date   |
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
|          8 | Printed Kurta     | Clothing | biba  | Delhi | 2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers | Clothing | biba  | Delhi | 2500.00 |    99 |    2.5 | 2022-02-28 |
+------------+-------------------+----------+-------+-------+---------+-------+--------+------------+
2 rows in set (0.00 sec)




mysql> select * from products where Category in('Electronic', 'Furniture') and mfg_date > '2023-01-01';
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa      | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)




mysql> select * from products where category in('Electronic', 'Clothing', 'Grocery') and mfg_date between '2022-01-01' and '2025-12-31';
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category   | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
|          3 | Washing Machine   | Electronic | Samsung    | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
|          8 | Printed Kurta     | Clothing   | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers | Clothing   | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         11 | Casual Hoodie     | Clothing   | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice      | Grocery    | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil       | Grocery    | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles           | Grocery    | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+-------------------+------------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where city in('Indore', 'Pune', 'Delhi') and mfg_date > '2023-06-01';
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta  | Clothing  | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil    | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles        | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
7 rows in set (0.00 sec)




mysql> select * from products where city not in('Indore','Bhopal') and mfg_date > '2023-01-01';
+------------+---------------+-----------+----------+-------+----------+-------+--------+------------+
| Product_ID | Product_Name  | Category  | Brand    | City  | Price    | Stock | Rating | MFG_Date   |
+------------+---------------+-----------+----------+-------+----------+-------+--------+------------+
|          4 | Almira        | Furniture | Usa      | Pune  | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table  | Furniture | Nilkamal | Delhi | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          8 | Printed Kurta | Clothing  | biba     | Delhi |  2000.00 |    95 |    2.9 | 2023-12-21 |
|         13 | Cooking Oil   | Grocery   | Fortune  | Delhi |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles       | Grocery   | Yeppy    | Pune  |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+---------------+-----------+----------+-------+----------+-------+--------+------------+
5 rows in set (0.00 sec)




mysql> select * from products where brand not in('samsung', 'LG', 'Sony') and mfg_date > '2022-01-01';
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
|          4 | Almira            | Furniture | Usa        | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          5 | Sofa              | Furniture | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          6 | Dining Table      | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table    | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|          8 | Printed Kurta     | Clothing  | biba       | Delhi  |  2000.00 |    95 |    2.9 | 2023-12-21 |
|          9 | Slim Fit Trousers | Clothing  | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
|         11 | Casual Hoodie     | Clothing  | Puma       | Pune   |  1200.00 |    74 |    4.3 | 2022-07-09 |
|         12 | Basmati Rice      | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
|         13 | Cooking Oil       | Grocery   | Fortune    | Delhi  |  3500.00 |    53 |    4.0 | 2025-12-25 |
|         14 | Noodles           | Grocery   | Yeppy      | Pune   |  4300.00 |    33 |    3.0 | 2025-10-15 |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
10 rows in set (0.00 sec)




mysql> select * from products where product_name like 's%' and mfg_date > '2023-01-01';
Empty set (0.00 sec)



mysql> select * from products where product_name like '%phone%' and mfg_date between '2022-01-01' and '2025-12-31';
Empty set (0.00 sec)



mysql> select * from products where product_name like '%a%' and mfg_date > '2024-01-01';
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
|          6 | Dining Table   | Furniture | Nilkamal   | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal   | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
|         12 | Basmati Rice   | Grocery   | India Gate | Indore |  3000.00 |   100 |    4.2 | 2024-01-15 |
+------------+----------------+-----------+------------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)




mysql> select * from products where brand like 's%' and mfg_date > '2022-01-01';
+------------+-----------------+------------+---------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name    | Category   | Brand   | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-----------------+------------+---------+--------+----------+-------+--------+------------+
|          3 | Washing Machine | Electronic | Samsung | Indore | 15000.00 |    65 |    3.4 | 2022-04-23 |
+------------+-----------------+------------+---------+--------+----------+-------+--------+------------+
1 row in set (0.00 sec)



mysql> select * from products where brand like '%a' and mfg_date between '2023-01-01' and '2026-12-31';
+------------+---------------+-----------+-------+-------+----------+-------+--------+------------+
| Product_ID | Product_Name  | Category  | Brand | City  | Price    | Stock | Rating | MFG_Date   |
+------------+---------------+-----------+-------+-------+----------+-------+--------+------------+
|          4 | Almira        | Furniture | Usa   | Pune  | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          8 | Printed Kurta | Clothing  | biba  | Delhi |  2000.00 |    95 |    2.9 | 2023-12-21 |
+------------+---------------+-----------+-------+-------+----------+-------+--------+------------+
2 rows in set (0.00 sec)




mysql> select * from products where city in('Indore', 'Pune', 'Delhi') and mfg_date > '2023-01-01' and price between 20000 and 70000 and rating >= 4 and stock <> 0;
Empty set (0.00 sec)



mysql> select * from products where city in('Indore', 'Pune', 'Delhi') and mfg_date > '2023-01-01' and price between 20000 and 70000 and rating >= 4 and stock != 0;
Empty set (0.00 sec)




mysql> select * from products where category in('electronic', 'furniture') and mfg_date > '2022-12-31' and price < 60000 and stock > 10 and rating >= 3;
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name   | Category  | Brand    | City   | Price    | Stock | Rating | MFG_Date   |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
|          4 | Almira         | Furniture | Usa      | Pune   | 10000.00 |    55 |    3.9 | 2023-09-27 |
|          6 | Dining Table   | Furniture | Nilkamal | Delhi  | 10000.00 |    40 |    3.8 | 2024-11-27 |
|          7 | Dressing Table | Furniture | Nilkamal | Indore | 20000.00 |    25 |    3.1 | 2025-10-11 |
+------------+----------------+-----------+----------+--------+----------+-------+--------+------------+
3 rows in set (0.00 sec)



mysql> select * from products where mfg_date between '2022-01-01' and '2025-12-31' and category in('electronic', 'clothing', 'furniture') and rating > 3 and city <> 'Mumbai';
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




mysql> select * from products where mfg_date > '2023-01-01' and product_name like '%a%' and price not between 10000 and 50000 and stock > 5;
+------------+---------------+----------+------------+--------+---------+-------+--------+------------+
| Product_ID | Product_Name  | Category | Brand      | City   | Price   | Stock | Rating | MFG_Date   |
+------------+---------------+----------+------------+--------+---------+-------+--------+------------+
|          8 | Printed Kurta | Clothing | biba       | Delhi  | 2000.00 |    95 |    2.9 | 2023-12-21 |
|         12 | Basmati Rice  | Grocery  | India Gate | Indore | 3000.00 |   100 |    4.2 | 2024-01-15 |
+------------+---------------+----------+------------+--------+---------+-------+--------+------------+
2 rows in set (0.00 sec)




mysql> select * from products where mfg_date between '2023-01-01' and '2025-12-31' and brand not in('samsung', 'LG', 'Sony') and price > 25000 and rating >= 4 and stock <> 0;
Empty set (0.00 sec)




mysql> select * from products where mfg_date between '2023-01-01' and '2025-12-31' and brand not in('samsung', 'LG', 'Sony') and price > 25000 and rating >= 4 and stock != 0;
Empty set (0.00 sec)




mysql> select * from products where category in('electronic', 'furniture') and mfg_date > '2023-01-01' and price > 40000 or rating = 5 and stock > 10;
+------------+--------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+--------------+-----------+------------+--------+----------+-------+--------+------------+
|          5 | Sofa         | Furniture | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
+------------+--------------+-----------+------------+--------+----------+-------+--------+------------+
1 row in set (0.00 sec)




mysql> select * from products where city in('Indore', 'Pune', 'Delhi') and mfg_date between '2023-01-01' and '2025-12-31' and price between 15000 and 80000 and rating >= 4 and stock > 0 and category <> 'Grocery';
Empty set (0.00 sec)




mysql> select * from products where product_name like 's%' and product_name like 'm%' and city not in('Mumbai', 'Bhopal') and price between 15000 and 80000 and rating >= 4 and mfg_date > '2023-01-01';
Empty set (0.00 sec)




mysql> select * from products where mfg_date between '2022-01-01' and '2025-12-31' and category in('electronic', 'furniture', 'clothing') and price not between 10000 and 50000 and stock > 5 and rating > 3 and city not in('mumbai', "bhopal");
+------------+---------------+----------+-------+------+---------+-------+--------+------------+
| Product_ID | Product_Name  | Category | Brand | City | Price   | Stock | Rating | MFG_Date   |
+------------+---------------+----------+-------+------+---------+-------+--------+------------+
|         11 | Casual Hoodie | Clothing | Puma  | Pune | 1200.00 |    74 |    4.3 | 2022-07-09 |
+------------+---------------+----------+-------+------+---------+-------+--------+------------+
1 row in set (0.00 sec)




mysql> select * from products where product_name like 's%' or product_name like '%phone%' and category  in('electronic', 'furniture') and mfg_date between '2023-01-01' and '2026-12-31' and price between 20000 and 90000 and rating >= 4 and stock > 0 and city in('Indore', 'Pune', 'Delhi') and brand not in('samsung', 'LG', 'Sony');
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
| Product_ID | Product_Name      | Category  | Brand      | City   | Price    | Stock | Rating | MFG_Date   |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
|          5 | Sofa              | Furniture | WoodStreet | Mumbai | 30000.00 |    45 |    5.0 | 2022-10-17 |
|          9 | Slim Fit Trousers | Clothing  | biba       | Delhi  |  2500.00 |    99 |    2.5 | 2022-02-28 |
+------------+-------------------+-----------+------------+--------+----------+-------+--------+------------+
2 rows in set (0.00 sec)
