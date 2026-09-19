from dao.student_dao import StudentDao

class StudentService:

    def get_all_students(self):
        print("dao getting all student data")
        dao = StudentDao()
        studnets = dao.get_all_students()
        return studnets

    def displaystudent(self):
        print("processing student request")
        dao = StudentDao()
        dao.getstudent()

    def add_student(self, student):
        print("service adding student") 
        dao = StudentDao()
        dao.save_student(student)   