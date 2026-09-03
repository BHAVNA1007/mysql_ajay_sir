contraints are primarily used for data integrity


Domain:
not null : it specified that column must contain a value.


mysql> create table employeee(id int, name varchar(20) not null, salary decimal(10,2));
Query OK, 0 rows affected (0.06 sec)

mysql> desc employeee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | YES  |     | NULL    |       |
| name   | varchar(20)   | NO   |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into employeee values(101, 'deepika', 899999);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employeee(id, salary) values(102, 899999);
ERROR 1364 (HY000): Field 'name' doesn't have a default value



mysql> insert into employeee(id,name, salary) values(102,'null', 899999);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeee;
+------+---------+-----------+
| id   | name    | salary    |
+------+---------+-----------+
|  101 | deepika | 899999.00 |
|  102 | null    | 899999.00 |
+------+---------+-----------+
2 rows in set (0.00 sec)

mysql> insert into employeee(id,name, salary) values(102,NULL, 899999);

ERROR 1048 (23000): Column 'name' cannot be null

mysql> insert into employeee(id,name, salary) values(102,'', 899999);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeee;
+------+---------+-----------+
| id   | name    | salary    |
+------+---------+-----------+
|  101 | deepika | 899999.00 |
|  102 | null    | 899999.00 |
|  102 |         | 899999.00 |
+------+---------+-----------+
3 rows in set (0.00 sec)



NOTE: null does not mean 0 or '' or 'null. 

NULL means unkown value or missing value or not available value. 

mobile = null

means we do not have the moble number. 


The not null constrint is also applied during updation

mysql> update employeee set name = NULL where id = 101;
ERROR 1048 (23000): Column 'name' cannot be null



Unique constraint:

the unique constraint ensure that a column can not contain duplicate values.

mysql> create table employeee1(id int, email varchar(20) unique);
Query OK, 0 rows affected (0.04 sec)

mysql> desc employeee1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| email | varchar(20) | YES  | UNI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)



mysql> insert into  employeee1 values(101, 'dipu@gmail.com');
Query OK, 1 row affected (0.01 sec)


mysql> insert into  employeee1 values(102, 'dipu@gmail.com');
ERROR 1062 (23000): Duplicate entry 'dipu@gmail.com' for key 'employeee1.email'


unique constraints on multiple columns :

mysql> create table employeee2(id int, deptid int, employeecode varchar(20),  constraint uk_dept unique(deptid, employeecode));
Query OK, 0 rows affected (0.06 sec)

mysql> desc employeee2;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| id           | int         | YES  |     | NULL    |       |
| deptid       | int         | YES  | MUL | NULL    |       |
| employeecode | varchar(20) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> insert into  employeee2 values(101, 991, 5555);
ERROR 1062 (23000): Duplicate entry '991-5555' for key 'employeee2.uk_dept'


from the above example it is clear that the combinations should be unique. 

***************************************************************

unique vs not null

unique prevents duplicate values 
BUT 
not null prevents missing values

mysql> create table employeee3(id int, email varchar(20) unique);
Query OK, 0 rows affected (0.05 sec)

mysql> insert into  employeee3(id) values(101);
Query OK, 1 row affected (0.01 sec)

mysql> insert into  employeee3(id) values(102);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeee3;
+------+-------+
| id   | email |
+------+-------+
|  101 | NULL  |
|  102 | NULL  |
+------+-------+
2 rows in set (0.00 sec) 

from the above example it is clear that email can not be duplicated 

BUT

NULL handling is deffrent from ordinary value. 

if an application requires every employee to have an email and that should be unique.



mysql> create table employeee4(id int, email varchar(20) not null unique);
Query OK, 0 rows affected (0.03 sec)

mysql> desc employeee4;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| email | varchar(20) | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)


mysql> insert into  employeee4(id) values(101);
ERROR 1364 (HY000): Field 'email' doesnt have a default value



pk vs unique

pk : uniquely identify row values:

u: it prevents duplicates

pk : it can not contain null

u : can contain null

pk: only one pk per table is allowed

u : multiple unique key are allowed

pk: it is used as main row identifire

u: it is used for ulternate candidate key


mysql> create table employeee5(id int primary key, email varchar(20) unique, mobile varchar(20) unique);
Query OK, 0 rows affected (0.06 sec)

mysql> desc employeee5;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| email  | varchar(20) | YES  | UNI | NULL    |       |
| mobile | varchar(20) | YES  | UNI | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table employeee6(id int primary key, email varchar(20) primary key, mobile varchar(20) unique);

ERROR 1068 (42000): Multiple primary key defined



pk and unique + not null: only one diff

pk can be only one but  unique + not null can be multiple.


check constraint: a check constraint is a domain constraint used to restrict the values that can be inserted into or updated in a column based on specified condition. 

in simple words check constraints insures that the data stored in a column satisfies a perticular condition. 

create table table_name (column_name datatype check(condition))



mysql> create table employeee7(id int ,name varchar(20) ,age int check(age>18));
Query OK, 0 rows affected (0.03 sec)


mysql> desc employeee7;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> insert into employeee7 values(101, 'deepika', 17);
ERROR 3819 (HY000): Check constraint 'employeee7_chk_1' is violated.


mysql> insert into employeee7 values(101, 'deepika', 27);
Query OK, 1 row affected (0.02 sec)


mysql> select * from employeee7;
+------+---------+------+
| id   | name    | age  |
+------+---------+------+
|  101 | deepika |   27 |
+------+---------+------+
1 row in set (0.00 sec)


mysql> create table employeee8(id int ,name varchar(20), dno int check(dno in(10, 20, 30)));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into employeee8 values(101, 'deepika', 40);
ERROR 3819 (HY000): Check constraint 'employeee8_chk_1' is violated.


mysql> create table employeee9(id int ,name varchar(20), dno int check(dno in(10, 20, 30)) not null);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into employeee9(id, name) values(103, 'katappa');
ERROR 1364 (HY000): Field 'dno' doesnt have a default value




check constrints with multiple conditions:

a check constrain can contain multiple conditions using operators.

mysql> create table employeee10(id int ,name varchar(20), age int, salary decimal(10,2), check(age>=18 and salary >= 10000));
Query OK, 0 rows affected (0.03 sec)


mysql> insert into employeee10  values(101, 'deepika', 19,9000);
ERROR 3819 (HY000): Check constraint 'employeee10_chk_1' is violated.

mysql> insert into employeee10  values(101, 'deepika', 17, 19000);
ERROR 3819 (HY000): Check constraint 'employeee10_chk_1' is violated.

mysql> insert into employeee10  values(101, 'deepika', 19, 19000);
Query OK, 1 row affected (0.01 sec)



mysql> select * from employeee10;
+------+---------+------+----------+
| id   | name    | age  | salary   |
+------+---------+------+----------+
|  101 | deepika |   19 | 19000.00 |
+------+---------+------+----------+
1 row in set (0.00 sec)


suppose we want marks of student must be in range of 0 to 100

mysql> create table employeee11(rollno int ,name varchar(20), marks int check(marks between 0 and 100));
Query OK, 0 rows affected (0.05 sec)

mysql> insert into employeee10  values(101, 'abc', 120);
ERROR 1136 (21S01): Column count doesnt match value count at row 1



mysql> create table employeee12(id int ,name varchar(20), exp int, salary decimal(10,2), check((exp < 2 AND salary >= 15000) or (exp>=2 and salary>=25000)));
Query OK, 0 rows affected (0.03 sec)


check conmstaint with updation: 

a check constraint does not only validate new records but it also validated updated values. 


column level constraints Vs table level constraints:
***************************************************

column level : here the condition is return directly with the column. this is commonly used when the condition relates to one column. 

mysql> create table employeee11(rollno int ,name varchar(20), marks int check(marks between 0 and 100));                                                




in the table level constraints the condition is difined separetly . it is usefull when condition involves multiople columns. 

mysql> create table employeee12(id int ,name varchar(20), exp int, salary decimal(10,2), check((exp < 2 AND salary >= 15000) or (exp>=2 and salary>=25000)));
