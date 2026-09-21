#solution


'''
============================================================
ASSIGNMENT 2: COMPANY DEPARTMENT AND EMPLOYEE ANALYSIS SYSTEM
============================================================

A company wants to manage departments and employees.
The system should support employee CRUD operations and analytical
queries using joins, foreign keys, and subqueries.

CONCEPTS TO PRACTICE
--------------------
1. Primary key
2. Foreign key
3. INSERT, SELECT, UPDATE, DELETE
4. INNER JOIN
5. LEFT JOIN
6. SELF JOIN
7. GROUP BY
8. HAVING
9. Aggregate functions
10. Single-row subquery
11. Multi-row subquery
12. Correlated subquery
13. LIKE operator
14. Menu-driven PDBC program


DATABASE TABLES
===============

TABLE 1: department_pdbc
------------------------
Column       Data Type
--------------------------------
dept_id      INT PRIMARY KEY
dept_name    VARCHAR(50)
location     VARCHAR(40)

SAMPLE DATA
-----------
dept_id  dept_name    location
------------------------------------
1        IT           Indore
2        HR           Bhopal
3        Finance      Indore
4        Sales        Ujjain
5        Training     Dewas


TABLE 2: employee_pdbc
----------------------
Column       Data Type
--------------------------------
emp_id      INT PRIMARY KEY
emp_name    VARCHAR(60)
salary      DECIMAL(10,2)
job_title   VARCHAR(50)
dept_id     INT
manager_id  

Foreign keys:
dept_id references department_pdbc(dept_id)
manager_id references employee_pdbc(emp_id)

SAMPLE DATA
-----------
emp_id  emp_name  salary    job_title          dept_id  manager_id
-------------------------------------------------------------------
101     Amit      70000.00  Developer           1        NULL
102     Priya     55000.00  Tester              1        101
103     Rahul     90000.00  Manager             1        NULL
104     Neha      45000.00  HR Executive        2        NULL
105     Karan     80000.00  Finance Manager     3        NULL
106     Anjali    50000.00  Accountant          3        105
107     Vijay     40000.00  Sales Executive     4        NULL
108     Pooja     60000.00  Trainer             5        NULL


MENU
====

===== COMPANY EMPLOYEE MANAGEMENT SYSTEM =====
1. Add Department
2. Add Employee
3. Display All Employees with Department
4. Search Employee by Name
5. Update Employee Salary
6. Update Employee Department
7. Delete Employee
8. Display Department-wise Employee Count
9. Display Department-wise Average Salary
10. Display Employees Earning More Than Average Salary
11. Display Employees Earning More Than Their Department Average
12. Display Employees Working in the IT Department
13. Display Departments Having More Than One Employee
14. Display Employee and Manager Names using Self Join
15. Display Departments with No Employees
16. Test Foreign Key Constraint
17. Exit

Enter your choice:


TASKS AND EXPECTED INPUT/OUTPUT
==============================

1. ADD DEPARTMENT
-----------------

INPUT
-----
Enter your choice: 1
Enter Department ID: 6
Enter Department Name: Research
Enter Location: Indore

OUTPUT
------
Department inserted successfully.


2. ADD EMPLOYEE
---------------

INPUT
-----
Enter your choice: 2
Enter Employee ID: 109
Enter Employee Name: Rohan
Enter Salary: 48000
Enter Job Title: Developer
Enter Department ID: 6
Enter Manager ID: 101

OUTPUT
------
Employee inserted successfully.


3. DISPLAY EMPLOYEES WITH DEPARTMENT USING INNER JOIN
------------------------------------------------------

REQUIRED OUTPUT COLUMNS
-----------------------
Employee ID
Employee Name
Job Title
Salary
Department Name
Location

EXPECTED OUTPUT
---------------
Emp ID  Employee Name  Job Title          Salary     Department
-------------------------------------------------------------------
101     Amit           Developer           70000.00   IT
102     Priya          Tester              55000.00   IT
103     Rahul          Manager             90000.00   IT
104     Neha           HR Executive        45000.00   HR
105     Karan          Finance Manager     80000.00   Finance
106     Anjali         Accountant          50000.00   Finance
107     Vijay          Sales Executive     40000.00   Sales
108     Pooja          Trainer             60000.00   Training


4. SEARCH EMPLOYEE BY NAME USING LIKE
-------------------------------------

INPUT
-----
Enter your choice: 4
Enter employee name to search: an

OUTPUT
------
Emp ID  Employee Name  Job Title       Salary
------------------------------------------------
101     Amit           Developer        70000.00
106     Anjali         Accountant       50000.00

Use:
WHERE emp_name LIKE '%an%'


5. UPDATE EMPLOYEE SALARY
-------------------------

INPUT
-----
Enter your choice: 5
Enter Employee ID: 102
Enter New Salary: 60000

OUTPUT
------
Employee salary updated successfully.


6. UPDATE EMPLOYEE DEPARTMENT
-----------------------------

INPUT
-----
Enter your choice: 6
Enter Employee ID: 107
Enter New Department ID: 5

OUTPUT
------
Employee department updated successfully.


7. DELETE EMPLOYEE
------------------

INPUT
-----
Enter your choice: 7
Enter Employee ID: 108

OUTPUT
------
Employee deleted successfully.


8. DEPARTMENT-WISE EMPLOYEE COUNT
---------------------------------

REQUIRED CONCEPTS
-----------------
INNER JOIN
GROUP BY
COUNT()

EXPECTED OUTPUT
---------------
Department  Employee Count
--------------------------
IT           3
HR           1
Finance      2
Sales        1
Training     1


9. DEPARTMENT-WISE AVERAGE SALARY
---------------------------------

REQUIRED CONCEPTS
-----------------
INNER JOIN
GROUP BY
AVG()

EXPECTED OUTPUT
---------------
Department  Average Salary
--------------------------
IT           71666.67
HR           45000.00
Finance      65000.00
Sales        40000.00
Training     60000.00


10. EMPLOYEES EARNING MORE THAN OVERALL AVERAGE SALARY
------------------------------------------------------

REQUIRED CONCEPT
----------------
Single-row subquery.

Question:
Display employees whose salary is greater than the average salary
of all employees.

EXPECTED OUTPUT
---------------
Emp ID  Employee Name  Salary
-----------------------------
101     Amit           70000.00
103     Rahul          90000.00
105     Karan          80000.00
108     Pooja          60000.00

Note:
The exact output changes if students update or delete records.


11. EMPLOYEES EARNING MORE THAN THEIR DEPARTMENT AVERAGE
--------------------------------------------------------

REQUIRED CONCEPT
----------------
Correlated subquery.

Question:
Display employees whose salary is greater than the average salary
of their own department.

EXPECTED OUTPUT
---------------
Emp ID  Employee Name  Department  Salary
------------------------------------------
103     Rahul          IT          90000.00
105     Karan          Finance     80000.00


12. EMPLOYEES WORKING IN IT DEPARTMENT
--------------------------------------

REQUIRED CONCEPT
----------------
Subquery returning one value.

Question:
Display all employees who work in the IT department.

EXPECTED OUTPUT
---------------
Emp ID  Employee Name  Salary
-----------------------------
101     Amit           70000.00
102     Priya          55000.00
103     Rahul          90000.00


13. DEPARTMENTS HAVING MORE THAN ONE EMPLOYEE
---------------------------------------------

REQUIRED CONCEPTS
-----------------
JOIN
GROUP BY
HAVING

EXPECTED OUTPUT
---------------
Department  Employee Count
--------------------------
IT           3
Finance      2


14. EMPLOYEE AND MANAGER NAMES USING SELF JOIN
----------------------------------------------

REQUIRED CONCEPT
----------------
Self join.

Question:
Display employee name and manager name.

EXPECTED OUTPUT
---------------
Employee Name  Manager Name
--------------------------
Priya          Amit
Anjali         Karan


15. DEPARTMENTS WITH NO EMPLOYEES
---------------------------------

REQUIRED CONCEPT
----------------
LEFT JOIN with IS NULL.

Question:
Display departments that do not have any employees.

EXPECTED OUTPUT
---------------
Department ID  Department Name
-----------------------------
6              Research

Note:
This output assumes department 6 was inserted and no employee
has yet been assigned to it.


16. FOREIGN KEY CONSTRAINT TEST
------------------------------

Try to insert an employee with a department ID that does not exist.

INPUT
-----
Enter your choice: 2
Enter Employee ID: 110
Enter Employee Name: Suresh
Enter Salary: 42000
Enter Job Title: Tester
Enter Department ID: 999
Enter Manager ID: 101

EXPECTED OUTPUT
---------------
Employee could not be inserted because the department ID
does not exist in the parent table.

Also test:
- Updating an employee to a non-existing department.
- Deleting a department that is referenced by employees.
- Inserting an employee with an invalid manager ID.
'''











import mysql.connector

conn = mysql.connector.connect(host="localhost", port=3306, user="root",password="Bhavna@123",database="pdbc_practice")

Cursor = conn.cursor()





while True:
    print()
    print("""===== COMPANY EMPLOYEE MANAGEMENT SYSTEM =====
1. Add Department
2. Add Employee
3. Display All Employees with Department
4. Search Employee by Name
5. Update Employee Salary
6. Update Employee Department
7. Delete Employee
8. Display Department-wise Employee Count
9. Display Department-wise Average Salary
10. Display Employees Earning More Than Average Salary
11. Display Employees Earning More Than Their Department Average
12. Display Employees Working in the IT Department
13. Display Departments Having More Than One Employee
14. Display Employee and Manager Names using Self Join
15. Display Departments with No Employees
16. Test Foreign Key Constraint
17. Exit""")
    print()
    choice = int(input("Enter your choice: "))
    print()
    match choice:

        case 1:
            idd = int(input("Enter Department ID: "))
            name = input("Enter Department Name: ")
            city = input("Enter Location: ")


            query = "INSERT INTO department_pdbc VALUES( %s, %s, %s)"
            Cursor.execute(query, (idd, name, city))
            conn.commit()
            print("Department inserted successfully.")

        case 2:
            emp_idd = int(input("Enter Employee ID: "))
            emp_name = input("Enter Employee Name: ")
            salary = float(input("Enter Salary: "))
            title = input("Enter Job Title: ")
            dept_id = int(input("Enter Department ID: "))
            man_id = int(input("Enter Manager ID: "))

            query = "INSERT INTO employee_pdbc VALUES( %s, %s, %s, %s, %s)"
            Cursor.execute(query, (emp_idd, emp_name, salary, title, dept_id, man_id ))
            conn.commit()
            print("Employee inserted successfully.")            

        case 3:
            query = """SELECT e.emp_id, e.emp_name, e.job_title, e.salary, d.dept_name FROM employee_pdbc AS e INNER JOIN department_pdbc AS d ON d.dept_id = e.dept_id"""

            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Emp ID    Employee Name    Job Title          Salary     Department")
            print("----------------------------------------------------------------------------")
            for row in rows:
                print(f"{row[0]}           {row[1]}         {row[2]}         {row[3]}     {row[4]}")  

        case 4:
            name = input("Enter employee name to search: ")

            query = "SELECT e.emp_id, e.emp_name, e.job_title, e.salary  FROM employee_pdbc AS e WHERE emp_name LIKE %s"

            Cursor.execute(query, ("%"+name+"%",))
            rows = Cursor.fetchall()
            print("Emp ID    Employee Name    Job Title        Salary")
            print("----------------------------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]}    {row[2]}    {row[3]}")    


        case 5:
            eid = int(input("Enter Employee ID: "))
            salary = float(input("Enter New Salary: "))

            query = "UPDATE employee_pdbc SET salary = %s WHERE eid = %s"

            Cursor.execute(query, (salary, eid))
            conn.commit()
            print("Employee salary updated successfully.")                    

        case 6:
            eid = int(input("Enter Employee ID: "))
            did = int(input("Enter New Department ID: "))

            query = "UPDATE employee_pdbc SET dept_id = %s WHERE eid = %s"
            Cursor.execute(query, (did, eid))
            conn.commit()
            print("Employee department updated successfully..")              

        case 7:
            oid = int(input("Enter Order ID: "))
            query = "DELETE FROM employee_pdbc WHERE order_id = %s"
            Cursor.execute(query, (eid,))
            conn.commit()
            print("Employee deleted successfully..")
          
        case 8:
            query = "SELECT d.dept_name, COUNT(*) FROM employee_pdbc AS e INNER JOIN department_pdbc AS d ON d.dept_id = e.dept_id GROUP BY d.dept_name"
            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Department    Employee Count ")
            print("---------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]} ")               
             

        case 9:
            query = "SELECT d.dept_name, AVG(e.salary) FROM employee_pdbc AS e INNER JOIN department_pdbc AS d ON d.dept_id = e.dept_id GROUP BY d.dept_name"
            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Department    Average Salary ")
            print("---------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]} ")    

        case 10:
            query = """SELECT emp_id, emp_name, salary FROM employee_pdbc WHERE  salary > (SELECT AVG(salary) FROM employee_pdbc)"""     

            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Emp ID    Employee Name      Salary")
            print("----------------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]}    {row[2]}") 

        case 11:
            query = """SELECT e.emp_id, e.emp_name, d.dept_name, e.salary FROM employee_pdbc as e INNER JOIN department_pdbc as d  ON e.dept_id = d.dept_id WHERE e.salary > (SELECT AVG(e2.salary) FROM employee_pdbc AS e2 WHERE e2.dept_id = e.dept_id)"""


            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Emp ID    Employee Name     Department      Salary")
            print("----------------------------------------------------------------------------")
            for row in rows:
                print(f"{row[0]}           {row[1]}         {row[2]}         {row[3]}")             


        case 12:
            query = """SELECT e.emp_id, e.emp_name, e.salary
                FROM employee_pdbc as e
                WHERE e.dept_id IN (SELECT d.dept_id FROM department_pdbc as d WHERE dept_name = 'IT')"""      

            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Customer ID    Customer Name    Salary")
            print("---------------------------------------")
            for row in rows:
                print(f"   {row[0]}           {row[1]}         {row[2]} ")               

        case 13:
            query = "SELECT d.dept_name, COUNT(*) FROM employee_pdbc AS e INNER JOIN department_pdbc AS d ON d.dept_id = e.dept_id GROUP BY d.dept_name HAVING count(*) > 1"
            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Department    Employee Count ")
            print("---------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]} ")   

        case 14:
            query = "SELECT e.emp_name, m.emp_name FROM employee_pdbc AS e JOIN employee_pdbc AS m ON m.emp_id = e.manager_id"
            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Employee Name    MAnager Name")
            print("---------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]} ") 

        case 15:
            query = "SELECT d.dept_id, d.dept_name FROM department_pdbc AS d LEFT JOIN employee_pdbc AS e ON e.dept_id = d.dept_id WHERE e.dept_id IS NULL"
            Cursor.execute(query)
            rows = Cursor.fetchall()
            print("Employee Name    Manager Name")
            print("---------------------------------")
            for row in rows:
                print(f"    {row[0]}         {row[1]} ")             

        case 16:
            try:
                emp_idd = int(input("Enter Employee ID: "))
                emp_name = input("Enter Employee Name: ")
                salary = float(input("Enter Salary: "))
                title = input("Enter Job Title: ")
                dept_id = int(input("Enter Department ID: "))
                man_id = int(input("Enter Manager ID: "))
                query = "INSERT INTO employee_pdbc VALUES( %s, %s, %s, %s, %s)"
                Cursor.execute(query, (emp_idd, emp_name, salary, title, dept_id, man_id ))
                conn.commit()

            except Exception:
                print("Employee could not be inserted because the department ID does not exist in the parent table.")    

            else:
                print("Employee inserted successfully.") 

        case 17:
            print("Thank youu....")
            break

        case _:
            print("Invalid choice. Please try again.")


conn.close()            