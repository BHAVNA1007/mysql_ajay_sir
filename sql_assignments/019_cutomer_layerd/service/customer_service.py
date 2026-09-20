from dao.customer_dao import CustomerDao


class CustomerService:

    def delete_customer_by_id(self, id):
        dao = CustomerDao()
        customer = dao.delete_customer_by_id(id)
        return customer

    def update_customer_by_id(self, id, name):
        dao = CustomerDao()
        customer = dao.update_customer_by_id(id, name)
        return customer

    def get_cutomer_by_id(self, id):
        dao = CustomerDao()
        customer = dao.get_cutomer_by_id(id)
        return customer

    def dispaly_all_customers(self):
        dao = CustomerDao()
        print("proccesing customer information")
        customers = dao.get_all_customers()
        return customers

    def add_customer(self, customer):
        dao = CustomerDao()
        print("service adding rew customer")
        dao.save_customer(customer)

