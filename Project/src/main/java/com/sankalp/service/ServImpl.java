package com.sankalp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sankalp.dao.Repo;
import com.sankalp.entity.Category;
import com.sankalp.entity.Product;
import com.sankalp.entity.User;


@Service
@Transactional
public class ServImpl implements Serv {

	@Autowired
	Repo repo;

	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return repo.getAllCategories();
	}

	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return repo.getAllProducts();
	}

	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return repo.getAllUser();
	}

	public User logins(User user) {
		// TODO Auto-generated method stub
		return repo.login(user);
	}

	public User emailCheck(User u) {
		// TODO Auto-generated method stubi
		return repo.emailCheck(u);
	}

	public User insert(User user) {
		// TODO Auto-generated method stub
		return repo.insert(user);
	}

	public Category addCategory(Category c) {
		// TODO Auto-generated method stub
		return repo.addCatgory(c);
	}

	public Category categorybyId(int catId) {
		// TODO Auto-generated method stub
		return repo.categorybyId(catId);
	}

	public Product addProduct(Product p) {
		// TODO Auto-generated method stub
		return repo.addProduct(p);
	}

	public Product productByid(Integer id) {
		// TODO Auto-generated method stub
		return repo.productByid(id);
	}

	public List<Product> getProductCategoryList(int cid) {
		// TODO Auto-generated method stub
		return repo.getProductCategoryList(cid);
	}

		
}