
import mysql.connector

print("connection imported")

conn = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    port = 3306,
    password = 'Bhavna@123',
    database = 'pdbc_practice'
)

if conn.is_connected:
    print("connection stablished successfully ")

while True:

    print("\n***************MENU***********************\n")
    print("===== COMPANY EMPLOYEE MANAGEMENT SYSTEM =====")
    print("1. Add Department")
    print("2. Add Employee")
    print("3. Display All Employees with Department")
    print("4. Search Employee by Name")
    print("5. Update Employee Salary")
    print("6. Update Employee Department")
    print("7. Delete Employee")
    print("8. Display Department-wise Employee Count")
    print("9. Display Department-wise Average Salary")
    print("10. Display Employees Earning More Than Average Salary")
    print("11. Display Employees Earning More Than Their Department Average")
    print("12. Display Employees Working in the IT Department")
    print("13. Display Departments Having More Than One Employee")
    print("14. Display Employee and Manager Names using Self Join")
    print("15. Display Departments with No Employees")
    print("16. Test Foreign Key Constraint")
    print("17. Exit ")

    choice = int(input("Enter choice: "))