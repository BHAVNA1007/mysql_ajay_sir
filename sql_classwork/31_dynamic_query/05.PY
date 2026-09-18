import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()
    name = input("enter name: ")

    query = "SELECT * from pdemployee1 where name like %s"
    cursor.execute(query, ( "%"+name,))

    for row in cursor.fetchall():
        print(row)

    print("finding the name ends with a")
    conn.close()

except Exception as e:
    print("Something went wrong",e)

finally :
    print("inside finally block")
    conn.close()
    print("Connection closed successfully.")



'''
Import done
connected to database successfully
enter name: a
(101, 'deepika', Decimal('70000.00'))
(102, 'rashmika', Decimal('70000.00'))
(104, 'sneha', Decimal('89999.00'))
finding the name ends with a
inside finally block
Connection closed successfully.
'''    




