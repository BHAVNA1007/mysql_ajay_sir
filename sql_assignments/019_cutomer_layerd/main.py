from service.customer_service import CustomerService

from model.customer import Customer

print("welcome to our customer service")

service = CustomerService()


while True:
    choice = int(input("Enter choice: "))
    match choice:
        case 1:
            print("get all customers")
            customers = service.dispaly_all_customers()
            
            for customer in customers:
                print("id", customer.id)
                print("cname", customer.cname)
                print("cdob", customer.cdob)
                print("caddresss", customer.caddresss)
                print()

        case 2:
            print("search customer by id")
            id = input("Enter customer id : ")
            customer = service.get_cutomer_by_id(id)
            print("id", customer.id)
            print("cname", customer.cname)
            print("cdob", customer.cdob)
            print("caddresss", customer.caddresss)
            print()   

        case 3:
            print("customer name updation ")
            id = int(input("Enter customer id:  "))
            name = input("Enter customer new name: ")
            customer = service.update_customer_by_id(id, name)   

        case 4:
            print("customer deletion ")
            id = int(input("Enter customer id which you want to delete: "))
            customer = service.delete_customer_by_id(id)     

        case 5:
            print("yeeeeeee hiiipppp hiippp hureeeeeeee done dana done done ***CRUD***** ho gya ab so jao jaliiii  ssssss") 
            break

        case _:
            print("please enter valid choice....")    
            

'''
Enter choice: 5
yeeeeeee hiiipppp hiippp hureeeeeeee done dana done done ***CRUD***** ho gya ab so jao jaliiii  ssssss
'''
             

'''
Enter choice: 6
please enter valid choice....
'''              


'''
Enter choice: 4
customer deletion 
Enter customer id which you want to delete: 104
connection stablish
customer deleted
'''

'''
Enter choice: 3
customer name updation 
Enter customer id:  102
Enter customer new name: Shikha
connection stablish
customer updated
'''                             

'''
 welcome to our customer service
Enter choice: 2  
search customer by id
Enter customer id : 101
connection stablish
id 101
cname Bhavna
cdob 2000-10-07
caddresss Bhopal

 
'''       
    


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




'''

mysql> select * from customer;
+-----+---------+------------+-----------+
| id  | cname   | cdob       | caddresss |
+-----+---------+------------+-----------+
| 101 | Bhavna  | 2000-10-07 | Bhopal    |
| 102 | poonam  | 1998-08-10 | Indore    |
| 103 | deepika | 2005-01-06 | Mumbai    |
| 104 | Krishna | 2004-05-09 | Indore    |
+-----+---------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from customer;
+-----+---------+------------+-----------+
| id  | cname   | cdob       | caddresss |
+-----+---------+------------+-----------+
| 101 | Bhavna  | 2000-10-07 | Bhopal    |
| 102 | Shikha  | 1998-08-10 | Indore    |
| 103 | deepika | 2005-01-06 | Mumbai    |
| 104 | Krishna | 2004-05-09 | Indore    |
+-----+---------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from customer;
+-----+---------+------------+-----------+
| id  | cname   | cdob       | caddresss |
+-----+---------+------------+-----------+
| 101 | Bhavna  | 2000-10-07 | Bhopal    |
| 102 | Shikha  | 1998-08-10 | Indore    |
| 103 | deepika | 2005-01-06 | Mumbai    |
+-----+---------+------------+-----------+
3 rows in set (0.00 sec)


'''