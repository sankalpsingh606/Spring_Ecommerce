package com.sankalp.service;

import java.util.List;

import com.sankalp.entity.Category;
import com.sankalp.entity.Product;
import com.sankalp.entity.User;



public interface Serv {

	public List<Category> getAllCategories();
	public List<Product> getAllProducts();
	public List<User> getAllUser();
	public User logins(User user);
	public User emailCheck(User u);
	public User insert(User user);
	public Category addCategory(Category c);
	public Category categorybyId(int catId);
	public Product addProduct(Product p);
	public Product productByid(Integer id);
	public List<Product> getProductCategoryList(int cid);
}