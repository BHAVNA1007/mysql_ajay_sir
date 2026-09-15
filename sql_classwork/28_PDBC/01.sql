
PDBC :
=====

Python database connectivity is a machanism that enables python application to communicate with RDBMS using standrise API.

Python follows s satndard  called python DB-API 2.0

this ensures that different db modules behave similarlly.

Before DB-API. every DB had its own way of connecting and accecuting queryes.
DB-API provides common standard so code becomes portable, consistence, easy to maintain.

It is not a library it is set of rules.

ADVANTAGES OF API:
==================

DB independance 

easy to switch.

standard coding style.

secure (it supports parameterised query)

reduce development time.

****************************************************************************************

PYTHON DB MODULE (DRIVER):
==========================

To connect  python with DB we use specific libraries.

For MYSQL  mysql-connector-python,  pyMySQL

PostgreSQL psycopg2

SQLite sqlite3 (built-in)

Oracle cx_oracle

MongoDB pymongo


DRIVER :
========

A  DB driver or module  is a python library that allow your program to connect to a DB , execute sql query and fatch result

this modules follow PEP249 THATS why thats structure is similar

PYTHON ENHANCMENT PROPOSAL. (PEP) 
249 -  PROPOSAL NO

This proposal tells how python DB module should behave and what methods they must provide.


DB CONNECTIVITY ARCHITECHTURE :
===============================

USER/ APPLICATION PROGRAM

         |

DB-API 2.0 interface(PEP 249)

         |

DB driver (mysql - connector)

         |

DB server (mysql/postgresql)

         |

     DB storage  



STEPS TO CONNECT PYTHON WITH DB:
================================

step 1. IMPORT DB MODULE

step 2. ESTABLISH CONNECTION

step 3. CREATE CURSOR OBJECT

step 4. EXECUTE SQL QUERYIES

step 5. FATCH RESULTS

step 6. COMMIT TRANSACTION IF NEEDED

step 7. CLOSE CONNECTION

********************************************************************

step 1. IMPORT DB MODULE


import mysql.connector

print('aree import ho gya')

step 2. ESTABLISH CONNECTION


conn = mysql.connector.connect(
        host="localhost",
        port=3306,
        user="root",
        password="Bhavna@123",
        database="batch18"

    )

    print("Connection bhi establish ho gaya")


CREATE CURSOR OBJECT:
=======================

IN PYTHON DB CONNECTION A CURSUR OBJECT IS USED TO INTERECT WITH THE DB .

IT ACTS LIKE A BRIDGE BETWEEN YOUR PYTHON CODE AND DB.

A cursur is an object that allow you to execute sql queries fatch results from the DB etc.

Even after stablishing a connection we can not execute sql quries directly using the connection object we must create a cursor object because it provide methods like 

execute()

fetchone()

fetchall()

it manages query excecution it handle result sets.

cursor = connection.cursor()


CURSOR.EXECUTE() :
==================
USE TO SENT SQL COMMANDS  TO THE DB  THROGH A CURSOR OBJECT.
MEANS it tells to the DB that run this sql query.

 SYNTAX :


 cursor.execute(query, values)

 query ---- sql statements

 values ----- optional .... tuple of values to insert in database


 insertion in :




 *************************************************************************


 mysql> desc pdemployee1;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int           | NO   | PRI | NULL    |       |
| name   | varchar(20)   | YES  |     | NULL    |       |
| salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> select * from pdemployee1;
+----+------+----------+
| id | name | salary   |
+----+------+----------+
|  1 | dipu | 60000.00 |
+----+------+----------+
1 row in set (0.00 sec)

mysql> select * from pdemployee1;
+----+----------+----------+
| id | name     | salary   |
+----+----------+----------+
|  1 | dipu     | 60000.00 |
|  2 | rashmika | 70000.00 |
+----+----------+----------+
2 rows in set (0.00 sec)

*****************************************************************************************










