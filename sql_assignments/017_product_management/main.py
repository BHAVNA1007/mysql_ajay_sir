from model.product import Product
from service.product_service import ProductService

print("welcome to product management web")

service = ProductService()
product = Product(104, 'Almira', 'Furniture', 20000)
service.add_product(product)





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