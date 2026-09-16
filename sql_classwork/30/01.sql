EXECUTE MANY:
=============

It is methode of the cursor object used to excecute the same sql  query multiple time with diffrent values.


instead of inserting one recort again and again using execute multiple thise we can insert multiple record at a time


cursor.executemany(query, datalist)


query.... sql statement  with plceholder(%s)
DATALIST..... list of tuples.


query = "insert into pdemployee1 values(%s, %s, %s)"

data = [(101, 'deepika', 5000), (102, 'rashmika', 70000), (103, 'virat', 80000)]

cursor.executemany(query, data)


'''
aree import ho gya          
Connection bhi establish ho gaya
connection stablished
inserted without tea
inside finally block
connection successfully closed

'''

'''

mysql> select * from pdemployee1;
+-----+----------+----------+
| id  | name     | salary   |
+-----+----------+----------+
| 101 | deepika  |  5000.00 |
| 102 | rashmika | 70000.00 |
| 103 | virat    | 80000.00 |
+-----+----------+----------+
3 rows in set (0.00 sec)

'''


read data from user:
===================



query = "insert into pdemployee1 values(%s, %s, %s)"
    n = int(input("enter number of records"))

    data = []


    for i in range (n):
        print("enter datatist")
        id = int(input('enter employee id'))
        name = input('enter employee name')
        salary = float(input('enter employee salary'))
        data.append((id, name, salary))

    cursor.executemany(query, data)
    conn.commit()
    print("inserted without tea")


'''
aree import ho gya
Connection bhi establish ho gaya
connection stablished
enter number of records1
enter datatist
enter employee id106
enter employee namevanshika
enter employee salary44444
inserted without tea
inserted without tea
inside finally block
connection successfully closed

'''


mysql> select * from pdemployee1;
+-----+----------+----------+
| id  | name     | salary   |
+-----+----------+----------+
| 101 | deepika  |  5000.00 |
| 102 | rashmika | 70000.00 |
| 103 | virat    | 80000.00 |
| 104 | sneha    | 89999.00 |
| 105 | vishnu   | 66666.00 |
| 106 | vanshika | 44444.00 |
+-----+----------+----------+
6 rows in set (0.00 sec)






Fetching data:
==============

Fatching data means retriving rows from the database table. after executing select query.

cursor.execute('select * from tablename')

this statment loads the results into the cursor object.

there are diffrent fetching methods provided by python tho fetch data from the result set.




1. fetchone: 
============

this function use to fetch one row at a time.

row = cursor.fetchone()

it returns a single tuple and after that cursor move to the next row after each call.

it return NONE when no more data is available.


cursor.execute("select * from pdemployee1")
print("using fetchone")
print(cursor.fetchone())
print("record show successfully")


'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
using fetchone
(101, 'deepika', Decimal('5000.00'))
record show successfully
Something went wrong: Unread result found
inside finally block
connection successfully closed

'''



2. fetchmany(size) :
====================

it fetches specified number of rows.


    cursor.execute("select * from pdemployee1")
    
    print("using fetchmany")
    print(cursor.fetchmany(5))

    print("record show successfully")


'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
using fetchmany
[(101, 'deepika', Decimal('5000.00')), (102, 'rashmika', Decimal('70000.00')), (103, 'virat', Decimal('80000.00')), (104, 'sneha', Decimal('89999.00')), (105, 'vishnu', Decimal('66666.00'))]
record show successfully
Something went wrong: Unread result found
inside finally block
connection successfully closed

'''



3. fetchall :

it fetches all the rows at ones.

NOTE : It returns a list of tuples.


cursor.execute("select * from pdemployee1")

    for row in cursor:
        print(row)

    print('done') 


'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
(101, 'deepika', Decimal('5000.00'))
(102, 'rashmika', Decimal('70000.00'))
(103, 'virat', Decimal('80000.00'))
(104, 'sneha', Decimal('89999.00'))
(105, 'vishnu', Decimal('66666.00'))
(106, 'vanshika', Decimal('44444.00'))
done
inserted without tea
inside finally block
connection successfully closed

'''



ACCESSING COLUMN VALUES:
========================

BY default rows are tuples we can access values by index.


    cursor.execute("select * from pdemployee1")

    row = cursor.fetchone()
    print(row[0])
    print(row[1])
    print(row[2])
    print('done')


'''
aree import ho gya
Connection bhi establish ho gaya
connection stablished
101
deepika
5000.00
done
Something went wrong: Unread result found
inside finally block
connection successfully closed
'''



Using dict cursor:
==================

if we want data in key value pair then we can use dictonary cursor

    cursor = conn.cursor(dictionary= True)
    cursor.execute("select * from pdemployee1")
    
    row = cursor.fetchone()
    print(row)
    print(row['name'])



'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
{'id': 101, 'name': 'deepika', 'salary': Decimal('5000.00')}
deepika
Something went wrong: Unread result found
inside finally block
connection successfully closed

'''



WAQ IN PDBC TO FETCH employees whose salary is greater then 50000.

    cursor = conn.cursor()
    cursor.execute("select * from pdemployee1 where salary > 50000")
    for row in cursor:
        print(row)



'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
(102, 'rashmika', Decimal('70000.00'))
(103, 'virat', Decimal('80000.00'))
(104, 'sneha', Decimal('89999.00'))
(105, 'vishnu', Decimal('66666.00'))
inserted without tea
inside finally block
connection successfully closed


'''



WAQ : to fetch and count records available in table        


    cursor.execute("select * from pdemployee1")
     
    rows = cursor.fetchall()
    print(len(rows))


'''

aree import ho gya
Connection bhi establish ho gaya
connection stablished
6
inserted without tea
inside finally block
connection successfully closed

'''






WAQ to display employee details whos name is table from user.

    cursor = conn.cursor()
    name = input('enter employee name: ')

    query = "select * from pdemployee1 where name = '"+name+ "'"
    cursor.execute(query )
    rows = cursor.fetchall()
    print(rows)


'''


aree import ho gya
Connection bhi establish ho gaya
connection stablished
enter employee name: sneha
[(104, 'sneha', Decimal('89999.00'))]
inserted without tea
inside finally block
connection successfully closed

'''


ANOTHER WAY
============
TO WRITE ABOVE QUERY


    name = input('enter employee name: ')

    query = "select * from pdemployee1 where name = %s"
    cursor.execute(query, (name,))
    rows = cursor.fetchall()
    print(rows)
    
    print('another correct way which we use for below query')




'''
aree import ho gya
Connection bhi establish ho gaya
connection stablished
enter employee name: sneha
[(104, 'sneha', Decimal('89999.00'))]
another correct way which we use for below query
inserted without tea
inside finally block
connection successfully closed
'''

