from dao.employee_dao import EmployeeDao


class EmployeeService:

    def update_employee_by_id(self, id, name):
        #update employee name by id
        dao = EmployeeDao()
        employee = dao.update_employee_by_id(id, name)
        return employee

    def  delete_employee_by_id(self, id):
        #delete employee by id
        dao = EmployeeDao()
        employee = dao.delete_employee_by_id(id)
        return employee
    

    def search_employee_by_id(self, id):
        #search employee by id
        dao = EmployeeDao()
        employee = dao.get_employee_by_id(id)
        return employee

    def display_all_employees(self):
        #code to display employee information  
        print("processing employee information")

        dao = EmployeeDao()
        employees = dao.get_all_employees()
        return employees

    def add_employee(self, employee):

        #code to add a new employee
        print("service adding new employee") 
        dao = EmployeeDao()
        dao.save_employee(employee)   