from dao.book_dao import BookDao

class BookService:

    def  get_book_by_id(self, id):
        print("getting book logic")
        dao = BookDao()
        book = dao.get_book_by_id(id)
        return book
    
    def dispaly_all_book(self):
        print("proceesing book information")
        dao = BookDao()
        books = dao.get_all_books()

        return books
    
    def add_employee(self, book):

        #code to add a new books

        print("service adding new book")
        dao = BookDao()
        dao.save_book(book)