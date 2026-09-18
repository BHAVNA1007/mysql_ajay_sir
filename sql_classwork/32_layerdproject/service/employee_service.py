from dao.employee_dao import EmployeeDao
class EmployeeService:
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