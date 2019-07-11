<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.pennycart.model.Products"%>
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

<title>MyCart</title>
<script type="text/javascript">
	function calcGrandTotal(total, price, count, quant, val) {
	
		if(val == "") {
			document.getElementById(count).value = 1;

			val = 1; 
		}
		
		if(val > quant) { 
			confirm("Sorry! We have only "+quant+" items available in store");
			document.getElementById(count).value = quant;

			val = quant;
		}
		
		if(val <= 0) {
			document.getElementById(count).value = 1;

			val = 1;
		}
		document.getElementById(total).value = val * price;
		
		
		var statusCount = parseInt(document.getElementById("varCount").value)+1;

		var sum = 0;
		for (var i = 0; i <= statusCount; i++) {
			sum = sum + parseInt(document.getElementById("total" + i).value);
			//alert(document.getElementById("total" + i).value);

		}
		document.getElementById("grandTotal").value = sum;

	}
</script>
</head>
<body>
	<label style="float: right; margin: 10px;"><a href="Logout.jsp">Logout</a></label>
	<label style="float: left; margin: 10px;"><a href="Shopping.jsp">Home</a></label>
	

	<h3 style="color: #DA621E; padding-top: 50px" align="center">
		Hello Mr.
		<%=session.getAttribute("name")%>! Your Cart is here
	</h3>

	<form action="UpdateCart" method="post" name="updForm">

		<table align="center" style="color: #DA621E;">

			<%
				if (null == request.getAttribute("errorCart")) {
			%>
			<tr>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
			</tr>
			<%
				}
			%>
			<c:forEach var="buyprod" items="${sessionScope.cartList}"
				varStatus="status">
				<c:set var="total" value="${buyprod.price*buyprod.count+total}"></c:set>

				<c:set var="count" value="${buyprod.count}"></c:set>

				<input type="hidden" id="prevCount${status.index}" value="${count}">

				<input type="hidden" id="varCount" value="${status.count}">


				<tr>
					<td><input type="text" id="pName${status.index}"
						name="pCartName" value="${buyprod.productName}"
						readonly="readonly"></td>
					<td><input id="pPrice${status.index}" type="text"
						value="${buyprod.price}" readonly="readonly"></td>
					<td><input type="number" name="pCartCount"
						id="pQuant${status.index}" value="${buyprod.count}"
						onchange="calcGrandTotal('total${status.index}', ${buyprod.price}, 'pQuant${status.index}', ${buyprod.quantity}, this.value)"
						onkeyup="calcGrandTotal('total${status.index}', ${buyprod.price}, 'pQuant${status.index}', ${buyprod.quantity}, this.value)"></td>
					<td>$<input type="text" id="total${status.index}"
						value="${buyprod.price*buyprod.count}" readonly="readonly"></td>
					<td>

						<button type="submit" formaction="DeleteProduct" formmethod="post"
							value="${buyprod.productId}" name="delete" class="btn btn-secondary">Delete</button>
					</td>
				<tr>
					<c:set var="count" value="${param.inCount}"></c:set>
			</c:forEach>
			<%
				if (null == request.getAttribute("errorCart")) {
			%>
			<tr>
				<td></td>
				<td></td>
				<td>Grand Total</td>
				<td>$<input type="text" id="grandTotal" readonly="readonly"
					value="${total}"></td>
			</tr>
			<%
				}
			%>
		</table>

		<%
			if (null == request.getAttribute("errorCart")) {
		%>
		<center>
		<input type="submit" class="btn btn-primary" value="Update Cart">
		<input type="submit" class="btn btn-primary" value="Check Out" formaction="CheckOut.jsp">
		</center>
	</form>

	<%
		}
	%>

	<div style="line-height: 1.0em; height: 1em;"></div>

	
	<div style="color: red; text-align: center;">
		<%
			if (null != request.getAttribute("errorCart")) {
				out.println(request.getAttribute("errorCart"));
			}
		%>
	</div>
	<div style="line-height: 1.0em; height: 1em;"></div>









</body>
</html>