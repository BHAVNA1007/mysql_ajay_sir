from database.connection import Database
from model.employee import Employee

class EmployeeDao:
    #def getemployee(self):
        #db = Database()
        #db.connect()
        #print("dao getting employee data")



    def get_all_employees(self):
        print("dao getting employee data")
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()
        query ="select * from pdemployee1"
        cursor.execute(query)
        rows = cursor.fetchall()
        employees =[]
        for row in rows:
    
            employee = Employee(row[0], row[1], row[2])
            employees.append(employee)

        conn.close() 
        return employees      


    def save_employee(self, employee):
        #code to save employee data to the database
        print("dao saving employee data")
        print("ID", employee.id)
        print("Name", employee.name)
        print("salary", employee.salary)
        db = Database()
        conn = db.connect()  
        cursor = conn.cursor()

        query = 'insert into pdemployee1(id, name, salary) values(%s, %s, %s)'  
        data = (employee.id, employee.name, employee.salary)
        cursor.execute(query, data)
        conn.commit()
        
        print("data saved successsfully")