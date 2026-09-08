mysql> create table salses(sale_id INT primary key auto_increment, customer_name VARCHAR(50), city  VARCHAR(30), category VARCHAR(30), product VARCHAR(50), quantity INT, price DECIMAL(10,2), discount DECIMAL(10,2),  sale_date DATE, payment_method ENUM('UPI','Card','Cash','Net Banking'), status ENUM('Completed','Pending','Cancelled'), customer_type ENUM('New','Regular','Premium'));
Query OK, 0 rows affected (0.07 sec)

mysql> desc salses;
+----------------+-----------------------------------------+------+-----+---------+----------------+
| Field          | Type                                    | Null | Key | Default | Extra          |
+----------------+-----------------------------------------+------+-----+---------+----------------+
| sale_id        | int                                     | NO   | PRI | NULL    | auto_increment |
| customer_name  | varchar(50)                             | YES  |     | NULL    |                |
| city           | varchar(30)                             | YES  |     | NULL    |                |
| category       | varchar(30)                             | YES  |     | NULL    |                |
| product        | varchar(50)                             | YES  |     | NULL    |                |
| quantity       | int                                     | YES  |     | NULL    |                |
| price          | decimal(10,2)                           | YES  |     | NULL    |                |
| discount       | decimal(10,2)                           | YES  |     | NULL    |                |
| sale_date      | date                                    | YES  |     | NULL    |                |
| payment_method | enum('UPI','Card','Cash','Net Banking') | YES  |     | NULL    |                |
| status         | enum('Completed','Pending','Cancelled') | YES  |     | NULL    |                |
| customer_type  | enum('New','Regular','Premium')         | YES  |     | NULL    |                |
+----------------+-----------------------------------------+------+-----+---------+----------------+
12 rows in set (0.03 sec)
       insert into salses(customer_name, city, category, product, quantity, price, discount, sale_date, payment_method, status, customer_type)
    -> VALUES
    -> ('Rahul','Indore','Electronics','Laptop',2,60000,5000,'2026-01-05','Card','Completed','Premium'),
    -> ('Priya','Bhopal','Electronics','Mobile',3,25000,3000,'2026-01-07','UPI','Completed','Regular'),
    -> ('Amit','Indore','Clothing','Jeans',5,2000,500,'2026-01-10','Cash','Completed','New'),
    -> ('Sneha','Mumbai','Beauty','Cream',8,800,400,'2026-01-12','UPI','Completed','Premium'),
    -> ('Rohit','Pune','Electronics','Laptop',1,55000,4000,'2026-01-15','Card','Completed','Regular'),
    -> ('Neha','Delhi','Clothing','Kurti',6,1800,600,'2026-01-17','UPI','Completed','Premium'),
    -> ('Karan','Indore','Sports','Bat',4,3500,700,'2026-01-20','Cash','Completed','Regular'),
    -> ('Pooja','Bhopal','Beauty','Lipstick',10,600,300,'2026-01-22','UPI','Completed','New'),
    -> ('Vikas','Delhi','Books','SQL Book',7,900,200,'2026-01-25','Net Banking','Completed','Regular'),
    -> ('Anjali','Mumbai','Electronics','Watch',3,7000,800,'2026-01-27','Card','Completed','Premium'),
    -> ('Saurabh','Pune','Grocery','Rice',12,900,500,'2026-02-01','UPI','Completed','Regular'),
    -> ('Riya','Delhi','Electronics','AC',2,45000,5000,'2026-02-03','Card','Completed','Premium'),
    -> ('Manish','Indore','Clothing','Shirt',6,1500,300,'2026-02-05','UPI','Completed','New'),
    -> ('Komal','Bhopal','Furniture','Chair',3,8000,1000,'2026-02-07','Cash','Completed','Premium'),
    -> ('Deepak','Mumbai','Electronics','Speaker',5,3000,500,'2026-02-12','Card','Cancelled','Regular');
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from  salses;
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
| sale_id | customer_name | city   | category    | product  | quantity | price    | discount | sale_date  | payment_method | status    | customer_type |
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
|       1 | Rahul         | Indore | Electronics | Laptop   |        2 | 60000.00 |  5000.00 | 2026-01-05 | Card           | Completed | Premium       |
|       2 | Priya         | Bhopal | Electronics | Mobile   |        3 | 25000.00 |  3000.00 | 2026-01-07 | UPI            | Completed | Regular       |
|       3 | Amit          | Indore | Clothing    | Jeans    |        5 |  2000.00 |   500.00 | 2026-01-10 | Cash           | Completed | New           |
|       4 | Sneha         | Mumbai | Beauty      | Cream    |        8 |   800.00 |   400.00 | 2026-01-12 | UPI            | Completed | Premium       |
|       5 | Rohit         | Pune   | Electronics | Laptop   |        1 | 55000.00 |  4000.00 | 2026-01-15 | Card           | Completed | Regular       |
|       6 | Neha          | Delhi  | Clothing    | Kurti    |        6 |  1800.00 |   600.00 | 2026-01-17 | UPI            | Completed | Premium       |
|       7 | Karan         | Indore | Sports      | Bat      |        4 |  3500.00 |   700.00 | 2026-01-20 | Cash           | Completed | Regular       |
|       8 | Pooja         | Bhopal | Beauty      | Lipstick |       10 |   600.00 |   300.00 | 2026-01-22 | UPI            | Completed | New           |
|       9 | Vikas         | Delhi  | Books       | SQL Book |        7 |   900.00 |   200.00 | 2026-01-25 | Net Banking    | Completed | Regular       |
|      10 | Anjali        | Mumbai | Electronics | Watch    |        3 |  7000.00 |   800.00 | 2026-01-27 | Card           | Completed | Premium       |
|      11 | Saurabh       | Pune   | Grocery     | Rice     |       12 |   900.00 |   500.00 | 2026-02-01 | UPI            | Completed | Regular       |
|      12 | Riya          | Delhi  | Electronics | AC       |        2 | 45000.00 |  5000.00 | 2026-02-03 | Card           | Completed | Premium       |
|      13 | Manish        | Indore | Clothing    | Shirt    |        6 |  1500.00 |   300.00 | 2026-02-05 | UPI            | Completed | New           |
|      14 | Komal         | Bhopal | Furniture   | Chair    |        3 |  8000.00 |  1000.00 | 2026-02-07 | Cash           | Completed | Premium       |
|      15 | Deepak        | Mumbai | Electronics | Speaker  |        5 |  3000.00 |   500.00 | 2026-02-12 | Card           | Cancelled | Regular       |
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
15 rows in set (0.00 sec)




Questions===>


Find the total number of completed sales for each city where quantity is greater than 2. Display cities in descending order of sales count.


mysql> select city, count(*) from salses where status = 'completed' and quantity > 2 group by city order by count(*) desc;

--+--------+----------+
--| city   | count(*) |
--+--------+----------+
--| Bhopal |        3 |
--| Indore |        3 |
--| Mumbai |        2 |
--| Delhi  |        2 |
--| Pune   |        1 |
--+--------+----------+
--5 rows in set (0.00 sec)



Find the total quantity sold for each category where discount is greater than 300. Display highest quantity first.



mysql> select category, sum(quantity) as total from salses where discount > 300 group by category order by  sum(quantity) DESC;

--+-------------+-------+
--| category    | total |
--+-------------+-------+
--| Electronics |    16 |
--| Grocery     |    12 |
--| Clothing    |    11 |
--| Beauty      |     8 |
--| Sports      |     4 |
--| Furniture   |     3 |
--+-------------+-------+
--6 rows in set (0.00 sec)



Find the total sales amount for each city for completed sales only. Display highest-selling city first.


mysql> select city, sum(price) as total from salses where status = 'completed' group by city order by total DESC;


--+--------+----------+
--| city   | total    |
--+--------+----------+
--| Indore | 67000.00 |
--| Pune   | 55900.00 |
--| Delhi  | 47700.00 |
--| Bhopal | 33600.00 |
--| Mumbai |  7800.00 |
--+--------+----------+
--5 rows in set (0.00 sec)





Find the average product price for each category where quantity is at least 3. Display categories by average price descending.


mysql> select category, avg(price) as avg_price from salses where quantity >= 3 group by category order by avg_price desc;


--+-------------+--------------+
--| category    | avg_price    |
--+-------------+--------------+
--| Electronics | 11666.666667 |
--| Furniture   |  8000.000000 |
--| Sports      |  3500.000000 |
--| Clothing    |  1766.666667 |
--| Books       |   900.000000 |
--| Grocery     |   900.000000 |
--| Beauty      |   700.000000 |
--+-------------+--------------+
--7 rows in set (0.01 sec)




Find the number of sales for each customer type where the order amount (quantity * price) is greater than 5000. Sort by number of sales descending.


mysql> select customer_Type, count(*) from salses where  (quantity * price) > 5000 group by customer_Type order by count(*) DESC;


--+---------------+----------+
--| customer_Type | count(*) |
--+---------------+----------+
--| Premium       |        6 |
--| Regular       |        6 |
--| New           |        3 |
--+---------------+----------+
--3 rows in set (0.00 sec)



Find the total discount given for each city for UPI transactions. Display highest discount first.


mysql> select city, sum(discount) as total from salses  where payment_method = 'UPI' group by city order by   total DESC;

--+--------+---------+
--| city   | total   |
--+--------+---------+
--| Bhopal | 3300.00 |
--| Delhi  |  600.00 |
--| Pune   |  500.00 |
--| Mumbai |  400.00 |
--| Indore |  300.00 |
--+--------+---------+
--5 rows in set (0.00 sec)



Find the total quantity sold through each payment method for completed transactions. Sort by total quantity descending.


mysql> select payment_method, sum(quantity) as total from salses where status ='completed' group by payment_method order by total DESC;

--+----------------+-------+
--| payment_method | total |
--+----------------+-------+
--| UPI            |    45 |
--| Cash           |    12 |
--| Card           |     8 |
--| Net Banking    |     7 |
--+----------------+-------+
--4 rows in set (0.00 sec)




Find the average discount for each category where quantity is greater than 4. Display highest average discount first.


mysql> select category, avg(discount) as avg_dis from salses where quantity > 4 group by category  order by avg_dis DESC;


--+-------------+------------+
--| category    | avg_dis    |
--+-------------+------------+
--| Grocery     | 500.000000 |
--| Electronics | 500.000000 |
--| Clothing    | 466.666667 |
--| Beauty      | 350.000000 |
--| Books       | 200.000000 |
--+-------------+------------+
--5 rows in set (0.00 sec)



Find the maximum product price for each city where the status is Completed. Sort by maximum price descending.

mysql> select city, max(price) as max_price from salses where status = 'completed' group by city order by max_price DESC;

--+--------+-----------+
--| city   | max_price |
--+--------+-----------+
--| Indore |  60000.00 |
--| Pune   |  55000.00 |
--| Delhi  |  45000.00 |
--| Bhopal |  25000.00 |
--| Mumbai |   7000.00 |
--+--------+-----------+
--5 rows in set (0.03 sec)



Find the minimum product price for each category where discount is greater than 300. Sort by minimum price ascending.

mysql> select category, min(price) as min_price from salses where discount > 300 group by category order by min_price ASC;


--+-------------+-----------+
--| category    | min_price |
--+-------------+-----------+
--| Beauty      |    800.00 |
--| Grocery     |    900.00 |
--| Clothing    |   1800.00 |
--| Electronics |   3000.00 |
--| Sports      |   3500.00 |
--| Furniture   |   8000.00 |
--+-------------+-----------+
--6 rows in set (0.01 sec)




Find cities having more than 2 completed sales. Sort cities by completed sales count descending.

mysql> select city, count(*) from salses where status = 'completed' group by city having count(*) > 2 order by count(*) DESC;


--+--------+----------+
--| city   | count(*) |
--+--------+----------+
--| Indore |        4 |
--| Bhopal |        3 |
--| Delhi  |        3 |
--+--------+----------+
--3 rows in set (0.01 sec)



Find categories having total quantity greater than 10. Sort by total quantity descending.

mysql> select category, sum(quantity) as total_quantity from salses group by category having total_quantity > 10 order by total_quantity DESC;



--+-------------+----------------+
--| category    | total_quantity |
--+-------------+----------------+
--| Beauty      |             18 |
--| Clothing    |             17 |
--| Electronics |             16 |
--| Grocery     |             12 |
--+-------------+----------------+
--4 rows in set (0.00 sec)



Find cities having total sales greater than 50,000. Sort by total sales descending.

mysql> select city, sum(price) as total from salses group by city having total > 50000 order by total desc;



--+--------+----------+
--| city   | total    |
--+--------+----------+
--| Indore | 67000.00 |
--| Pune   | 55900.00 |
--+--------+----------+
--2 rows in set (0.00 sec)



Find customer types having average product price greater than 10,000. Sort by average price descending.

mysql> select customer_type, avg(price) as avg_price from salses  group by customer_type having avg_price > 10000 order by avg_price DESC;



--+---------------+--------------+
--| customer_type | avg_price    |
--+---------------+--------------+
--| Premium       | 20433.333333 |
--| Regular       | 14716.666667 |
--+---------------+--------------+
--2 rows in set (0.01 sec)



Find categories having average discount greater than 400. Sort by average discount descending.


mysql> select category, avg(discount) as avg_dis from salses group by category having avg_dis > 400 order by avg_dis desc;


--+-------------+-------------+
--| category    | avg_dis     |
--+-------------+-------------+
--| Electronics | 3050.000000 |
--| Furniture   | 1000.000000 |
--| Sports      |  700.000000 |
--| Grocery     |  500.000000 |
--| Clothing    |  466.666667 |
--+-------------+-------------+
--5 rows in set (0.00 sec)



Find payment methods having more than 2 completed transactions. Sort by transaction count descending.

mysql> select payment_method, count(*) from salses where status ='completed' group by payment_method having count(*) > 2 order by  count(*) DESC;


--+----------------+----------+
--| payment_method | count(*) |
--+----------------+----------+
--| UPI            |        6 |
--| Card           |        4 |
--| Cash           |        3 |
--+----------------+----------+
--3 rows in set (0.00 sec)



Find cities where the maximum product price is greater than 20,000. Sort by maximum price descending.


mysql> select city, max(price) from salses group by city having max(price) > 20000 order by max(price) DESC;

--+--------+------------+
--| city   | max(price) |
--+--------+------------+
--| Indore |   60000.00 |
--| Pune   |   55000.00 |
--| Delhi  |   45000.00 |
--| Bhopal |   25000.00 |
--+--------+------------+
--4 rows in set (0.01 sec)


Find categories where the minimum product price is less than 2,000. Sort by minimum price ascending.

mysql> select category, min(price) as min_price from salses group by category having min_price < 2000 order by min_price ASC;


--+----------+-----------+
--| category | min_price |
--+----------+-----------+
--| Beauty   |    600.00 |
--| Books    |    900.00 |
--| Grocery  |    900.00 |
--| Clothing |   1500.00 |
--+----------+-----------+
--4 rows in set (0.00 sec)



Find customer types where total discount is greater than 2,000. Sort by total discount descending.

mysql> select customer_type, sum(discount) as total_discount FROM salses group by customer_type having total_discount > 2000 order by total_discount DESC;

--+---------------+----------------+
--| customer_type | total_discount |
--+---------------+----------------+
--| Premium       |       12800.00 |
--| Regular       |        8900.00 |
--+---------------+----------------+
--2 rows in set (0.00 sec)



Find cities where average quantity per transaction is greater than 4. Sort by average quantity descending.

mysql> select city, avg(quantity) as avg_quan from salses group by city having avg_quan > 4 order by avg_quan DESC;


--+--------+----------+
--| city   | avg_quan |
--+--------+----------+
--| Pune   |   6.5000 |
--| Bhopal |   5.3333 |
--| Mumbai |   5.3333 |
--| Delhi  |   5.0000 |
--| Indore |   4.2500 |
--+--------+----------+
--5 rows in set (0.00 sec)



Find each city’s total sales for completed UPI transactions where quantity is greater than 2. Display only cities having total sales greater than 10,000.

mysql> select city, sum(price) as total from salses where status = 'completed' and quantity > 2 group by city having total > 10000;


--+--------+----------+
--| city   | total    |
--+--------+----------+
--| Bhopal | 33600.00 |
--+--------+----------+
--1 row in set (0.01 sec)



Find each category’s total quantity for completed transactions where discount is greater than 300. Display only categories having total quantity greater than 5.

mysql> select category, sum(quantity) as total from salses where status = 'completed' and discount > 300 group by category having total > 5;

--+-------------+-------+
--| category    | total |
--+-------------+-------+
--| Electronics |    11 |
--| Clothing    |    11 |
--| Beauty      |     8 |
--| Grocery     |    12 |
--+-------------+-------+
--4 rows in set (0.00 sec)


Find each customer type’s average price for completed transactions where quantity >= 2. Display only customer types whose average price exceeds 10,000.

mysql> select customer_type, avg(price) as avg_price from salses where status = 'completed' and quantity >= 2 group by customer_type having avg_price > 10000;

--+---------------+--------------+
--| customer_type | avg_price    |
--+---------------+--------------+
--| Premium       | 20433.333333 |
--+---------------+--------------+
--1 row in set (0.03 sec)



Find each city’s total discount for UPI transactions where quantity > 3. Display cities having total discount greater than 500.

mysql> select city, sum(discount) as total from salses where payment_method = 'UPI' and quantity > 3 group by city having total > 500;

--+-------+--------+
--| city  | total  |
--+-------+--------+
--| Delhi | 600.00 |
--+-------+--------+
--1 row in set (0.00 sec)



Find each category’s total sales where payment method is UPI or Card and status is Completed. Display categories having total sales greater than 10,000.

mysql> select category, sum(price) as total from salses where payment_method in('UPI', 'Cart') AND status = 'completed' group by category having total > 10000;

--+-------------+----------+
--| category    | total    |
--+-------------+----------+
--| Electronics | 25000.00 |
--+-------------+----------+
--1 row in set (0.01 sec)




Find each city’s transaction count for January 2026 completed transactions. Display cities having at least 2 transactions.


mysql> select city, count(*)  from salses where sale_date >= '2026-01-01' and sale_date < '2026-02-01' and status = 'completed' group by city having count(*) >= 2;

--+--------+----------+
--| city   | count(*) |
--+--------+----------+
--| Indore |        3 |
--| Bhopal |        2 |
--| Mumbai |        2 |
--| Delhi  |        2 |
--+--------+----------+
--4 rows in set (0.00 sec)



Find each category’s average sales amount where quantity >= 3 and status = Completed. Display categories whose average sales amount is greater than 5,000.

mysql> SELECT category,
    ->        AVG(quantity * price) AS avg_sales_amount
    -> FROM salses
    -> WHERE quantity >= 3
    ->   AND status = 'completed'
    -> GROUP BY category
    -> HAVING avg_sales_amount > 5000;


--+-------------+------------------+
--| category    | avg_sales_amount |
--+-------------+------------------+
--| Electronics |     48000.000000 |
--| Clothing    |      9933.333333 |
--| Beauty      |      6200.000000 |
--| Sports      |     14000.000000 |
--| Books       |      6300.000000 |
--| Grocery     |     10800.000000 |
--| Furniture   |     24000.000000 |
--+-------------+------------------+
--7 rows in set (0.00 sec)




Find each customer type’s maximum price where payment method is Card and status is Completed. Display only customer types whose maximum price exceeds 20,000.

mysql> SELECT customer_type,
    ->        MAX(price) AS max_price
    -> FROM salses
    -> WHERE payment_method = 'Card'
    ->   AND status = 'completed'
    -> GROUP BY customer_type
    -> HAVING max_price > 20000;


--+---------------+-----------+
--| customer_type | max_price |
--+---------------+-----------+
--| Premium       |  60000.00 |
--| Regular       |  55000.00 |
--+---------------+-----------+
--2 rows in set (0.00 sec)



Find each city’s total quantity for Electronics and Clothing products where status is Completed. Display cities having total quantity greater than 5.


mysql> select city, sum(quantity) as total from salses where category in('Electronics', 'Clothing') AND status = 'Completed' group by city having total > 5;

--+--------+-------+
--| city   | total |
--+--------+-------+
--| Indore |    13 |
--| Delhi  |     8 |
--+--------+-------+
--2 rows in set (0.00 sec)


Find each payment method’s total sales where status is Completed and discount is greater than 400. Display payment methods having total sales greater than 20,000.

mysql> select payment_method, sum(price) from salses where status = 'Completed' AND discount  > 400 group by payment_method having sum(price) > 20000;

--+----------------+------------+
--| payment_method | sum(price) |
--+----------------+------------+
--| Card           |  167000.00 |
--| UPI            |   27700.00 |
--+----------------+------------+
--2 rows in set (0.00 sec)



Find cities having more than 2 completed transactions and total sales greater than 50,000. Sort by total sales descending.

mysql> select city, count(*), sum(price) from salses WHERE status = 'completed' group by city  having count(*)> 2 and  sum(price) > 50000 order by sum(price) DESC;


--+--------+----------+------------+
--| city   | count(*) | sum(price) |
--+--------+----------+------------+
--| Indore |        4 |   67000.00 |
--+--------+----------+------------+
--1 row in set (0.00 sec)



Find categories having total quantity greater than 8 and average price greater than 2,000. Sort by total quantity descending.

mysql> select category, sum(quantity) as total, avg(price) as avg_price from salses group by category having total > 8 and avg_price > 2000  order by total DESC;

--+-------------+-------+--------------+
--| category    | total | avg_price    |
--+-------------+-------+--------------+
--| Electronics |    16 | 32500.000000 |
--+-------------+-------+--------------+
--1 row in set (0.00 sec)


Find customer types having more than 2 transactions and total discount greater than 2,000. Sort by total discount descending.

mysql> select  customer_type, count(*), sum(discount) as total from salses group by  customer_type having count(*)>2 and total > 2000 order by total DESC;


--+---------------+----------+----------+
--| customer_type | count(*) | total    |
--+---------------+----------+----------+
--| Premium       |        6 | 12800.00 |
--| Regular       |        6 |  8900.00 |
--+---------------+----------+----------+
--2 rows in set (0.00 sec)




Find cities having average quantity greater than 3 and maximum product price greater than 20,000. Sort by average quantity descending.

mysql> select city, avg(quantity) as avg_quan, max(price) as max_price from salses group by city having avg_quan > 3 and max_price > 20000 order by avg_quan DESC;

--+--------+----------+-----------+
--| city   | avg_quan | max_price |
--+--------+----------+-----------+
--| Pune   |   6.5000 |  55000.00 |
--| Bhopal |   5.3333 |  25000.00 |
--| Delhi  |   5.0000 |  45000.00 |
--| Indore |   4.2500 |  60000.00 |
--+--------+----------+-----------+
--4 rows in set (0.00 sec)


Find categories having more than 2 completed transactions and total sales greater than 20,000. Sort by total sales descending.

mysql> SELECT category, count(*), sum(price) as total from salses where status = 'completed' group by category having count(*) > 2 and total > 20000 order by total DESC;

--+-------------+----------+-----------+
--| category    | count(*) | total     |
--+-------------+----------+-----------+
--| Electronics |        5 | 192000.00 |
--+-------------+----------+-----------+
--1 row in set (0.00 sec)



Find payment methods having more than 2 completed transactions and average price greater than 10,000. Sort by average price descending.


mysql> select payment_method, count(*), avg(price) as avg_price from salses where status = 'completed' group by payment_method having count(*) > 2 and avg_price > 10000 order by avg_price DESC;

--+----------------+----------+--------------+
--| payment_method | count(*) | avg_price    |
--+----------------+----------+--------------+
--| Card           |        4 | 41750.000000 |
--+----------------+----------+--------------+
--1 row in set (0.00 sec)


Find cities having total quantity greater than 8 and average discount greater than 300. Sort by total quantity descending.


mysql> SELECT city, sum(quantity) as total_quan, avg(discount) as avg_dis from salses group by city having total_quan > 8 and avg_dis > 300 order by total_quan DESC;

--+--------+------------+-------------+
--| city   | total_quan | avg_dis     |
--+--------+------------+-------------+
--| Indore |         17 | 1625.000000 |
--| Bhopal |         16 | 1433.333333 |
--| Mumbai |         16 |  566.666667 |
--| Delhi  |         15 | 1933.333333 |
--| Pune   |         13 | 2250.000000 |
--+--------+------------+-------------+
--5 rows in set (0.00 sec)



Find customer types having average price greater than 5,000 and total quantity greater than 8. Sort by total quantity descending.

mysql> select customer_type, avg(price) as avg_price, sum(quantity) as total_quan from salses group by customer_type having avg_price > 5000 and total_quan > 8 order by total_quan DESC;


--+---------------+--------------+------------+
--| customer_type | avg_price    | total_quan |
--+---------------+--------------+------------+
--| Regular       | 14716.666667 |         32 |
--| Premium       | 20433.333333 |         24 |
--+---------------+--------------+------------+
--2 rows in set (0.00 sec)




Find categories having minimum price below 2,000 and maximum price above 20,000. Sort by maximum price descending.


mysql> SELECT category, min(price) as min_price, max(price) as max_price from salses group by category having min_price < 2000 and max_price > 20000 order by max_price DESC;

--Empty set (0.00 sec)



Find cities having total discount greater than 1,000 and total sales greater than 30,000. Sort by total sales descending.

mysql> SELECT city, sum(discount) as total_dis, sum(price) as total_sale from salses group by city having total_dis > 1000 and total_sale > 30000 order by total_sale DESC;


--+--------+-----------+------------+
--| city   | total_dis | total_sale |
--+--------+-----------+------------+
--| Indore |   6500.00 |   67000.00 |
--| Pune   |   4500.00 |   55900.00 |
--| Delhi  |   5800.00 |   47700.00 |
--| Bhopal |   4300.00 |   33600.00 |
--+--------+-----------+------------+
--4 rows in set (0.00 sec)



Find the top 3 cities based on total sales, considering only completed transactions with quantity greater than 1 and displaying only cities having more than 1 transaction.

mysql> select city, count(*), sum(price) as total from salses where status = 'completed' and quantity > 1 group by city having count(*) > 1 order by total DESC limit 3;


--+--------+----------+----------+
--| city   | count(*) | total    |
--+--------+----------+----------+
--| Indore |        4 | 67000.00 |
--| Delhi  |        3 | 47700.00 |
--| Bhopal |        3 | 33600.00 |
--+--------+----------+----------+
--3 rows in set (0.00 sec)


Find the top 3 categories based on total quantity where discount is greater than 300 and total quantity is greater than 5.

mysql> select category, sum(quantity) as total_quan from salses where discount > 300 group by category having total_quan > 5 order by total_quan DESC limit 3;


--+-------------+------------+
--| category    | total_quan |
--+-------------+------------+
--| Electronics |         16 |
--| Grocery     |         12 |
--| Clothing    |         11 |
--+-------------+------------+
--3 rows in set (0.00 sec)


Find the top 3 customer types based on average sales amount where status is Completed and transaction count is greater than 1.


mysql> select customer_type, count(*), avg(quantity * price) as avg_amt from salses where status = 'completed'  group by customer_type having count(*) > 1 order by avg_amt DESC limit 3;


--+---------------+----------+--------------+
--| customer_type | count(*) | avg_amt      |
--+---------------+----------+--------------+
--| Premium       |        6 | 45366.666667 |
--| Regular       |        5 | 32220.000000 |
--| New           |        3 |  8333.333333 |
--+---------------+----------+--------------+
--3 rows in set (0.00 sec)


Find the top 3 cities based on total discount for UPI transactions where status is Completed and total discount is greater than 500.


mysql> select city, sum(discount) as total_dis from salses where payment_method = 'UPI' and status = 'completed' group by city having total_dis > 500;

--+--------+-----------+
--| city   | total_dis |
--+--------+-----------+
--| Bhopal |   3300.00 |
--| Delhi  |    600.00 |
--+--------+-----------+
--2 rows in set (0.00 sec)




Find the top 3 categories based on total sales where quantity is greater than 2, average price is greater than 1,000, and total sales exceeds 10,000.

mysql> SELECT category,
    ->        SUM(price) AS total_sales,
    ->        AVG(price) AS avg_price
    -> FROM salses
    -> WHERE quantity > 2
    -> GROUP BY category
    -> HAVING avg_price > 1000
    ->    AND total_sales > 10000
    -> ORDER BY total_sales DESC
    -> LIMIT 3;
+-------------+-------------+--------------+
| category    | total_sales | avg_price    |
+-------------+-------------+--------------+
| Electronics |    35000.00 | 11666.666667 |
+-------------+-------------+--------------+
1 row in set (0.00 sec)

mysql>


Find the top 3 cities based on average order value where status is Completed, total quantity is greater than 5, and transaction count is greater than 1.

mmysql> select city, count(*) as total_tran, sum(quantity) as total_quan, avg(quantity * price) as avg_order from salses where status = 'completed' group by city having total_quan > 5 and total_tran > 1 order by avg_order DESC limit 3;


--+--------+------------+------------+--------------+
--| city   | total_tran | total_quan | avg_order    |
--+--------+------------+------------+--------------+
--| Indore |          4 |         17 | 38250.000000 |
--| Delhi  |          3 |         15 | 35700.000000 |
--| Bhopal |          3 |         16 | 35000.000000 |
--+--------+------------+------------+--------------+
--3 rows in set (0.00 sec)



Find the second-highest city based on total sales after considering only completed transactions and cities having at least 2 transactions.


mysql> SELECT CITY, count(*) as total_tran, SUM(price) as total_price from salses where status = 'completed' group by city having total_tran >= 2 order by total_price DESC limit 1 offset 1;

--+------+------------+-------------+
--| CITY | total_tran | total_price |
--+------+------------+-------------+
--| Pune |          2 |    55900.00 |
--+------+------------+-------------+
--1 row in set (0.02 sec)




Find the third-highest category based on total quantity where quantity is greater than 2 and total discount exceeds 500.

mysql> select category,  sum(quantity) as total_quan, sum(discount) as total_dis from salses where quantity > 2 group by category having total_dis > 500 order by total_quan DESC limit 1 offset 2;


--+-------------+------------+-----------+
--| category    | total_quan | total_dis |
--+-------------+------------+-----------+
--| Electronics |         11 |   4300.00 |
--+-------------+------------+-----------+
--1 row in set (0.00 sec)


mysql> select category, sum(quantity) as total_quan, sum(discount) as total_dis from salses group by category having total_quan > 2 and total_dis > 500  order by total_quan DESC limit 1 offset 2;

--+-------------+------------+-----------+
--| category    | total_quan | total_dis |
--+-------------+------------+-----------+
--| Electronics |         16 |  18300.00 |
--+-------------+------------+-----------+
--1 row in set (0.00 sec)





Find the 2nd and 3rd highest customer types based on total sales where status is Completed and average price is greater than 5,000.

mysql> select customer_type, sum(price) as price, avg(price) as avg_price from salses where status = 'completed' group by customer_type having avg_price > 5000 order by price DESC limit 2 offset 1;


--+---------------+----------+--------------+
--| customer_type | price    | avg_price    |
--+---------------+----------+--------------+
--| Regular       | 85300.00 | 17060.000000 |
--+---------------+----------+--------------+
--1 row in set (0.00 sec)


Find the top 3 cities where:


--status is Completed


--payment method is UPI or Card


--quantity is greater than 1


--number of transactions is greater than 1


--total quantity is greater than 5


--total sales is greater than 20,000


mysql> select city, count(*), sum(quantity) as total_quan, sum(price) as total from salses where status = 'Completed' AND payment_method IN('UPI', 'card') AND quantity > 1 group by city having count(*) > 1 AND total_quan > 5 AND  total > 20000 order by total_quan DESC limit 3;

--+--------+----------+------------+----------+
--| city   | count(*) | total_quan | total    |
--+--------+----------+------------+----------+
--| Bhopal |        2 |         13 | 25600.00 |
--| Indore |        2 |          8 | 61500.00 |
--| Delhi  |        2 |          8 | 46800.00 |
--+--------+----------+------------+----------+
--3 rows in set (0.00 sec)