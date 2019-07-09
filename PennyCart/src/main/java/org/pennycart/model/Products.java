package org.pennycart.model;

public class Products {
	private int productId;
	private String productName;
	private String department;
	private int quantity;
	private double price;
	private int count;
	public Products(int productId, String productName, String department, int quantity, double price) {
		this.productId = productId;
		this.productName = productName;
		this.department = department;
		this.quantity = quantity;
		this.price = price;
	}
	public int getProductId() {
		return productId;
	}
	public String getProductName() {
		return productName;
	}
	public String getDepartment() {
		return department;
	}
	public int getQuantity() {
		return quantity;
	}
	public double getPrice() {
		return price;
	}	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String toString() {
		return productId+":"+productName+":"+department+":"+quantity+":"+price;
	}
}
