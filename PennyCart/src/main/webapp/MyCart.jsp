<%@page import="javax.swing.text.Document"%>
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
<title>MyCart</title>
<script type="text/javascript">
/*function calc(val1,val2,val3) 
{
  var price = document.getElementById(val1).value;
  var count = document.getElementById(val2).value;
  document.write(price);
  document.write(count);
  var total = parseFloat(price) * val2;
  if (!isNaN(total))
    document.getElementById(val3).innerHTML = total;
}*/
function total(val1,val2,val3,val4){
	  var price = document.getElementById(val2).value;
	  var count = document.getElementById(val3).value;
	  var prevCount = document.getElementById(val4).value;
	  var numPrice=new Number(price);
	  var numCount=new Number(count);
	  var prevGrandTotal=document.getElementById('grandTotal').value;
	  var prevTotal = (parseInt(price)*parseInt(prevCount));
	  var total = (parseInt(price)*parseInt(count)) ;
	  var grandTotal=(parseInt(prevGrandTotal)-parseInt(prevTotal));
	  
	  
	  var finalTotal=(parseInt(total)+parseInt(grandTotal));
	  
    document.getElementById(val1).value = total;
    document.getElementById(1+val3).value=count;
    document.getElementById('grandTotal').value=finalTotal;

    }
</script>
</head>
<body>
<label style="float: right;"><a href="Logout.jsp">Logout</a></label>

<h3 style="color: #DA621E; padding-top: 50px" align="center">Hello Mr. <%= session.getAttribute("name") %>! Your Cart is here</h3>
<table align="center" style="color: #DA621E;">

	<%
    if(null==request.getAttribute("errorCart"))
    {
	%>
	<tr><th>Product Name</th><th>Price</th><th>Quantity</th><th>Total Price</th></tr>
	<%} %>
<c:forEach var="buyprod" items="${sessionScope.cartList}" varStatus="status">
	<c:set var="total" value="${buyprod.price*buyprod.count+total}"></c:set>

		<input type="hidden" id="prevTotal${status.index}" value="${buyprod.count}">

	<tr>
		<td id="pName${status.index}">${buyprod.productName}</td> 
		<td><input id="pPrice${status.index}" type="text" value="${buyprod.price}" readonly="readonly"></td>
		<td><input type="number" id="pQuant${status.index}" type="text" maxlength="2" min="1" max="${buyprod.quantity}" value="${buyprod.count}" onchange="total('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevTotal${status.index}')" onkeyup="total('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevTotal${status.index}')" onkeydown="total('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevTotal${status.index}')" onselect="total('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevTotal${status.index}')"></td>
		<td>$<input type="text" id="total${status.index}" value="${buyprod.price*buyprod.count}" readonly="readonly"></td>
		<td><form action="DeleteProduct" method="post">
		<button type="submit" name="delete" value="${buyprod.productId}">Delete</button>
        
   		</form></td>
	<tr>
</c:forEach>
<%
    if(null==request.getAttribute("errorCart"))
    {
	%>
<tr><td></td><td></td><td>Grand Total</td><td>$<input type="text" id="grandTotal" readonly="readonly" value="${total}"></td></tr>
<%} %>
</table>

<%
    if(null==request.getAttribute("errorCart"))
    {%>
<form action="UpdateCart" method="post" name="updForm">

<table>

<c:forEach var="updProd" items="${sessionScope.cartList}" varStatus="status">
	<tr>
		<td><input type="hidden" id="1pName${status.index}" name="pCartName" value="${updProd.productName}"></td> 
		<td><input type="hidden" id="1pPrice${status.index}" type="text" value="${updProd.price}" readonly="readonly"></td>
		<td><input type="hidden" name="pCartCount" id="1pQuant${status.index}" type="text" maxlength="2" max="${buyprod.quantity}" value="1" onchange="total('total${status.index}','pPrice${status.index}','pQuant${status.index}')" onkeyup="total('total${status.index}','pPrice${status.index}','pQuant${status.index}')"></td>
		<td><input type="hidden" id="1total${status.index}" value="${updProd.price}" readonly="readonly"></td>
	</tr>
</c:forEach>
</table>

	<div style="padding-left: 45%; font: #DA621E;">
		<input type="submit" value="Update Cart">
	</div>
</form>
<%} %>

<%
    if(null==request.getAttribute("errorCart"))
    {%>
	<form action="CheckOut.jsp" method="get">
	
		<input type="submit" value="Check Out">
	
	</form>
<%} %>
<div style="color:red; text-align: center;">
<%
    if(null!=request.getAttribute("errorCart"))
    {
       	out.println(request.getAttribute("errorCart"));
    }
%>
</div>



</body>
</html>