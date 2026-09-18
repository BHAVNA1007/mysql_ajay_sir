import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()
    id = int(input("enter id"))
  
    salary = float(input("enter salary "))

    query = "update pdemployee1 set salary = %s where id = %s"
    cursor.execute(query, (salary, id))

    conn.commit()
    print("data updated")
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
enter id101
enter salary 70000
data updated
inside finally block
Connection closed successfully.

'''    