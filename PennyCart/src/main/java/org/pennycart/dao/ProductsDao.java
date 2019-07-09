package org.pennycart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.pennycart.model.Products;

public class ProductsDao {
	
	public List<Products> productsList(){
		List<Products> productsList=new ArrayList<Products>();
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "SELECT * FROM products";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
            
            while (result.next()) {
                int productid = result.getInt("productid");
                String productname = result.getString("productname");
                String department = result.getString("department");
                int quantity = result.getInt("quantity");
                double price = result.getDouble("price");
                Products products = new Products(productid, productname, department, quantity, price);
                productsList.add(products);        
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return productsList;

	}
	public void addToCart(Products product, String username,int count) {
		try {
			Connection con;
			con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con.prepareStatement("insert into cart values(?, ?, ?, ?, ?,?,?)");
			st.setString(1, username);
			st.setInt(2, product.getProductId());
			st.setString(3, product.getProductName());
			st.setInt(4, product.getQuantity());
			st.setInt(5, count);
			st.setDouble(6, product.getPrice());
			st.setString(7, product.getDepartment());
			st.executeUpdate(); 
			st.close(); 
	        con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public List<Products> getUserCart(String user){
		List<Products> productsList=new ArrayList<Products>();
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "SELECT * FROM cart where username = '" + user + "'";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
            
            while (result.next()) {
                int productid = result.getInt("productid");
                String productname = result.getString("productname");
                String department = result.getString("department");
                int quantity = result.getInt("quantity");
                double price = result.getDouble("price");
                int count=result.getInt("count");
                Products products = new Products(productid, productname, department, quantity, price);
                products.setCount(count);
                productsList.add(products);        
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return productsList;

	}
	public void deleteCartProduct(int prodId){
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "delete from cart where productid="+prodId;;
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            
           /* while (result.next()) {
                int productid = result.getInt("productid");
                String productname = result.getString("productname");
                String department = result.getString("department");
                int quantity = result.getInt("quantity");
                double price = result.getDouble("price");
                Products products = new Products(productid, productname, department, quantity, price);
                productsList.add(products);        
            }*/
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void updateCart(String username,String prodName,int count){
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "update cart set count="+count+" where username='"+username+"' and productname='"+prodName+"'";
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            
         
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void updateProduct(String productName, int quantity) {
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "update products set quantity=quantity-"+quantity+" where productname='"+productName+"'";	
			Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            
         
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void emptyCart(String username) {
		try {
			Connection connection = DatabaseConnection.initializeDatabase();
			String sql = "delete from cart where username='"+username+"'";	
			Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            
         
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
