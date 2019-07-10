package org.pennycart.dao;

import org.pennycart.model.Customer;

public class CustomerDao {
	private Customer customer;

	public CustomerDao(String fullname, int mobileNumber, String email, String username, String password) {
		customer = new Customer();
		customer.setFullName(fullname);
		customer.setMobileNumber(mobileNumber);
		customer.setEmail(email);
		customer.setUserName(username);
		customer.setPassword(password);

	}

	public Customer getCustomer() {
		return customer;
	}

}
