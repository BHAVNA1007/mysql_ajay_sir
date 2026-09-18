import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()
    id = int(input("enter id"))
  
    name = input("Enter name")
    salary = float(input("enter salary "))

    query = "insert into pdemployee1(id, name, salary) values(%s, %s, %s)"
    cursor.execute(query, (id, name, salary))

    conn.commit()
    print("data inserted")
    conn.close()

except Exception as e:
    print("Something went wrong",e)

finally :
    print("inside finally block")
    conn.close()
    print("Connection closed successfully.")




'''
# connected to database successfully
# enter id107
# Enter namesuraj
# enter salary 899999
# data inserted
'''    