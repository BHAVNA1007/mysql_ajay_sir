from database.connection import Database
from model.employee import Employee

class EmployeeDao:
    #def getemployee(self):
        #db = Database()
        #db.connect()
        #print("dao getting employee data")



   #update employee details
    def update_employee_by_id(self, id, name):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()
        
        query = "update pdemployee1 set name = %s where id = %s"
        cursor.execute(query, (name, id))
           
        update_count = cursor.rowcount

        conn.commit()
         
        if update_count > 0:
            print("Employee updated successfully.")

        else:
            print("Employee not found.")

        cursor.close()
        conn.close()  
        return update_count  

   # delete_employee_by_id ..... do yourself     

    def delete_employee_by_id(self, id):
       db = Database()
       conn = db.connect()
       cursor = conn.cursor()

       query = "delete from pdemployee1 where id = %s "
       cursor.execute(query, (id,))

       #row count if we want to know how many rows deleted
      
       deleted_count = cursor.rowcount

       conn.commit()
      
       if deleted_count > 0 :
           print(f"{deleted_count} employee deleted successfully.")
       else:
           print("employee not found")

       cursor.close()
       conn.close()
      

    def get_employee_by_id(self, id):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = 'select * from pdemployee1 where id = %s'
        cursor.execute(query, (id,))
        row = cursor.fetchone()
        cursor.close()
        conn.close()

        if row is not None:
             employee = Employee(row[0], row[1], row[2])
             return employee
        return None   

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