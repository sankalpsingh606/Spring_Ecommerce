package com.sankalp.entity;

import java.util.List;

public class Order {

	private String name;
	private String email;
	private int contact;
	private String address;
	
	public Order() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Order [ name=" + name + ", email=" + email + ", contact=" + contact + ", address="
				+ address + "]";
	}


}
