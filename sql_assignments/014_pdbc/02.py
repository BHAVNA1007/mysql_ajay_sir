
import mysql.connector  
print("Import done")

conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish

if conn.is_connected():
    print("connected to database successfully")

cursor = conn.cursor() 

while True:
    print("\n***********MENU************\n")
    print("===== EMPLOYEE MANAGEMENT SYSTEM=====")
    print('1. Add Employee')
    print('2. Display All Employee')
    print('3. Search Employee by Name')
    print('4. Update Employee Salary')
    print('5. Delete Employee')
    print('6. Exit')
    choice = int(input("ENTER CHOICE:  ")) 

    match choice:

        case 1:

            print('1. Add  EMPLOYEE')
            eid = int(input('ENTER  EMPLOYEE ID : '))
            ename = input("ENTER  EMPLOYEE NAME : ")
            department = input("ENTER Department: ")
            salary = float(input("ENTER Salary : "))
            city = input("ENTER CITY : ")
            query = "insert into employee_pdbc(eid, ename, department, salary, city) values(%s, %s, %s, %s, %s)"
            cursor.execute(query, (eid, ename, department, salary, city))     
            conn.commit()
            print("Employee inserted successfully.")

        case 2:
            print('2. DISPLAY ALL EMPLOYEES')
            query = "select * from employee_pdbc"
            cursor.execute(query )
            rows = cursor.fetchall()
            print('------------------------------------')
            print("ID    NAME    Department    Salary    CITY")
            print('------------------------------------')
            for row in rows:
                print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")

        case 3:
            print('3. Search Employee by Name')
            ename = input("enter Employee name: ") 
            query = "select * from employee_pdbc where ename like %s"
            cursor.execute(query, ("%"+ ename + "%",))
            rows = cursor.fetchall()
            print('------------------------------------')
            print("ID    NAME    Department    Salary    CITY")
            print('------------------------------------')
            for row in rows:
                print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")


        case 4:

            print('4. Update Student Fees')   
            eid = int(input("ENTER E_ID: "))
            salary  = float(input("ENTER NEW salary: "))
            query = "update employee_pdbc set salary = %s where eid = %s"
            cursor.execute(query, (salary, eid))

            conn.commit()
            print("Employee salary updated successfully.")


        case 5:
            print('5. Delete employee')
            eid = int(input("ENTER E_ID: "))
            query = "delete from employee_pdbc where eid = %s"
            cursor.execute(query, (eid, ))
            conn.commit()

            print("employeee deleted successfully.")

        case 6:

            print('Thank you for using employee Management System.')   
            break
             
conn.close()
print("Connection closed successfully.")

  