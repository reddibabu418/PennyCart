<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Create Account</title>
</head>
<body background="uimage.jpg">

<form action="index.jsp" style="text-align: center;">
			<input type="submit" value="Home" style="display: inline; float: left; margin: 10px;">
		</form>

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
				style="display: inline;" class="btn btn-primary">
		</form>
		<div style="line-height: 1.0em; height: 1em;"></div>

		
	</div>
</body>
</html>