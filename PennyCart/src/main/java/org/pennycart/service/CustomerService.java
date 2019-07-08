package org.pennycart.service;

import org.pennycart.dao.CustomerDao;

public class CustomerService {
	private CustomerDao customerDao;
	public CustomerService(String fullname, int mobileNumber, String email, String username, String password) {
		customerDao=new CustomerDao(fullname, mobileNumber, email, username, password);
		
	}
	public boolean validateCredentials(String username, String password) {
		if(getCustomerDao().getCustomer().getUserName().equals(username)&&getCustomerDao().getCustomer().getPassword().equals(password)) {
			return true;
		}
		return false;
	}
	public CustomerDao getCustomerDao() {
		return customerDao;
	}

}
