from dao.product_dao import ProductDao

class ProductService:

    def get_all_products(self):
        print("dao getting all products logic")
        dao = ProductDao()
        product_list = dao.get_all_products()
        return product_list

    def displayproduct(self):
        print("proccessing Product reqeust")
        dao = ProductDao()
        dao.getproduct()

    def add_product(self, product):
        print("service adding product")
        dao = ProductDao()   
        dao.save_product(product) 