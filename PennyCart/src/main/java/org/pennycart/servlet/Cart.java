package org.pennycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
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
 * Servlet implementation class Cart
 */
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user1 = (String) session.getAttribute("name");
		String[] values = request.getParameterValues("checkButton");
		List<String> list = new ArrayList<String>();
		Collections.addAll(list, values);

		if (list.size() == 1) {
			request.setAttribute("noSelection", "Please select at least one product from the Below list");
			RequestDispatcher rd = request.getRequestDispatcher("/Shopping.jsp");
			rd.forward(request, response);
		}

		for (int i = 0; i < values.length - 1; i++) {
			System.out.println(values[i]);
			String[] prod = values[i].split(":");
			Products products = new Products(Integer.parseInt(prod[0]), prod[1], prod[2], Integer.parseInt(prod[3]),
					Double.parseDouble(prod[4]));
			ProductsDao dao = new ProductsDao();
			dao.addToCart(products, user1, 1);

		}

		ProductsDao productsDao = new ProductsDao();
		List<Products> cartList = productsDao.getUserCart(user1);
		if (cartList.isEmpty()) {
			request.setAttribute("errorCart", "No Products Available in cart");
			RequestDispatcher rd = request.getRequestDispatcher("/Shopping.jsp");
			rd.forward(request, response);
		} else {
			session.setAttribute("cartList", cartList);
			response.sendRedirect("MyCart.jsp");
		}

		/*
		 * PrintWriter print=response.getWriter(); print.write(user1);
		 */
	}

}
