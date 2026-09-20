from database.connection import Database
from model.book import Book

class BookDao:

    def update_book_name_by_id(self, id, name):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = 'update book set bname = %s where id = %s'
        cursor.execute(query, (name, id))

        update_count = cursor.rowcount
        conn.commit()
        cursor.close()
        conn.close()

        if update_count > 0:
            print("book name updated")
        else:
            print("book not found") 
        return update_count       


    def get_book_by_id(self, id):
        print("dao getting a book by id")
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "select * from book where id = %s"
        cursor.execute(query, (id,))

        row = cursor.fetchone()  
        cursor.close()
        
        if row is not None:
            book = Book(row[0], row[1], row[2], row[3])
            return book
        
        conn.close()
        return None


    def get_all_books(self):
       print("dao getting book data")
       db = Database()
       conn = db.connect()
       cursor = conn.cursor()
       query ="select * from book"

       cursor.execute(query)
       rows = cursor.fetchall()
       books = []

       for row in rows:
           book = Book(row[0], row[1], row[2], row[3])
           books.append(book)

       conn.close()
       return books   


    def save_book(self, book):
        print("dao saving the book deta")
        print("id", book.id)
        print("bnmae", book.bname)
        print("Auther", book.bauther)
        print("price", book.bprice) 

        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "insert into book(id, bname, bauther, bprice) values(%s, %s, %s, %s)"
        data = (book.id, book.bname, book.bauther, book.bprice)
        cursor.execute(query, data)
        conn.commit()

        print("data saved successfully")




'''

welcome to our book store
proceesing book information
dao getting book data
database connection stablish
database connection stablish
id 101
bname The Alchemist
bauther paulo coelho
price 300.00

id 102
bname Atomic Habits
bauther James Clear
price 400.00


'''