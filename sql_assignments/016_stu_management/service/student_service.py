from dao.student_dao import StudentDao

class StudentService:

    def update_student_by_id(self, id, name):
        print("dao student updating logic")
        dao = StudentDao()
        student = dao.update_student_by_id(id, name)
        return student

    def get_student_by_id(self, id):
        print("dao getting student by id")
        dao = StudentDao()
        student = dao.get_student_by_id(id)
        return student

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