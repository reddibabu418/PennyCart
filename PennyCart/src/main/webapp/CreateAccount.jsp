<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body background="uimage.jpg">
	<h1 style="color: #DA621E; padding-top: 50px" align="center">Welcome
		to PennyMart</h1>
	<br>
	<h2 style="color: #DA621E;" align="center">Create Account</h2>
	<div>
		<form action="CreateAccount" method="GET" style="text-align: center;">
			<table style="margin-left: 25%; margin-right: 25%;">
				<tr style="text-align: left; color: #DA621E;">
					<td>Full Name</td>
					<td><input type="text" name="fullname" required></td>
				</tr>
				<tr style="text-align: left; color: #DA621E;">
					<td>Mobile Number</td>
					<td><input type="text" name="mobilenumber" required></td>
				</tr>
				<tr style="text-align: left; color: #DA621E;">
					<td>Email</td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr style="text-align: left; color: #DA621E;">
					<td>UserName</td>
					<td><input type="text" name="uname" required></td>
				</tr>
				<tr style="text-align: left; color: #DA621E;">
					<td>Password</td>
					<td><input type="password" name="pwd" required></td>
				</tr>

			</table>
			<input type="submit" name="submit" value="Submit"
				style="display: inline;">
		</form>
		<div style="line-height: 1.0em; height: 1em;"></div>

		<form action="index.jsp" style="text-align: center;">
			<input type="submit" value="Home" style="display: inline;">
		</form>
	</div>
</body>
</html>