import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()
    ids = [101, 102, 105]
    query = "select * from pdemployee1 where id in(%s, %s, %s)"
    
    cursor.execute(query, tuple(ids))
    for row in cursor.fetchall():
         print(row)
    print("finding in ids")
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
(101, 'deepika', Decimal('70000.00'))
(102, 'rashmika', Decimal('70000.00'))
(105, 'vishnu', Decimal('66666.00'))
finding in ids
inside finally block
Connection closed successfully.


'''