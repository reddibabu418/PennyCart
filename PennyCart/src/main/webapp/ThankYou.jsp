<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you</title>
</head>
<body style="background-image: url('uimage.jpg');background-size: contain;background-repeat: no-repeat;background-size: cover;">
<label style="float: right;"><a href="Logout.jsp">Logout</a></label>
<h3 style="color: green; padding-top: 50px" align="center">Your Payment is Successful! Thank you for shopping with us  Mr. <%= session.getAttribute("name") %>!</h3>
<form action="Shopping.jsp">
	<center><input type="submit" value="Back to Store" style="align-items: center;justify-content: center;"></center>
</form>
</body>
</html>