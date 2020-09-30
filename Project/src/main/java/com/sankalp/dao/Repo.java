package com.sankalp.dao;

import java.util.List;

import com.sankalp.entity.Category;
import com.sankalp.entity.Product;
import com.sankalp.entity.User;




public interface Repo {
	public List<Category> getAllCategories();
	public List<Product> getAllProducts();
	public List<User> getAllUser();
	
	public User login(User user);
	public User emailCheck(User u);
	public User insert(User user);
	public Category addCatgory(Category c);
	public Category categorybyId(int catId);
	public Product addProduct(Product p);
	public Product productByid(Integer id);
	public List<Product> getProductCategoryList(int cid);
}