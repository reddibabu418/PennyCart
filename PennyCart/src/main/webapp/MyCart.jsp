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

function total(val1,val2,val3,val4){
	  var price = document.getElementById(val2).value;
	  var count = parseInt(document.getElementById(val3).value);
	  if(!isNaN(count)){
		  var prevCount = parseInt(document.getElementById(val4).value);
		  var numPrice=new Number(price);
		  var numCount=new Number(count);
		  var prevGrandTotal=document.getElementById('grandTotal').value;
		  var prevTotal = (parseInt(price)*parseInt(prevCount));
		  var total = (parseInt(price)*parseInt(count)) ;
		  var grandTotal=(parseInt(prevGrandTotal)-parseInt(prevTotal));
		  
			  var diff=(parseInt(count)-parseInt(prevCount));
			  var newTotal=(parseInt(diff)*parseInt(price));
		  
			   /* document.getElementById('grandTotal').value=prevCount;

			  var diff=(parseInt(prevCount)-parseInt(count));

			  var newTotal=(parseInt(diff)*parseInt(price)); */
		  
		  
		  
		  var finalTotal=(parseInt(newTotal)+parseInt(prevGrandTotal));
		  
	    document.getElementById(val1).value = total;
	    document.getElementById(1+val3).value=count;
	    document.getElementById('grandTotal').value=finalTotal;
	  }
    }
 function assignCount(val1,val2){
	  var count = parseInt(document.getElementById(val1).value);

	 	document.getElementById(val2).value = count;
	  
}
 function calcGrandTotal(val1,val2,val3,val4,val5){
	 total(val1,val2,val3,val4);
	 assignCount(val3,val4);
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
	
		<c:set var="count" value="${buyprod.count}"></c:set>

		<input type="hidden" id="prevCount${status.index}" value="${count}">
		



	<tr>
		<td id="pName${status.index}">${buyprod.productName}</td> 
		<td><input id="pPrice${status.index}" type="text" value="${buyprod.price}" readonly="readonly"></td>
		<td><input type="number" name="inCount" id="pQuant${status.index}" type="text" maxlength="2" min="1" max="${buyprod.quantity}" value="${buyprod.count}" onchange="calcGrandTotal('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevCount${status.index}','${buyprod.quantity}')" onkeyup="calcGrandTotal('total${status.index}','pPrice${status.index}','pQuant${status.index}','prevCount${status.index}','${buyprod.quantity}')" ></td>
		<td>$<input type="text" id="total${status.index}" value="${buyprod.price*buyprod.count}" readonly="readonly"></td>
		<td><form action="DeleteProduct" method="post">
		<input type="hidden" name="delete" value="${buyprod.productId}">
		<input type="submit" value="Delete">        
   		</form></td>
	<tr>
				<c:set var="count" value="${param.inCount}"></c:set>
	
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
		<td><input type="hidden" id="1total${status.index}" value="${updProd.price*updProd.count}" readonly="readonly"></td>
	</tr>
</c:forEach>
</table>

	<div style="padding-left: 45%; font: #DA621E;">
		<input type="submit" value="Update Cart">
	</div>
</form>
<%} %>

<div style="line-height: 1.0em; height: 1em;"></div>

<%
    if(null==request.getAttribute("errorCart"))
    {%>
	<form action="CheckOut.jsp" method="get">
	
		<center><input type="submit" value="Check Out"></center>
	
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
<div style="line-height: 1.0em; height: 1em;"></div>

<div style="">


	<form action="Shopping.jsp">
	
	<div style="">
	
	
	<center><input type="submit" value="Back to Shopping"></center>
	
	</div>
	
	</form>


</div>



</body>
</html>