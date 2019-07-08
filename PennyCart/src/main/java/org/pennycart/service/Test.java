package org.pennycart.service;

import java.util.ArrayList;
import java.util.List;

import org.pennycart.dao.ProductsDao;
import org.pennycart.model.Products;

public class Test {

	public static void main(String[] args) {
		/*CustomerService service = new CustomerService("reddi", 123, "email", "username", "password");
		System.out.println(service.getCustomerDao().getCustomer().getFullName());*/
		ProductsDao dao = new ProductsDao();
		List<Products> productsList=new ArrayList<Products>();
		productsList=dao.productsList();
		for(Products prod: productsList) {
			System.out.println(prod.getProductName());
		}
		
		
	}

}
