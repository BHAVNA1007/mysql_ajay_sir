Create another table:

employee_documents

Initially create document_id as a normal integer column.

Then use ALTER TABLE to make document_id an AUTO_INCREMENT column.

CREATE TABLE AS SELECT

Create:

employee_backup

using the existing employees table.

Copy the employee data into it.

TRUNCATE

Create:

employee_test

Insert some records.

Then:

Display the records.
TRUNCATE the table.
Display the records again.
Verify that the table still exists.
DROP

Finally:

Drop employee_test.
Drop employee_documents.
Verify the tables using SHOW TABLES.
Part 6 — Verification

Execute:

SHOW DATABASES;
SHOW TABLES;
DESC employees;
SHOW CREATE TABLE employees;

Then verify that your employees table contains all the required data types.
***********************************************************************





mysql> create table employee_documents(document_id int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee_documents;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| document_id | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
1 row in set (0.00 sec)



mysql> alter table employee_documents modify column document_id int AUTO_INCREMENT primary key;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> create table employee_backup as select * from employee_documents;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> insert into employee_backup select * from employee_documents;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> select * from employee_backup;
Empty set (0.00 sec)


mysql> insert into employee_documents values();
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_documents values();
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_documents values();
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_documents;
+-------------+
| document_id |
+-------------+
|           1 |
|           2 |
|           3 |
+-------------+
3 rows in set (0.00 sec)

mysql> select * from employee_backup;
Empty set (0.00 sec)

mysql> insert into employee_backup select * from employee_documents;
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_backup;
+-------------+
| document_id |
+-------------+
|           1 |
|           2 |
|           3 |
+-------------+
3 rows in set (0.00 sec)

mysql> truncate table employee_documents;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from employee_backup;
+-------------+
| document_id |
+-------------+
|           1 |
|           2 |
|           3 |
+-------------+
3 rows in set (0.00 sec)

mysql> select * from employee_documents;
Empty set (0.00 sec)

mysql> create table employee_test(id tinyint, name varchar(10), joing year, dateofbirth datetime);
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee_test;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | tinyint     | YES  |     | NULL    |       |
| name        | varchar(10) | YES  |     | NULL    |       |
| joing       | year        | YES  |     | NULL    |       |
| dateofbirth | datetime    | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into employee_test values(101, 'nitu', 2020, '2000-08-19 02:33:45'),
    -> (102, 'shinu', 1998, '2001-07-01 03:55:26'),
    -> (103, 'tinu', 2001, '2002-08-02 04:44:46');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_test;
+------+-------+-------+---------------------+
| id   | name  | joing | dateofbirth         |
+------+-------+-------+---------------------+
|  101 | nitu  |  2020 | 2000-08-19 02:33:45 |
|  102 | shinu |  1998 | 2001-07-01 03:55:26 |
|  103 | tinu  |  2001 | 2002-08-02 04:44:46 |
+------+-------+-------+---------------------+
3 rows in set (0.00 sec)

mysql> truncate table employee_test;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from employee_test;
Empty set (0.00 sec)

mysql> drop table employee_test;
Query OK, 0 rows affected (0.03 sec)

mysql> drop table employee_documents;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+-------------------------------+
| Tables_in_employee_management |
+-------------------------------+
| employee_backup               |
| employees                     |
+-------------------------------+
2 rows in set (0.00 sec)

mysql> drop table employee_backup;
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW DATABASES;
+---------------------+
| Database            |
+---------------------+
| batch18             |
| class               |
| college             |
| company_db          |
| dbms1               |
| delta_app           |
| employee_management |
| foodstore           |
| info                |
| information_schema  |
| mysql               |
| performance_schema  |
| practice            |
| sakila              |
| school_db           |
| shop_db             |
| startersql          |
| sys                 |
| world               |
+---------------------+
19 rows in set (0.02 sec)

mysql> use employee_management;
Database changed
mysql> show tables;
+-------------------------------+
| Tables_in_employee_management |
+-------------------------------+
| employees                     |
+-------------------------------+
1 row in set (0.00 sec)





mysql> desc employees;
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| Field                | Type                                            | Null | Key | Default           | Extra                                         |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
| employee_id          | int                                             | NO   |     | NULL              |                                               |
| employee_code        | char(8)                                         | YES  |     | NULL              |                                               |
| employee_name        | varchar(60)                                     | YES  |     | NULL              |                                               |
| age                  | tinyint unsigned                                | YES  |     | NULL              |                                               |
| number_of_children   | smallint unsigned                               | YES  |     | NULL              |                                               |
| experience_months    | smallint unsigned                               | YES  |     | NULL              |                                               |
| salary               | decimal(10,2)                                   | YES  |     | NULL              |                                               |
| performance_score    | float                                           | YES  |     | NULL              |                                               |
| productivity_score   | double                                          | YES  |     | NULL              |                                               |
| department_id        | char(5)                                         | YES  |     | NULL              |                                               |
| employee_status      | enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') | YES  |     | NULL              |                                               |
| Skills               | set('JAVA','PYTHON','MYSQL','REACT','AWS')      | YES  |     | NULL              |                                               |
| gender               | enum('male','female')                           | YES  |     | NULL              |                                               |
| date_of_birth        | date                                            | YES  |     | NULL              |                                               |
| joining_date         | date                                            | YES  |     | NULL              |                                               |
| login_time           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| interview_datetime   | datetime                                        | YES  |     | NULL              |                                               |
| birth_year           | year                                            | YES  |     | NULL              |                                               |
| is_active            | tinyint(1)                                      | YES  |     | NULL              |                                               |
| employee_note        | tinytext                                        | YES  |     | NULL              |                                               |
| employee_description | text                                            | YES  |     | NULL              |                                               |
| training_history     | mediumtext                                      | YES  |     | NULL              |                                               |
| employee_profile     | longtext                                        | YES  |     | NULL              |                                               |
| created_at           | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| update_at            | timestamp                                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+----------------------+-------------------------------------------------+------+-----+-------------------+-----------------------------------------------+
25 rows in set (0.01 sec)

mysql> SHOW CREATE TABLE employees;
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| employees | CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `employee_code` char(8) DEFAULT NULL,
  `employee_name` varchar(60) DEFAULT NULL,
  `age` tinyint unsigned DEFAULT NULL,
  `number_of_children` smallint unsigned DEFAULT NULL,
  `experience_months` smallint unsigned DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `performance_score` float DEFAULT NULL,
  `productivity_score` double DEFAULT NULL,
  `department_id` char(5) DEFAULT NULL,
  `employee_status` enum('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED') DEFAULT NULL,
  `Skills` set('JAVA','PYTHON','MYSQL','REACT','AWS') DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `interview_datetime` datetime DEFAULT NULL,
  `birth_year` year DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `employee_note` tinytext,
  `employee_description` text,
  `training_history` mediumtext,
  `employee_profile` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql>