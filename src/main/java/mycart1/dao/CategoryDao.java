package mycart1.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart1.entity.Category;

public class CategoryDao {
	
	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public int saveCategory(Category cat) {
	
	Session session = this.factory.openSession();
	Transaction tx  = session.beginTransaction();
	
	int catId = (int)session.save(cat); 
	
	
	tx.commit();
	session.close();
		
	return catId;
		
	}
	
	public List<Category> getCategories(){
		
		Session session = this.factory.openSession();
		Transaction tx  = session.beginTransaction();
		
		Query query = session.createQuery("from Category");
		List<Category> list  = query.list();
		
		tx.commit();
		session.close();
		
		return list;
		
	}
	
	//get category by id
	
	public Category getCategoryById(int cId) {
		
		Category cat  = null;
		try {
			Session session = this.factory.openSession();
			
			cat = session.get(Category.class, cId);
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return cat;
		
		
		
		
	}

}
