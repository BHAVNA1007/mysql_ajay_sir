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
    #query = "create table pdemployee1(id int primary key, name varchar(20), salary decimal(10,2))" 
    query = "insert into pdemployee1 values(2, 'rashmika', 70000)"
    cursor.execute(query)
    #print("table bhi ban giiiii yeeee...................")   
    print("inserted without tea")

    conn.commit()

except Exception as e:
    print("Something went wrong:", e)   

finally:
    print("inside finally block")
    conn.close()
    print("connection successfully closed")   




'''
OUTPUT:


aree import ho gya
Connection bhi establish ho gaya
connection stablished
table bhi ban giiiii yeeee...................
inside finally block
connection successfully closed


'''
       