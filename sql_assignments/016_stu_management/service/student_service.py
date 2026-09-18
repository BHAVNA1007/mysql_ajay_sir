from dao.student_dao import StudentDao

class StudentService:
    def displaystudent(self):
        print("processing student request")
        dao = StudentDao()
        dao.getstudent()

    def add_student(self, student):
        print("service adding student") 
        dao = StudentDao()
        dao.save_student(student)   