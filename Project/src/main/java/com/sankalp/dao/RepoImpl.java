package com.sankalp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sankalp.entity.Category;
import com.sankalp.entity.Product;
import com.sankalp.entity.User;

@Repository
public class RepoImpl implements Repo {

	@Autowired
	SessionFactory sessionFactory;

	public List<Category> getAllCategories() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Category> theQuery = currentSession.createQuery("from Category").list();
		return theQuery;
	}

	public List<User> getAllUser() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<User> theQuery = currentSession.createQuery("from User").list();
		return theQuery;
	}

	public List<Product> getAllProducts() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Product> theQuery = currentSession.createQuery("from Product").list();
		return theQuery;
	}

	public User login(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria cr = currentSession.createCriteria(User.class);
		cr.add(Restrictions.eq("userEmail", user.getUserEmail()));
		cr.add(Restrictions.eq("userPassword", user.getUserPassword()));
		return user = (User) cr.uniqueResult();

	}

	public User emailCheck(User u) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria cr = currentSession.createCriteria(User.class);
		cr.add(Restrictions.eq("userEmail", u.getUserEmail()));
		return u = (User) cr.uniqueResult();

	}

	public User insert(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
		return user;
	}

	public Category addCatgory(Category c) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(c);
		return c;
	}

	public Category categorybyId(int catId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Category c = currentSession.get(Category.class, catId);
		return c;

	}

	public Product addProduct(Product p) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(p);
		return p;
	}

	public Product productByid(Integer id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Product p = currentSession.get(Product.class, id);
		return p;
	}

//
//	public List<Product> getProductList() {
//		List<Product> list = new ArrayList<Product>();
//		try {
//			Session session = sessionFactory.getCurrentSession();
//			Criteria criteria = session.createCriteria(Product.class);
//			list = criteria.list();
//		} catch (Exception e) {
//			System.out.println(RepoImpl.class.getCanonicalName() + "->" + e.toString());
//		}
//		return list;
//	}
//
//	public List<Product> getProductCategoryList(int cid) {
//		List<Product> list = new ArrayList<Product>();
//		try {
//			Session session = sessionFactory.getCurrentSession();
//			Query query = session.createQuery("from Product as p where p.category.categoryId=: id");
//			query.setParameter("id", cid);
//			list = query.list();
//		} catch (Exception e) {
//			System.out.println(RepoImpl.class.getCanonicalName() + "->" + e.toString());
//		}
//		return list;
//	}
	public List<Product> getProductCategoryList(int cid) {
		List<Product> list = new ArrayList<Product>();
		try {
			Session session = sessionFactory.getCurrentSession();
			 Query query=session.createQuery("from Product as p where p.category.categoryId=: id");
			 query.setParameter("id", cid);
			list = query.list();
		} catch (Exception e) {
			System.out.println(RepoImpl.class.getCanonicalName() + "->" + e.toString());
		}
		return list;
	}

}