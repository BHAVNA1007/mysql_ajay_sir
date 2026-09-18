import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()
    id = int(input("enter id"))
  
    query = "delete from pdemployee1 where id = %s"
    cursor.execute(query, ( id, ))

    conn.commit()
    print("data deleted")
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
enter id106
data deleted
inside finally block
Connection closed successfully.

'''    