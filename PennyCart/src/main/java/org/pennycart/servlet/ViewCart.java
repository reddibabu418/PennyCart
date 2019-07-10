package org.pennycart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pennycart.dao.ProductsDao;
import org.pennycart.model.Products;

/**
 * Servlet implementation class ViewCart
 */
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String user1 = (String) session.getAttribute("name");

		ProductsDao productsDao = new ProductsDao();
		List<Products> cartList = productsDao.getUserCart(user1);
		if (cartList.isEmpty()) {
			request.setAttribute("errorCart", "No Products Available in cart");
			session.setAttribute("cartList", cartList);
			RequestDispatcher rd = request.getRequestDispatcher("/MyCart.jsp");
			rd.forward(request, response);
		} else {
			session.setAttribute("cartList", cartList);
			response.sendRedirect("MyCart.jsp");
		}

	}

}
