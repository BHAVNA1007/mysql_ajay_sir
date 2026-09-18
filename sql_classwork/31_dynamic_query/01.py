import mysql.connector  
print("Import done")
try :

    conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish
    
    if conn.is_connected():
        print("connected to database successfully")
    cursor = conn.cursor()

    name = input("Enter name")
    salary = float(input("enter salary "))

    query = "select * from pdemployee where name = %s and salary > %s"
    cursor.execute(query, (name, salary))

    for row in cursor.fetchall():
        print(row)

except Exception as e:
    print("Something went wrong",e)

finally :
    print("inside finally block")
    conn.close()
    print("Connection closed successfully.")


'''
Import done
connected to database successfully
Enter namedeepika
enter salary 1000
Something went wrong 1146 (42S02): Table 'batch18.pdemployee' doesn't exist
inside finally block
Connection closed successfully.

'''    