DATA TYPES IN  MYSQL:

datatype define what kind of value column can store
how much storage is require
what kind of values are allow, what operations can be perform

CATOGORIES:

1. NUMARIC
2. STRING
3. DATE AND TIME
4. JSON

1. NUMARIC:
IN MYSQL numeric data type are to store numeric values. such as integers, and decimal numbers.
they alow database to perform methematical operations

EX. 

int          4
tinyint     -128       127
small 
bigint
decimal
float
double


int: 
note : by default integer types are signed so they can store positive and negative values.

UNSIGED dose not allow neg values and increas the positive range.


EXPERIMENT: 

mysql> use batch18;
Database changed


mysql> create table demo1(id tinyint unsigned);
Query OK, 0 rows affected (0.10 sec)


mysql> desc demo1;
+-------+------------------+------+-----+---------+-------+
| Field | Type             | Null | Key | Default | Extra |
+-------+------------------+------+-----+---------+-------+
| id    | tinyint unsigned | YES  |     | NULL    |       |
+-------+------------------+------+-----+---------+-------+
1 row in set (0.04 sec)



decimal : 
it is use for exact decimal values specially

decimal(m, d)
m = total digits
d = digits after decimal



float and double:
it is used for approximate decimal values.

float    lower precision
double    higher precision
decimal    exact precision


STRING datatypes:
it is used for text.

char: it is used for fixed length string

EX.
countrycode char(2)
IN
US
UK

varchar: it is used for variable length string.
it is most commonly used string type in application development

EX.
name varchar(100)

text: 
it is use for larger text.

tinytext      255 bytes
text          65535 bytes
mediumtext
longtext

EXPERIMENT:

mysql> create table demo2(id int, description text);
Query OK, 0 rows affected (0.04 sec)

mysql> desc demo2;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| id          | int  | YES  |     | NULL    |       |
| description | text | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)


ENUM : it allow one value from a predifind list.

status enum('active','onleave','inactive')

EXPERIMENT:

mysql> create table demo3(id int, status enum('active','onleave','inactive'));
Query OK, 0 rows affected (0.03 sec)

mysql> desc demo3;
+--------+-------------------------------------+------+-----+---------+-------+
| Field  | Type                                | Null | Key | Default | Extra |
+--------+-------------------------------------+------+-----+---------+-------+
| id     | int                                 | YES  |     | NULL    |       |
| status | enum('active','onleave','inactive') | YES  |     | NULL    |       |
+--------+-------------------------------------+------+-----+---------+-------+
2 rows in set (0.00 sec)



mysql> insert into demo3 values(101, 'active'),(102,'onleave');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from demo3;
+------+---------+
| id   | status  |
+------+---------+
|  101 | active  |
|  102 | onleave |
+------+---------+
2 rows in set (0.00 sec)


mysql> insert into demo3 values(103, 'yes');
ERROR 1265 (01000): Data truncated for column 'status' at row 1



set:
it allow multiple values from a predefind values

skills set('java', 'python', 'sql',)

here multiple values can be selected 

NOTE: SET is less commonly used in modern application design.
for complex relationships a separate mapping table is created



mysql> create table demo4(id int, name varchar(20), status enum('leav','active'), skills set('java','python','mysql', 'react'));
Query OK, 0 rows affected (0.03 sec)


mysql> desc demo4;
+--------+--------------------------------------+------+-----+---------+-------+
| Field  | Type                                 | Null | Key | Default | Extra |
+--------+--------------------------------------+------+-----+---------+-------+
| id     | int                                  | YES  |     | NULL    |       |
| name   | varchar(20)                          | YES  |     | NULL    |       |
| status | enum('leav','active')                | YES  |     | NULL    |       |
| skills | set('java','python','mysql','react') | YES  |     | NULL    |       |
+--------+--------------------------------------+------+-----+---------+-------+


mysql> insert into demo4 values(103, 'kuldeep', 'active', 'python,mysql'),(104, 'bhavna', 'leav', 'java,python,mysql');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0



mysql> select * from demo4;
+------+---------+--------+-------------------+
| id   | name    | status | skills            |
+------+---------+--------+-------------------+
|  103 | kuldeep | active | python,mysql      |
|  104 | bhavna  | leav   | java,python,mysql |
+------+---------+--------+-------------------+
2 rows in set (0.00 sec)

