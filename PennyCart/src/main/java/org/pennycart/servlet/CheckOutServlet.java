package org.pennycart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pennycart.dao.ProductsDao;
import org.pennycart.model.Products;

/**
 * Servlet implementation class CheckOutServlet
 */
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutServlet() {
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
		String[] prodNames = request.getParameterValues("checkProductName");
		String[] prodCount = request.getParameterValues("checkProductCount");
		String[] prodPrice = request.getParameterValues("checkProductPrice");

		System.out.println();
		for (int i = 0; i < prodNames.length; i++) {
			ProductsDao productsDao = new ProductsDao();
			productsDao.updateProduct(prodNames[i], Integer.parseInt(prodCount[i]));

			System.out.println(prodNames[i] + "\t" + prodCount[i]);
		}

		ProductsDao productsoutSideLoop = new ProductsDao();
		productsoutSideLoop.emptyCart(user1);
		List<Products> cartList = productsoutSideLoop.getUserCart(user1);

		session.setAttribute("cartList", cartList);
		response.sendRedirect("ThankYou.jsp");

	}

}
