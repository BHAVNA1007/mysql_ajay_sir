from service.book_service import BookService

from model.book import Book

print("welcome to our book store")

service = BookService()

#id = int(input("enter book id which you want to see: "))
#book = service.get_book_by_id(id)
#print("id", book.id)
#print("bname", book.bname)
#print("bauther", book.bauther)
#print("price", book.bprice)
#print()


'''
welcome to our book store
enter book id which you want to see: 101
getting book logic
dao getting a book by id
database connection stablish
database connection stablish
id 101
bname The Alchemist
bauther paulo coelho
price 300.00
'''



#books = service.dispaly_all_book()
#for book in books:
#    print("id", book.id)
#    print("bname", book.bname)
#    print("bauther", book.bauther)
#    print("price", book.bprice)
#    print()

















'''
mysql> create table book(id int primary key, bname varchar(30), bauther varchar(30), bprice decimal(10,2));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into book values(101, 'The Alchemist', 'paulo coelho', 300), (102, 'Atomic Habits', 'James Clear', 400);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from book;
+-----+---------------+--------------+--------+
| id  | bname         | bauther      | bprice |
+-----+---------------+--------------+--------+
| 101 | The Alchemist | paulo coelho | 300.00 |
| 102 | Atomic Habits | James Clear  | 400.00 |
+-----+---------------+--------------+--------+
2 rows in set (0.00 sec)

mysql> create table customer (id int primary key, cname varchar(30), cdob date, caddresss varchar(225));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into customer values (101, 'Bhavna', '2000-10-07', 'Bhopal'), (102, 'poonam', '1998-08-10', 'Indore');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-----+--------+------------+-----------+
| id  | cname  | cdob       | caddresss |
+-----+--------+------------+-----------+
| 101 | Bhavna | 2000-10-07 | Bhopal    |
| 102 | poonam | 1998-08-10 | Indore    |
+-----+--------+------------+-----------+
2 rows in set (0.00 sec)
'''