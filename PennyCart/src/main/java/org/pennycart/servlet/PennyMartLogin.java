package org.pennycart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pennycart.dao.DatabaseConnection;
import org.pennycart.service.CustomerService;

/**
 * Servlet implementation class PennyMartLogin
 */
public class PennyMartLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public PennyMartLogin() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResultSet rs;
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement data = con.prepareStatement("select * from customer");
			rs = data.executeQuery();
			boolean error = false;
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			while (rs.next()) {

				String fullname = rs.getString("FULLNAME");
				int mobilenumber = rs.getInt("MOBILENUMBER");
				String email = rs.getString("EMAIL");
				String username = rs.getString("USERNAME");
				String password = rs.getString("PASSWORD");
				CustomerService customerService = new CustomerService(fullname, mobilenumber, email, username,
						password);
				if (customerService.validateCredentials(uname, pwd) == true) {
					error = true;
					break;
				}

			}
			if (!error) {
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
				rd.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("name", uname);
				response.sendRedirect("Shopping.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
