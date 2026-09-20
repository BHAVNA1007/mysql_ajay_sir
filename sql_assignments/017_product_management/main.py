from model.product import Product
from service.product_service import ProductService

print("welcome to product management web")

service = ProductService()

#id = int(input("Enter id which you want to update: "))
#name = input("enter new product name: ")
#product = service.update_product_by_id(id, name)

'''
welcome to product management web
Enter id which you want to update: 102
enter new product name: mobile
dao logic product update by id
connection stablished
product updated

mysql> select * from product;
+-----+--------+------------+-----------+
| pid | pname  | pcatogory  | price     |
+-----+--------+------------+-----------+
| 101 | laptop | electronic | 200000.00 |
| 102 | dryer  | electronic | 100000.00 |
| 103 | Sofa   | Furniture  |  50000.00 |
| 104 | Almira | Furniture  |  20000.00 |
+-----+--------+------------+-----------+

mysql> select * from product;
+-----+--------+------------+-----------+
| pid | pname  | pcatogory  | price     |
+-----+--------+------------+-----------+
| 101 | laptop | electronic | 200000.00 |
| 102 | moblie | electronic | 100000.00 |
| 103 | Sofa   | Furniture  |  50000.00 |
| 104 | Almira | Furniture  |  20000.00 |
+-----+--------+------------+-----------+
4 rows in set (0.00 sec)

'''

#id = int(input("Enter product id whic you want to see: "))
#product = service.get_product_by_id(id)
#print("id", product.pid)
#print("name", product.pname)
#print("catogory", product.pcatogory)
#print("price", product.price)

'''
welcome to product management web
Enter product id whic you want to see: 101
dao getting product by id logic
connection stablished
id 101
name laptop
catogory electronic
price 200000.00

'''



#products = service.get_all_products()
#for product in products:
#    print("id", product.pid)
#    print("name", product.pname)
#    print("catogory", product.pcatogory)
#    print("price", product.price)
#    print()

'''
welcome to product management web
dao getting all products logic
connection stablished
id 101
name laptop
catogory electronic
price 200000.00

id 102
name dryer
catogory electronic
price 100000.00

id 103
name Sofa
catogory Furniture
price 50000.00

id 104
name Almira
catogory Furniture
price 20000.00


'''    


#product = Product(104, 'Almira', 'Furniture', 20000)
#service.add_product(product)

'''
welcome to product management web
service adding product
dao saving product data
id 104
Name Almira
pcatogory Furniture
price 20000
connection stablished
data saved successfully

'''