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

<title>Check Out</title>
</head>
<body
	style="background-image: url('uimage.jpg'); background-size: contain; background-repeat: no-repeat; background-size: cover;">
	<label style="float: right; margin: 10px;"><a href="Logout.jsp">Logout</a></label>
	<label style="float: left; margin: 10px"><a href="Shopping.jsp">Home</a></label>
	
	
	<h3 style="color: #DA621E; padding-top: 50px" align="center">
		Check out here Mr.
		<%=session.getAttribute("name")%>!
	</h3>
	<h4 style="color: #DA621E; padding-top: 50px" align="center">Enter
		the address and Proceed</h4>

	<form action="CheckOutServlet" method="post">

		<table align="center" style="color: #DA621E;">


			<c:forEach var="buyprod" items="${sessionScope.cartList}"
				varStatus="status">
				<c:set var="total" value="${buyprod.price*buyprod.count+total}"></c:set>

				<input type="hidden" id="prevTotal${status.index}"
					value="${buyprod.count}">

				<tr>
					<td></td>
					<td><input type="hidden" name="checkProductName"
						id="pName${status.index}" value="${buyprod.productName}"></td>
					<td><input type="hidden" name="checkProductPrice"
						id="pPrice${status.index}" value="${buyprod.price}"
						readonly="readonly"></td>
					<td><input type="hidden" name="checkProductCount"
						id="pQuant${status.index}" value="${buyprod.count}"></td>
					<td><input type="hidden" id="total${status.index}"
						value="${buyprod.price*buyprod.count}" readonly="readonly"></td>
				<tr>
			</c:forEach>

			<tr>
				<td>Name:</td>
				<td><input type="text" name="addressName" required></td>
			</tr>
			<tr>
				<td>Mobile#:</td>
				<td><input type="number" name="addressMobile" required></td>
			</tr>
			<tr>
				<td>Address Line1:</td>
				<td><input type="text" name="addressLine1" required></td>
			</tr>
			<tr>
				<td>Address Line2:</td>
				<td><input type="text" name="addressLine2" required></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><input type="text" name="addressCity" required></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><input type="text" name="addressState" required></td>
			</tr>
			<tr>
				<td>Zip Code:</td>
				<td><input type="text" name="addressZipCode" required></td>
			</tr>

			<tr>
				<td></td>
				<td></td>
				<td>Grand Total</td>
				<td>$<input type="text" id="grandTotal" readonly="readonly"
					value="${total}"></td>
			</tr>


		</table>
		<div style="text-align: center; font: #DA621E;">
			<input type="submit" class="btn btn-primary" value="Proceed To Pay">

		</div>
	</form>
</body>
</html>