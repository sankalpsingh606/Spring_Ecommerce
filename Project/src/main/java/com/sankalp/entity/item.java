package com.sankalp.entity;

public class item {
	private int quantity;
	private Product p =new Product();
	public item(Product p, int quantity) {
		super();
		this.quantity = quantity;
		this.p = p;
	}
	public item() {
		
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	
	@Override
	public String toString() {
		return "item [quantity=" + quantity + ", p=" + p + "]";
	}
	
}
