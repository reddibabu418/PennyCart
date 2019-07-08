<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.pennycart.model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase</title>
<script type="text/javascript">

function calc(val1,val2,val3) 
{
  var price = document.getElementById(val1).value;
  var count = document.getElementById(val2).value;
  document.write(price);
  document.write(count);

  var total = parseFloat(price) * val2;

  if (!isNaN(total))
    document.getElementById(val3).innerHTML = total;
}
function total(val1,val2,val3){
	  var price = document.getElementById(val2).value;
	  var count = document.getElementById(val3).value;
	  var numPrice=new Number(price);
	  var numCount=new Number(count);

	  var total = (parseInt(price)*parseInt(count));

    document.getElementById(val1).value = total;

}
</script>
</head>
<body>
<h3 style="color: #DA621E; padding-top: 50px" align="center">Hello Mr. <%= session.getAttribute("name") %>! Your Cart is here</h3>
<table align="center" style="color: #DA621E;">
<tr><th>Product Name</th><th>Price</th><th>Quantity</th><th>Total Price</th></tr>
<c:forEach var="buyprod" items="${paramValues.checkButton}" varStatus="status">
	<tr>
		<td id="pName${status.index}">${sessionScope.productsList[buyprod-1].productName}</td> 
		<td><input id="pPrice${status.index}" type="text" value="${sessionScope.productsList[buyprod-1].price}" readonly="readonly"></td>
		<td><input type="number" id="pQuant${status.index}" type="text" maxlength="2" max="${sessionScope.productsList[buyprod-1].quantity}" value="1" onchange="total('total${status.index}','pPrice${status.index}','pQuant${status.index}')" onkeyup="total('total${status.index}','pPrice${status.index}','pQuant${status.index}')"></td>
		<td>$<input type="text" id="total${status.index}" value="${sessionScope.productsList[buyprod-1].price}" readonly="readonly"></td>
	<tr>
</c:forEach>
</table>
</body>
</html>