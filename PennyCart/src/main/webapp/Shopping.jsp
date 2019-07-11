<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>PennycartShopping</title>
</head>
<body>
	<label style="float: right; margin:10px;"><a href="Logout.jsp">Logout</a></label>
	<h3 style="color: #DA621E; padding-top: 50px" align="center">
		Choose the items from below list and Enjoy your shopping Mr.
		<%=session.getAttribute("name")%>!
	</h3>
	<center>
			<form action="ViewCart" method="post" style="">

				<input type="submit" value="ViewCart" class="btn btn-primary" style="float:left; font: #DA621E; margin: 10px;">
			</form>
			<form action="ProductServlet" method="GET">
				<input type="submit" value="ViewProducts" class="btn btn-primary" style="float: right; font: #DA621E; margin: 10px;">
			</form>
	</center>
	<div style="color: red; text-align: center;">
		<%
			if (null != request.getAttribute("noSelection")) {
				out.println(request.getAttribute("noSelection"));
			}
		%>
	</div>

	<div style="color: red; text-align: center;">
		<%
			if (null != request.getAttribute("errorMessage")) {
				out.println(request.getAttribute("errorMessage"));
			}
		%>
	</div>
	<div>
		<form method="post" action="Cart">
			<table align="center" style="color: #DA621E;">
				<%
					String s = ":";
				%>
				<%
					if (session.getAttribute("productsList") != null) {
				%>
				<tr>
					<td></td>
					<th>Products</th>
					<th>Price</th>
				</tr>
				<%
					}
				%>
				<c:forEach items="${sessionScope.productsList}" var="product"
					varStatus="status">
					<tr>
						<td><input type="checkbox" name="checkButton"
							value="${product.toString()}"></td>
						<td><c:out value="${product.productName}"></c:out></td>
						<td><c:out value="${product.price}"></c:out></td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" name="checkButton">

			<%
				if (session.getAttribute("productsList") != null) {
			%>
			<div style="padding-left: 45%; font: #DA621E;">

				<input type="submit" value="Add to Cart" class="btn btn-primary">
			</div>
			<%
				}
			%>


		</form>
	</div>

</body>
</html>