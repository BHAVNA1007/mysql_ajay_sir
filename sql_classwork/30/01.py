
import mysql.connector

print('aree import ho gya')

try:
    conn = mysql.connector.connect(
        host="localhost",
        port=3306,
        user="root",
        password="Bhavna@123",
        database="batch18"
    )

    print("Connection bhi establish ho gaya")

    if conn.is_connected():
        print('connection stablished')

    cursor = conn.cursor()

    name = input('enter employee name: ')

    query = "select * from pdemployee1 where name = %s"
    cursor.execute(query, (name,))
    rows = cursor.fetchall()
    print(rows)
    
    print('another correct way which we use for below query')

    '''
    name = input('enter employee name: ')

    query = "select * from pdemployee1 where name = '"+name+ "'"
    cursor.execute(query )
    rows = cursor.fetchall()
    print(rows)

    '''

    ''' 
    cursor.execute("select * from pdemployee1")
     
    rows = cursor.fetchall()
    print(len(rows))
    '''
    

    '''
    cursor.execute("select * from pdemployee1 where salary > 50000")
    for row in cursor:
        print(row)

    '''    

    '''
    cursor = conn.cursor(dictionary= True)
    cursor.execute("select * from pdemployee1")
 
    row = cursor.fetchone()
    print(row)
    print(row['name'])
    '''


    ''' 
    cursor.execute("select * from pdemployee1")

    row = cursor.fetchone()
    print(row[0])
    print(row[1])
    print(row[2])
    print('done')
    '''


    '''
    cursor.execute("select * from pdemployee1")

    for row in cursor:
        print(row)

    print('done') 
    '''   

    '''
    cursor.execute("select * from pdemployee1")
    
    print("using fetchmany")
    print(cursor.fetchmany(5))

    print("record show successfully")
    '''

    '''
    cursor.execute("select * from pdemployee1")
    print("using fetchone")
    print(cursor.fetchone())
    print("record show successfully")
    '''
    '''
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


    '''   

    query = "insert into pdemployee1 values(%s, %s, %s)"
    data = [(101, 'deepika', 5000), (102, 'rashmika', 70000), (103, 'virat', 80000)]
    cursor.executemany(query, data)
    '''

    conn.commit()
    print("inserted without tea")

  

except Exception as e:
    print("Something went wrong:", e)   

finally:
    print("inside finally block")
    conn.close()
    print("connection successfully closed")   


