=========================================================
ASSIGNMENT 3: PRODUCT INVENTORY MANAGEMENT SYSTEM
=========================================================

SCENARIO
--------
A retail shop wants to manage product details, prices,
categories, and available stock using Python PDBC.

CONCEPTS TO PRACTICE
--------------------
1. INSERT
2. SELECT
3. UPDATE
4. DELETE
5. LIKE operator
6. Parameterized queries
7. commit()
8. fetchall()
9. Menu-driven programming


TABLE STRUCTURE
===============

Table Name: product_pdbc

Column       Data Type
--------------------------------
pid          INT PRIMARY KEY
pname        VARCHAR(60)
category     VARCHAR(40)
price        DECIMAL(10,2)
quantity     INT


SAMPLE DATA
===========

pid   pname       category       price       quantity
------------------------------------------------------------
(301, 'Laptop', 'Electronics',55000,10),
(302, 'Mouse', 'Electronics',800,50),
(303, 'Keyboard', 'Electronics',1500,30),
(304, 'Notebook', 'Stationery',100,100),
(305, 'Pen', 'Stationery',20,200);


MENU
====

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit

Enter your choice:


TASK 1: ADD PRODUCT
===================

INPUT
-----
Enter your choice: 1
Enter Product ID: 306
Enter Product Name: Monitor
Enter Category: Electronics
Enter Price: 12000
Enter Quantity: 15

OUTPUT
------
Product inserted successfully.


TASK 2: DISPLAY ALL PRODUCTS
============================

INPUT
-----
Enter your choice: 2

OUTPUT
------
ID    Product       Category       Price       Quantity
------------------------------------------------------------
301   Laptop        Electronics     55000.00    10
302   Mouse         Electronics       800.00    50
303   Keyboard      Electronics      1500.00    30
304   Notebook      Stationery        100.00   100
305   Pen           Stationery         20.00   200
306   Monitor       Electronics     12000.00    15


TASK 3: SEARCH PRODUCT BY NAME USING LIKE
=========================================

INPUT
-----
Enter your choice: 3
Enter product name to search: o

OUTPUT
------
Matching products:

ID    Product       Category       Price       Quantity
------------------------------------------------------------
301   Laptop        Electronics     55000.00    10
302   Mouse         Electronics       800.00    50
304   Notebook      Stationery        100.00   100
306   Monitor       Electronics     12000.00    15

NOTE
----
Use:
WHERE pname LIKE %s

Pass:
'%' + search_name + '%'


TASK 4: UPDATE PRODUCT PRICE
============================

INPUT
-----
Enter your choice: 4
Enter Product ID: 302
Enter New Price: 900

OUTPUT
------
Product price updated successfully.


TASK 5: DELETE PRODUCT
======================

INPUT
-----
Enter your choice: 5
Enter Product ID: 305

OUTPUT
------
Product deleted successfully.


TASK 6: EXIT
============

INPUT
-----
Enter your choice: 6

OUTPUT
------
Thank you for using Product Inventory System.


add these scenarios also:--

1. Display all products from Electronics category.
2. Display all products from Stationery category.
3. Search products whose names contain 'oo'.
4. Search products whose names start with 'M'.
5. Search products whose names end with 'e'.
6. Display products whose price is greater than 1000.
7. Display products whose quantity is less than 20.
8. Update product quantity.
9. Update product category.
10. Delete a product by ID.
11. Display products whose category contains 'tron'.
12. Search products by a user-provided price range.



SUGGESTED SUCCESS MESSAGES
==========================

INSERT:
Record inserted successfully.

SELECT:
Records displayed successfully.

UPDATE:
Record updated successfully.

DELETE:
Record deleted successfully.

NOT FOUND:
No record found for the given ID.

INVALID CHOICE:
Invalid choice. Please try again.

EXIT:
Thank you for using the system.




mysql> create table product_pdbc (pid INT PRIMARY KEY, pname VARCHAR(60), category VARCHAR(40), price DECIMAL(10,2), quantity  INT);
Query OK, 0 rows affected (0.03 sec)

mysql> desc product_pdbc;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| pid      | int           | NO   | PRI | NULL    |       |
| pname    | varchar(60)   | YES  |     | NULL    |       |
| category | varchar(40)   | YES  |     | NULL    |       |
| price    | decimal(10,2) | YES  |     | NULL    |       |
| quantity | int           | YES  |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into product_pdbc values
    -> (301, 'Laptop', 'Electronics',55000,10),
    -> (302, 'Mouse', 'Electronics',800,50),
    -> (303, 'Keyboard', 'Electronics',1500,30),
    -> (304, 'Notebook', 'Stationery',100,100),
    -> (305, 'Pen', 'Stationery',20,200);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from product_pdbc;
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   800.00 |       50 |
| 303 | Keyboard | Electronics |  1500.00 |       30 |
| 304 | Notebook | Stationery  |   100.00 |      100 |
| 305 | Pen      | Stationery  |    20.00 |      200 |
+-----+----------+-------------+----------+----------+
5 rows in set (0.00 sec)





PS D:\InfoBeans\MySQL_Ajay_sir\sql_assignments\014_pdbc> py 03.py      
Import done
connected to database successfully

***********MENU************

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit
ENTER CHOICE:  1
1. Add  Product
ENTER  Product ID : 306
ENTER  Product NAME : Monitor
ENTER  category: Electronics
ENTER Price : 12000
ENTER quantity : 15
data inserted

***********MENU************

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit
ENTER CHOICE:  2
2. Display All products
------------------------------------
pid  pname  category  price  quantity
------------------------------------
301    Laptop    Electronics    55000.00    10
302    Mouse    Electronics    800.00    50
303    Keyboard    Electronics    1500.00    30
304    Notebook    Stationery    100.00    100
305    Pen    Stationery    20.00    200
306    Monitor    Electronics    12000.00    15





ENTER CHOICE:  3
3. Search Product by Name
enter Product name: o
------------------------------------
pid  pname  category  price  quantity
------------------------------------
301    Laptop    Electronics    55000.00    10
302    Mouse    Electronics    800.00    50
303    Keyboard    Electronics    1500.00    30
304    Notebook    Stationery    100.00    100
306    Monitor    Electronics    12000.00    15

***********MENU************

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit
ENTER CHOICE:  4
4. Update Product price
ENTER P_ID: 302
ENTER NEW PRICE: 900
Product price updated successfully.






mysql> select * from product_pdbc;
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   900.00 |       50 |
| 303 | Keyboard | Electronics |  1500.00 |       30 |
| 304 | Notebook | Stationery  |   100.00 |      100 |
| 305 | Pen      | Stationery  |    20.00 |      200 |
| 306 | Monitor  | Electronics | 12000.00 |       15 |
+-----+----------+-------------+----------+----------+
6 rows in set (0.00 sec)

***********MENU************
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit

ENTER CHOICE:  5
5. Delete product
ENTER P_ID: 305
Product deleted successfully.



mysql> select * from product_pdbc;
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   900.00 |       50 |
| 303 | Keyboard | Electronics |  1500.00 |       30 |
| 304 | Notebook | Stationery  |   100.00 |      100 |
| 306 | Monitor  | Electronics | 12000.00 |       15 |
+-----+----------+-------------+----------+----------+
5 rows in set (0.00 sec)



***********MENU************

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit

ENTER CHOICE:  6
Thank you for using Product Inventory System.
Connection closed successfully.


ENTER CHOICE:  7
7. Display all products from Electronics category.
Enter category:  Electronics
all products from Electronics category.
------------------------------------
pid    pname    category    price    quantity
------------------------------------
301    Laptop   Electronics   55000.00    10
302    Mouse   Electronics   900.00    50
303    Keyboard   Electronics   1500.00    30
306    Monitor   Electronics   12000.00    15
Connection closed successfully.


mysql> select * from product_pdbc where category = 'Electronics';
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   900.00 |       50 |
| 303 | Keyboard | Electronics |  1500.00 |       30 |
| 306 | Monitor  | Electronics | 12000.00 |       15 |
+-----+----------+-------------+----------+----------+
4 rows in set (0.00 sec)




ENTER CHOICE:  8
8. Display all products from Stationery category.
Enter category:  Stationery
all products from Electronics category.
------------------------------------
pid    pname    category    price    quantity
------------------------------------
304    Notebook   Stationery   100.00    100
Connection closed successfully.




ENTER CHOICE:  9
Search products whose names contain 'oo'.
Enter name like:  oo
all products pname like 'oo'.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

304    Notebook   Stationery   100.00    100

Connection closed successfully.



ENTER CHOICE:  10
Search products whose names start with 'M'.
Enter name like:  m
all products pname like 'm'.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

302    Mouse   Electronics   900.00    50


306    Monitor   Electronics   12000.00    15


***********MENU************

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit
ENTER CHOICE:  11
Search products whose names end with 'e'.
Enter name like:  e
all products pname like 'e'.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

302    Mouse   Electronics   900.00    50

Connection closed successfully.




ENTER CHOICE:  12  
Display products whose price is greater than 1000.
Enter price:  1000
all products where price is greater then 1000.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

301    Laptop   Electronics   55000.00    10


303    Keyboard   Electronics   1500.00    30


306    Monitor   Electronics   12000.00    15

Connection closed successfully.




ENTER CHOICE:  13
Display products whose quantity is less than 20.
Enter quantity:  20
------------------------------------
pid    pname    category    price    quantity
------------------------------------

301    Laptop   Electronics   55000.00    10


306    Monitor   Electronics   12000.00    15

Connection closed successfully.






ENTER CHOICE:  14
14 Update product quantity.
ENTER P_ID: 306
ENTER NEW quantity: 50
Product quantity updated successfully.




mysql> select * from product_pdbc;
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   900.00 |       50 |
| 303 | Keyboard | Electronics |  1500.00 |       30 |
| 304 | Notebook | Stationery  |   100.00 |      100 |
| 306 | Monitor  | Electronics | 12000.00 |       50 |
+-----+----------+-------------+----------+----------+
5 rows in set (0.01 sec)

***********MENU************


===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit
ENTER CHOICE:  15
15 Update product category.
ENTER P_ID: 303        
ENTER NEW category: electronics
Product category updated successfully.
Connection closed successfully.


mysql> select * from product_pdbc;
+-----+----------+-------------+----------+----------+
| pid | pname    | category    | price    | quantity |
+-----+----------+-------------+----------+----------+
| 301 | Laptop   | Electronics | 55000.00 |       10 |
| 302 | Mouse    | Electronics |   900.00 |       50 |
| 303 | Keyboard | electronics |  1500.00 |       30 |
| 304 | Notebook | Stationery  |   100.00 |      100 |
| 306 | Monitor  | Electronics | 12000.00 |       50 |
+-----+----------+-------------+----------+----------+
5 rows in set (0.00 sec)



ENTER CHOICE:  16
16. Delete a product by ID
ENTER P_ID: 303
Product deleted successfully.



ENTER CHOICE:  17
Display products whose category contains 'tron'..
Enter category like:  tron
all products category like 'tron'.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

301    Laptop   Electronics   55000.00    10


302    Mouse   Electronics   900.00    50


306    Monitor   Electronics   12000.00    50




ENTER CHOICE:  18
Display products where prise between 100 and 2000.
all products where price between 100 and 2000.
------------------------------------
pid    pname    category    price    quantity
------------------------------------

302    Mouse   Electronics   900.00    50


304    Notebook   Stationery   100.00    100
