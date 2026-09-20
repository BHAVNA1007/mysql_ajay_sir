from model.product import Product
from service.product_service import ProductService

print("welcome to product management web")

service = ProductService()



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