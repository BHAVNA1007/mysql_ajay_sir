mysql> create table employee_string(emp_id INT  PRIMARY KEY AUTO_INCREMENT,  emp_name VARCHAR(50) NOT NULL, email VARCHAR(100) NOT NULL, department VARCHAR(30) NOT NULL, designation   VARCHAR(50)     NOT NULL, city  VARCHAR(30)         NOT NULL, phone VARCHAR(15)     NOT NULL);
Query OK, 0 rows affected (0.06 sec)

mysql> desc employee_string;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| emp_id      | int          | NO   | PRI | NULL    | auto_increment |
| emp_name    | varchar(50)  | NO   |     | NULL    |                |
| email       | varchar(100) | NO   |     | NULL    |                |
| department  | varchar(30)  | NO   |     | NULL    |                |
| designation | varchar(50)  | NO   |     | NULL    |                |
| city        | varchar(30)  | NO   |     | NULL    |                |
| phone       | varchar(15)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.01 sec)

mysql> insert into employee_string(emp_name, email, department, designation, city, phone) values
    -> ('  Rahul Sharma  ', 'rahul.sharma@gmail.com', 'it', 'software developer', 'Indore', '9876543210'),
    -> ('Priya Verma', 'priya.verma@yahoo.com', 'hr', 'hr executive', 'Bhopal', '9876501234'),
    -> ('  Amit Patel', 'amit.patel@gmail.com', 'finance', 'account executive', 'Indore', '9123456780'),
    -> ('Neha Singh  ', 'neha.singh@company.com', 'marketing', 'marketing manager', 'Mumbai', '9988776655'),
    -> ('Rohit Jain', 'rohit.jain@gmail.com', 'it', 'team leader', 'Pune', '9090909090'),
    -> ('  Sneha Gupta ', 'sneha.gupta@yahoo.com', 'sales', 'sales executive', 'Delhi', '9012345678'),
    -> ('Vikas Yadav', 'vikas.yadav@gmail.com', 'finance', 'senior accountant', 'Jaipur', '9345678901'),
    -> ('Anjali Mehta', 'anjali.mehta@company.com', 'hr', 'hr manager', 'Indore', '9765432109'),
    -> ('  Karan Joshi  ', 'karan.joshi@gmail.com', 'it', 'database administrator', 'Bhopal', '8899776655'),
    -> ('Meena Kapoor', 'meena.kapoor@yahoo.com', 'sales', 'sales manager', 'Mumbai', '9001122334');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from employee_string;
+--------+------------------+--------------------------+------------+------------------------+--------+------------+
| emp_id | emp_name         | email                    | department | designation            | city   | phone      |
+--------+------------------+--------------------------+------------+------------------------+--------+------------+
|      1 |   Rahul Sharma   | rahul.sharma@gmail.com   | it         | software developer     | Indore | 9876543210 |
|      2 | Priya Verma      | priya.verma@yahoo.com    | hr         | hr executive           | Bhopal | 9876501234 |
|      3 |   Amit Patel     | amit.patel@gmail.com     | finance    | account executive      | Indore | 9123456780 |
|      4 | Neha Singh       | neha.singh@company.com   | marketing  | marketing manager      | Mumbai | 9988776655 |
|      5 | Rohit Jain       | rohit.jain@gmail.com     | it         | team leader            | Pune   | 9090909090 |
|      6 |   Sneha Gupta    | sneha.gupta@yahoo.com    | sales      | sales executive        | Delhi  | 9012345678 |
|      7 | Vikas Yadav      | vikas.yadav@gmail.com    | finance    | senior accountant      | Jaipur | 9345678901 |
|      8 | Anjali Mehta     | anjali.mehta@company.com | hr         | hr manager             | Indore | 9765432109 |
|      9 |   Karan Joshi    | karan.joshi@gmail.com    | it         | database administrator | Bhopal | 8899776655 |
|     10 | Meena Kapoor     | meena.kapoor@yahoo.com   | sales      | sales manager          | Mumbai | 9001122334 |
+--------+------------------+--------------------------+------------+------------------------+--------+------------+
10 rows in set (0.00 sec)







Q1.

The HR department wants to display all employee names in capital letters for an official employee report.

mysql> select emp_name, trim(upper(emp_name)) as name from employee_string;
+------------------+--------------+
| emp_name         | name         |
+------------------+--------------+
|   Rahul Sharma   | RAHUL SHARMA |
| Priya Verma      | PRIYA VERMA  |
|   Amit Patel     | AMIT PATEL   |
| Neha Singh       | NEHA SINGH   |
| Rohit Jain       | ROHIT JAIN   |
|   Sneha Gupta    | SNEHA GUPTA  |
| Vikas Yadav      | VIKAS YADAV  |
| Anjali Mehta     | ANJALI MEHTA |
|   Karan Joshi    | KARAN JOSHI  |
| Meena Kapoor     | MEENA KAPOOR |
+------------------+--------------+
10 rows in set (0.00 sec)







Q2.

The company wants all department names to be displayed in small letters for standardization.


mysql> select department, lower(department) as lower_case from employee_string;
+------------+------------+
| department | lower_case |
+------------+------------+
| it         | it         |
| hr         | hr         |
| finance    | finance    |
| marketing  | marketing  |
| it         | it         |
| sales      | sales      |
| finance    | finance    |
| hr         | hr         |
| it         | it         |
| sales      | sales      |
+------------+------------+
10 rows in set (0.00 sec)






Q3.

HR wants to know the length of each employees name.

Display the employee name along with its length.

mysql> select trim(emp_name), length(emp_name) from employee_string;
+----------------+------------------+
| trim(emp_name) | length(emp_name) |
+----------------+------------------+
| Rahul Sharma   |               16 |
| Priya Verma    |               11 |
| Amit Patel     |               12 |
| Neha Singh     |               12 |
| Rohit Jain     |               10 |
| Sneha Gupta    |               14 |
| Vikas Yadav    |               11 |
| Anjali Mehta   |               12 |
| Karan Joshi    |               15 |
| Meena Kapoor   |               12 |
+----------------+------------------+
10 rows in set (0.00 sec)








Q4.

The HR report should display employee names in the following format:

Employee: Rahul Sharma
Employee: Priya Verma

Create this output for every employee.





mysql> select concat('Employee:', trim(emp_name)) as use_concat from employee_string;
+-----------------------+
| use_concat            |
+-----------------------+
| Employee:Rahul Sharma |
| Employee:Priya Verma  |
| Employee:Amit Patel   |
| Employee:Neha Singh   |
| Employee:Rohit Jain   |
| Employee:Sneha Gupta  |
| Employee:Vikas Yadav  |
| Employee:Anjali Mehta |
| Employee:Karan Joshi  |
| Employee:Meena Kapoor |
+-----------------------+
10 rows in set (0.00 sec)





Q5.

HR wants to display only the first 5 characters of each employees name.

mysql> select trim(emp_name), left(trim(emp_name), 5) from employee_string;
+----------------+-------------------------+
| trim(emp_name) | left(trim(emp_name), 5) |
+----------------+-------------------------+
| Rahul Sharma   | Rahul                   |
| Priya Verma    | Priya                   |
| Amit Patel     | Amit                    |
| Neha Singh     | Neha                    |
| Rohit Jain     | Rohit                   |
| Sneha Gupta    | Sneha                   |
| Vikas Yadav    | Vikas                   |
| Anjali Mehta   | Anjal                   |
| Karan Joshi    | Karan                   |
| Meena Kapoor   | Meena                   |
+----------------+-------------------------+
10 rows in set (0.00 sec)







Q6.

Some employee names contain unnecessary spaces before or after the name.

Display all employee names after removing the unwanted spaces.

mysql> select trim(emp_name) as proper_name from employee_string;
+--------------+
| proper_name  |
+--------------+
| Rahul Sharma |
| Priya Verma  |
| Amit Patel   |
| Neha Singh   |
| Rohit Jain   |
| Sneha Gupta  |
| Vikas Yadav  |
| Anjali Mehta |
| Karan Joshi  |
| Meena Kapoor |
+--------------+
10 rows in set (0.00 sec)







Q7.

The company wants to replace the Gmail domain with the companys domain in the displayed email addresses.

For example:

rahul.sharma@gmail.com

should be displayed as:

rahul.sharma@company.com

Do not modify the original table data.




mysql> select  replace(email, 'gmail','company') as replaced_email from employee_string;
+--------------------------+
| replaced_email           |
+--------------------------+
| rahul.sharma@company.com |
| priya.verma@yahoo.com    |
| amit.patel@company.com   |
| neha.singh@company.com   |
| rohit.jain@company.com   |
| sneha.gupta@yahoo.com    |
| vikas.yadav@company.com  |
| anjali.mehta@company.com |
| karan.joshi@company.com  |
| meena.kapoor@yahoo.com   |
+--------------------------+
10 rows in set (0.00 sec)





Q8.

HR wants to create a temporary employee code using the first 3 characters of the employees name.

Display the employee name along with the generated code.


mysql> select trim(emp_name), left(trim(emp_name), 3) as emp_code from employee_string;
+----------------+----------+
| trim(emp_name) | emp_code |
+----------------+----------+
| Rahul Sharma   | Rah      |
| Priya Verma    | Pri      |
| Amit Patel     | Ami      |
| Neha Singh     | Neh      |
| Rohit Jain     | Roh      |
| Sneha Gupta    | Sne      |
| Vikas Yadav    | Vik      |
| Anjali Mehta   | Anj      |
| Karan Joshi    | Kar      |
| Meena Kapoor   | Mee      |
+----------------+----------+
10 rows in set (0.00 sec)






Q9.

For privacy purposes, the company wants to display only the last 4 digits of each employees phone number.


mysql> select phone, right(phone, 4) as phone_digit from employee_string;
+------------+-------------+
| phone      | phone_digit |
+------------+-------------+
| 9876543210 | 3210        |
| 9876501234 | 1234        |
| 9123456780 | 6780        |
| 9988776655 | 6655        |
| 9090909090 | 9090        |
| 9012345678 | 5678        |
| 9345678901 | 8901        |
| 9765432109 | 2109        |
| 8899776655 | 6655        |
| 9001122334 | 2334        |
+------------+-------------+
10 rows in set (0.00 sec)









Q10.

The HR department wants to display the employees location in the following format:

Indore-IT
Bhopal-HR
Mumbai-Marketing

Combine the city and department using - between them.


mysql> select concat_ws('-', city, upper(department)) as city_dep from employee_string;
+------------------+
| city_dep         |
+------------------+
| Indore-IT        |
| Bhopal-HR        |
| Indore-FINANCE   |
| Mumbai-MARKETING |
| Pune-IT          |
| Delhi-SALES      |
| Jaipur-FINANCE   |
| Indore-HR        |
| Bhopal-IT        |
| Mumbai-SALES     |
+------------------+
10 rows in set (0.00 sec)





Q11.

For a testing purpose, the IT department wants to display every employees name in reverse order.

mysql> select reverse(trim(emp_name)) as rev_name from employee_string;
+--------------+
| rev_name     |
+--------------+
| amrahS luhaR |
| amreV ayirP  |
| letaP timA   |
| hgniS aheN   |
| niaJ tihoR   |
| atpuG ahenS  |
| vadaY sakiV  |
| atheM ilajnA |
| ihsoJ naraK  |
| roopaK aneeM |
+--------------+
10 rows in set (0.00 sec)





Q12.

The IT department wants to find the position of the @ symbol in every employees email address.

mysql> select locate("@", email) as location from employee_string;
+----------+
| location |
+----------+
|       13 |
|       12 |
|       11 |
|       11 |
|       11 |
|       12 |
|       12 |
|       13 |
|       12 |
|       13 |
+----------+
10 rows in set (0.00 sec)
Display the email address along with the position.








Combined Questions
Q13.

HR wants to create an official employee report in the following format:

RAHUL SHARMA - SOFTWARE DEVELOPER

Both the employee name and designation should appear in capital letters.


mysql> select concat_ws(' - ', trim(upper(emp_name)), upper(designation)) as combine_name from employee_string;
+--------------------------------------+
| combine_name                         |
+--------------------------------------+
| RAHUL SHARMA - SOFTWARE DEVELOPER    |
| PRIYA VERMA - HR EXECUTIVE           |
| AMIT PATEL - ACCOUNT EXECUTIVE       |
| NEHA SINGH - MARKETING MANAGER       |
| ROHIT JAIN - TEAM LEADER             |
| SNEHA GUPTA - SALES EXECUTIVE        |
| VIKAS YADAV - SENIOR ACCOUNTANT      |
| ANJALI MEHTA - HR MANAGER            |
| KARAN JOSHI - DATABASE ADMINISTRATOR |
| MEENA KAPOOR - SALES MANAGER         |
+--------------------------------------+
10 rows in set (0.00 sec)






Q14.

Before generating the final report, HR wants to remove unwanted spaces from employee names and then display the cleaned names in capital letters.



mysql> select  upper(trim(emp_name)) as name from employee_string;
+--------------+
| name         |
+--------------+
| RAHUL SHARMA |
| PRIYA VERMA  |
| AMIT PATEL   |
| NEHA SINGH   |
| ROHIT JAIN   |
| SNEHA GUPTA  |
| VIKAS YADAV  |
| ANJALI MEHTA |
| KARAN JOSHI  |
| MEENA KAPOOR |
+--------------+
10 rows in set (0.00 sec)






Q15.

The company wants a final employee summary in the following format:

RAHUL SHARMA | SOFTWARE DEVELOPER | INDORE | 3210

The report should contain:

Employee name without unwanted spaces and in capital letters
Designation in capital letters
City in capital letters
Last 4 digits of phone number
| as separator between all values

Condition: Do not modify the original table data. Use only SELECT queries for all questions.


mysql> select concat_ws(' | ', upper(trim(emp_name)), upper(designation), upper(city), right(phone, 4)) from employee_string;
+-------------------------------------------------------------------------------------------+
| concat_ws(' | ', upper(trim(emp_name)), upper(designation), upper(city), right(phone, 4)) |
+-------------------------------------------------------------------------------------------+
| RAHUL SHARMA | SOFTWARE DEVELOPER | INDORE | 3210                                         |
| PRIYA VERMA | HR EXECUTIVE | BHOPAL | 1234                                                |
| AMIT PATEL | ACCOUNT EXECUTIVE | INDORE | 6780                                            |
| NEHA SINGH | MARKETING MANAGER | MUMBAI | 6655                                            |
| ROHIT JAIN | TEAM LEADER | PUNE | 9090                                                    |
| SNEHA GUPTA | SALES EXECUTIVE | DELHI | 5678                                              |
| VIKAS YADAV | SENIOR ACCOUNTANT | JAIPUR | 8901                                           |
| ANJALI MEHTA | HR MANAGER | INDORE | 2109                                                 |
| KARAN JOSHI | DATABASE ADMINISTRATOR | BHOPAL | 6655                                      |
| MEENA KAPOOR | SALES MANAGER | MUMBAI | 2334                                              |
+-------------------------------------------------------------------------------------------+
10 rows in set (0.00 sec)