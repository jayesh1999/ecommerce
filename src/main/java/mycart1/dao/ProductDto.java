package mycart1.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart1.entity.Category;
import mycart1.entity.Product;

public class ProductDto {

	private SessionFactory factory;

	public ProductDto(SessionFactory factory) {
		this.factory = factory;
	}

	//save product
	public boolean saveProduct(Product product) {

		boolean f = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}

		return f;

	}
	
	//get all product
	public List<Product> getAllProducts(){
		Session session = this.factory.openSession();
		
		Query query  = session.createQuery("From Product");
		List<Product> list = query.list();
		
		session.close();
		return list;
	} 
	
	//get product by categoryId
	public List<Product> getProductByCateogryId(int cId){
		
		Session session  = this.factory.openSession();
		
		Query query = session.createQuery("from Product where category_categoryId =: c");
		query.setParameter("c", cId);
		//from Product as p where p.category.categoryId =: c"
		List<Product> productByCid  = query.list();
		
		return productByCid;
	}
	
	
	
}
