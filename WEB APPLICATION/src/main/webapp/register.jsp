<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Website</title>
<link rel="stylesheet" type="text/css" href="css/Register.css">
</head>
<body>
<div class="header">
	<nav>
		<h1>CONTENTCOVE</h1>
	<ul>
		<li><a href="home.jsp">HOME</a></li>
		<li><a href="info.jsp">ABOUT</a></li>
		<li><a href="admin.jsp">ADMIN LOGIN</a></li>
		<li><a href="login.jsp">LOGIN</a></li>
		<li><button>REGISTER NOW</button></li>
	</ul>
	</nav>
	<div class="form-box">
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btn" onclick="register()">REGISTER</button>
		</div>
		<form id="login" method="post" action="register" class="input-group">
			<label for="username">Username:</label>
			<input type="text" name="Username" id="username" class="input-field" placeholder="Username" required>
			<label for="email">Email:</label>
			<input type="email" name="Email" id="email" class="input-field" placeholder="Email" required>
			<label for="password">Password:</label>
			<input type="password" name="Password" id="password" class="input-field" placeholder="Password" required>
			<label for="phonenumber">Phone Number:</label>
			<input type="text" name="Phonenumber" id="phonenumber" class="input-field" placeholder="Phonenumber" required>
			<input type="checkbox" class="chech-box"><span>I agree to the terms and conditions</span>
			<button type="Submit" class="submit-btn">REGISTER</button>
		</form>
	</div>
</div>
</body>
</html>