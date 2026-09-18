import mysql.connector  
print("Import done")

conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish

if conn.is_connected():
    print("connected to database successfully")

cursor = conn.cursor() 

while True:
    print("\n***********MENU************\n")
    print("===== STUDENT MANAGEMENT SYSTEM =====")
    print('1. Add Student')
    print('2. Display All Students')
    print('3. Search Student by Name')
    print('4. Update Student Fees')
    print('5. Delete Student')
    print('6. Exit')
    choice = int(input("ENTER CHOICE:  ")) 

    match choice:

        case 1:

            print('1. Add Student')
            sid = int(input('ENTER STUDENT ID : '))
            sname = input("ENTER NAME : ")
            course = input("ENTER COURSE: ")
            fees = float(input("ENTER FEES : "))
            city = input("ENTER CITY : ")
            query = "insert into student_pdbc(sid, sname, course, fees, city) values(%s, %s, %s, %s, %s)"
            cursor.execute(query, (sid, sname, course, fees, city))     
            conn.commit()
            print("data inserted")

        case 2:
            print('2. Display All Students')
            query = "select * from student_pdbc"
            cursor.execute(query )
            rows = cursor.fetchall()
            print('------------------------------------')
            print("ID    NAME    COURSE    FEES    CITY")
            print('------------------------------------')
            for row in rows:
                print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")

        case 3:
            print('3. Search Student by Name')
            sname = input("enter name: ") 
            query = "select * from student_pdbc where sname like %s"
            cursor.execute(query, ("%"+sname + "%",))
            rows = cursor.fetchall()
            print('------------------------------------')
            print("ID    NAME    COURSE    FEES    CITY")
            print('------------------------------------')
            for row in rows:
                print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")


        case 4:

            print('4. Update Student Fees')   
            sid = int(input("ENTER S_ID: "))
            fees  = float(input("ENTER NEW FEES: "))
            query = "update student_pdbc set fees = %s where sid = %s"
            cursor.execute(query, (fees, sid))

            conn.commit()
            print("Employee salary updated successfully.")


        case 5:
            print('5. Delete Student')
            sid = int(input("ENTER S_ID: "))
            query = "delete from student_pdbc where sid = %s"
            cursor.execute(query, (sid, ))
            conn.commit()

            print("Student deleted successfully.")

        case 6:

            print('Thank you for using Student Management System.')   
            break
             
conn.close()
print("Connection closed successfully.")

  