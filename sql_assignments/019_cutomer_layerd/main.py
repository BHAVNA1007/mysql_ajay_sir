from service.customer_service import CustomerService

from model.customer import Customer


print("welcome to our customer service")

service = CustomerService()
customers = service.dispaly_all_customers()

for customer in customers:
    print("id", customer.id)
    print("cname", customer.cname)
    print("cdob", customer.cdob)
    print("caddresss", customer.caddresss)
    print()

    


'''

welcome to our customer service
proccesing customer information
dao getting all customers
connection stablish
id 101
cname Bhavna
cdob 2000-10-07
caddresss Bhopal

id 102
cname poonam
cdob 1998-08-10
caddresss Indore


'''