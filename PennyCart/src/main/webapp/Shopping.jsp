<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PennycartShopping</title>
</head>
<body style="background-image: url('uimage.jpg');background-size: contain;background-repeat: no-repeat;background-size: cover;">
<label style="float: right;"><a href="Logout.jsp">Logout</a></label>
<h3 style="color: #DA621E; padding-top: 50px" align="center">Choose the items from below list and Enjoy your shopping Mr. <%= session.getAttribute("name") %>!</h3>

<form action="ProductServlet" method="GET">
	<div style="padding-left: 45%; font: #DA621E;">
	<input type="submit" value="ViewProducts">
	</div>
</form>

<div style="color:red">
<%
    if(null!=request.getAttribute("errorCart"))
    {
       	out.println(request.getAttribute("errorCart"));
    }
%>
</div>

<div style="color:red">
<%
    if(null!=request.getAttribute("errorMessage"))
    {
       	out.println(request.getAttribute("errorMessage"));
    }
%>
</div>

<form method="post" action="Cart">
<table align="center" style="color: #DA621E;">
	<% String s=":"; %>
	<%
		if(session.getAttribute("productsList")!=null){
	%>
	<tr><td></td><th>Products</th><th>Price</th></tr>
	<%} %>
	<c:forEach items="${sessionScope.productsList}" var="product" varStatus="status">
		<tr>
		<td><input type="checkbox" name="checkButton" value="${product.toString()}"></td>
		<td><c:out value="${product.productName}"></c:out>	</td>
		<td><c:out value="${product.price}"></c:out>	</td>
		</tr>	
	</c:forEach>
</table>
<%
		if(session.getAttribute("productsList")!=null){
	%>
<div style="padding-left: 45%; font: #DA621E;">

<input type="submit" value="Add to Cart">
</div>
	<%} %>


</form>
<form action="ViewCart" method="post" style="">
	<input type="submit" value="ViewCart">
</form>
</body>
</html>