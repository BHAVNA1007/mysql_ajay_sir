

mysql> select * from transaction_records;
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| transaction_id | customer_name | amount_str | discount_pct | tx_date_text | created_timestamp   | status_code |
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| TXN-1001       | Rahul Sharma  | 15400.50   |         5.50 | 15/01/2025   | 2025-01-15 10:30:00 | 1           |
| TXN-1002       | Priya Verma   | 8200.00    |         0.00 | 22/01/2025   | 2025-01-22 14:15:30 | 1           |
| TXN-1003       | Amit Patel    | 12050.75   |        10.00 | 05/02/2025   | 2025-02-05 09:45:12 | 0           |
| TXN-1004       | Neha Singh    | 4500.25    |         NULL | 18/02/2025   | 2025-02-18 16:20:00 | 1           |
| TXN-1005       | Rohit Jain    | 23000.00   |        12.50 | 01/03/2025   | 2025-03-01 11:10:05 | 0           |
| TXN-1006       | Sneha Gupta   | 999.90     |         2.00 | 12/03/2025   | 2025-03-12 18:00:00 | 1           |
| TXN-1007       | Vikas Yadav   | 17500.80   |         7.25 | 25/03/2025   | 2025-03-25 08:05:40 | 1           |
| TXN-1008       | Anjali Mehta  | 3100.00    |         NULL | 04/04/2025   | 2025-04-04 12:50:22 | 0           |
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
8 rows in set (0.00 sec)




QUESTIONS

Explicit Numeric & String Conversions

Q1.
The finance team needs the transaction amounts as signed integer values (rounded/truncated as integer) for a high-level summary report.
Convert amount_str into a SIGNED integer using CAST().


mysql> select CAST(amount_str as SIGNED) as integer_amt FROM  transaction_records;
+-------------+
| integer_amt |
+-------------+
|       15400 |
|        8200 |
|       12050 |
|        4500 |
|       23000 |
|         999 |
|       17500 |
|        3100 |
+-------------+
8 rows in set, 8 warnings (0.00 sec)





Q2.
The compliance system requires the string amount amount_str to be explicitly converted into a DECIMAL(10,2) numerical value using CONVERT().


mysql> select CONVERT(amount_str, DECIMAL(10,2)) AS decimal_amt from transaction_records;
+-------------+
| decimal_amt |
+-------------+
|    15400.50 |
|     8200.00 |
|    12050.75 |
|     4500.25 |
|    23000.00 |
|      999.90 |
|    17500.80 |
|     3100.00 |
+-------------+
8 rows in set (0.00 sec)




Q3.
To generate a plain text invoice log, display transaction_id, customer_name, and discount_pct joined together as a single string column formatted like:
TXN-1001 : Rahul Sharma : 5.50
Ensure the numeric discount_pct column is safely converted to character data using CAST(... AS CHAR).


mysql> SELECT CONCAT_WS(
    ->     ' : ',
    ->     CAST(transaction_id AS CHAR),
    ->     CAST(customer_name AS CHAR),
    ->     CAST(discount_pct AS CHAR)
    -> ) AS invoice_log
    -> FROM transaction_records;
+--------------------------------+
| invoice_log                    |
+--------------------------------+
| TXN-1001 : Rahul Sharma : 5.50 |
| TXN-1002 : Priya Verma : 0.00  |
| TXN-1003 : Amit Patel : 10.00  |
| TXN-1004 : Neha Singh          |
| TXN-1005 : Rohit Jain : 12.50  |
| TXN-1006 : Sneha Gupta : 2.00  |
| TXN-1007 : Vikas Yadav : 7.25  |
| TXN-1008 : Anjali Mehta        |
+--------------------------------+
8 rows in set (0.00 sec)







Date & Time Type Conversions

Q4.
The tx_date_text column stores dates as string text in the format DD/MM/YYYY (e.g., '15/01/2025').
Use STR_TO_DATE() to convert this text column into a valid MySQL DATE type.



mysql> select STR_TO_DATE(tx_date_text, '%d/%m/%Y') as date from  transaction_records;
+------------+
| date       |
+------------+
| 2025-01-15 |
| 2025-01-22 |
| 2025-02-05 |
| 2025-02-18 |
| 2025-03-01 |
| 2025-03-12 |
| 2025-03-25 |
| 2025-04-04 |
+------------+
8 rows in set (0.00 sec)





Q5.
Extract and display only the date portion (YYYY-MM-DD) from created_timestamp by explicitly casting created_timestamp as a DATE type.

mysql> select CAST(created_timestamp as date) as date from transaction_records;
+------------+
| date       |
+------------+
| 2025-01-15 |
| 2025-01-22 |
| 2025-02-05 |
| 2025-02-18 |
| 2025-03-01 |
| 2025-03-12 |
| 2025-03-25 |
| 2025-04-04 |
+------------+
8 rows in set (0.00 sec)






Q6.
Format the created_timestamp column into a readable text date string in the format "15th January 2025" using date-to-string formatting functions.


mysql> select DATE_FORMAT(created_timestamp, '%eth %M %Y') as readable from transaction_records;
+--------------------+
| readable           |
+--------------------+
| 15th January 2025  |
| 22th January 2025  |
| 5th February 2025  |
| 18th February 2025 |
| 1th March 2025     |
| 12th March 2025    |
| 25th March 2025    |
| 4th April 2025     |
+--------------------+
8 rows in set (0.00 sec)







Q7.
Convert the tx_date_text column into a standard DATE format, and then display the day of the week (e.g., 'Wednesday', 'Thursday') on which each transaction occurred.

mysql> SELECT DAYNAME(STR_TO_DATE(tx_date_text, '%d/%m/%Y')) AS day
    -> FROM transaction_records;
+-----------+
| day       |
+-----------+
| Wednesday |
| Wednesday |
| Wednesday |
| Tuesday   |
| Saturday  |
| Wednesday |
| Tuesday   |
| Friday    |
+-----------+
8 rows in set (0.00 sec)







Q8.
Extract the numerical sequence from transaction_id (e.g., extract '1001' from 'TXN-1001') and explicitly convert it into an UNSIGNED integer.


mysql> SELECT CAST(SUBSTRING_INDEX(transaction_id, '-', -1) AS UNSIGNED) AS transaction_number
    -> FROM transaction_records;
+--------------------+
| transaction_number |
+--------------------+
|               1001 |
|               1002 |
|               1003 |
|               1004 |
|               1005 |
|               1006 |
|               1007 |
|               1008 |
+--------------------+
8 rows in set (0.00 sec)






Q9.
The column status_code stores active status as string '1' and inactive status as '0'.
Write a query using CASE or IF that evaluates status_code and displays 'Active' for '1' and 'Inactive' for '0'.


mysql> select status_code, IF(status_code = 1, 'Active', 'Inactive') as sts_code from transaction_records;
+-------------+----------+
| status_code | sts_code |
+-------------+----------+
| 1           | Active   |
| 1           | Active   |
| 0           | Inactive |
| 1           | Active   |
| 0           | Inactive |
| 1           | Active   |
| 1           | Active   |
| 0           | Inactive |
+-------------+----------+
8 rows in set (0.00 sec)






Q10.
Calculate the net transaction amount after applying discount_pct.
Since amount_str is stored as a string, perform the necessary explicit type conversion to calculate:
Net Amount = Amount - (Amount * Discount / 100)
Treat NULL discount values as 0%.




mysql> select CAST(amount_str as decimal(10,2)) - (CAST(amount_str as decimal(10,2)) * COALESCE(discount_pct,0) / 100) AS net_amount from transaction_records;
+----------------+
| net_amount     |
+----------------+
| 14553.47250000 |
|  8200.00000000 |
| 10845.67500000 |
|  4500.25000000 |
| 20125.00000000 |
|   979.90200000 |
| 16231.99200000 |
|  3100.00000000 |
+----------------+
8 rows in set (0.02 sec)