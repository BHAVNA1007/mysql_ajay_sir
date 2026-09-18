from service.employee_service import EmployeeService

from model.employee import Employee

print("welcome to our website")
service = EmployeeService()

#service.displayemployee()
#employee = Employee(909090, "krishna", 909999)
#service.add_employee(employee)


Employees = service.display_all_employees()

for employee in Employees:
    print("id", employee.id)
    print("name", employee.name)
    print("salary", employee.salary)
    print()







'''
welcome to our website
processing employee information
dao getting employee data
database connection created
id 101
name deepika
salary 70000.00

id 102
name rashmika
salary 70000.00

id 103
name virat
salary 80000.00

id 104
name sneha
salary 89999.00

id 105
name vishnu
salary 66666.00

id 107
name suraj
salary 899999.00

id 909090
name krishna
salary 909999.00

'''





'''
welcome to our website
processing employee request
database connection created
dao getting employee data
'''



'''
welcome to our website
service adding employee
dao saving employee data
ID 101
Name deepika
salary 9000
database connection created

'''



'''
welcome to our website
service adding employee
dao saving employee data
ID 909090
Name krishna
salary 909999
database connection created
data saved successsfully

'''



'''
mysql> select * from pdemployee1;
+--------+----------+-----------+
| id     | name     | salary    |
+--------+----------+-----------+
|    101 | deepika  |  70000.00 |
|    102 | rashmika |  70000.00 |
|    103 | virat    |  80000.00 |
|    104 | sneha    |  89999.00 |
|    105 | vishnu   |  66666.00 |
|    107 | suraj    | 899999.00 |
| 909090 | krishna  | 909999.00 |
+--------+----------+-----------+
7 rows in set (0.01 sec)

'''