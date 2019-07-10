<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body
	style="background-image: url('uimage.jpg'); background-size: contain; background-repeat: no-repeat; background-size: cover;">
	<h1 style="color: #DA621E; padding-top: 50px" align="center">Welcome
		to PennyMart</h1>
	<br>
	<h2 style="color: #DA621E;" align="center">Login</h2>
	<form action="PennyMartLogin" method="GET" style="text-align: center;">
		<table style="margin-left: 40%; margin-right: 0%;">
			<tr style="text-align: left; color: #DA621E;">
				<td>UserName</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr style="text-align: left; color: #DA621E;">
				<td>Password</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr style="text-align: left; color: #DA621E;">
				<td></td>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>

		</table>

	</form>
	<div style="color: red">
		<%
			if (null != request.getAttribute("errorMessage")) {
				out.println(request.getAttribute("errorMessage"));
			}
		%>
	</div>
</body>
</html>