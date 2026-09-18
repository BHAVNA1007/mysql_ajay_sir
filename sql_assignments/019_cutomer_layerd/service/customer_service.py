from dao.customer_dao import CustomerDao


class CustomerService:

    def dispaly_all_customers(self):

        print("proccesing customer information")
        dao = CustomerDao()
        customers = dao.get_all_customers()

        return customers

    def add_customer(self, customer):
        print("service adding rew customer")
        dao = CustomerDao
        dao.save_customer(customer)

