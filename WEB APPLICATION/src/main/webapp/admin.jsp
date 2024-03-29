<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Website</title>
<link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
<div class="header">
	<nav>
		<h1>CONTENTCOVE</h1>
	<ul>
		<li><a href="home.jsp">HOME</a></li>
		<li><a href="info.jsp">ABOUT</a></li>
		<li><a href="admin.jsp">ADMIN LOGIN</a></li>
		<li><button onclick="window.location.href='register.jsp'">TRY IT NOW</button></li>
	</ul>
	</nav>
	<div class="form-box">
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btn" onclick="login()">ADMIN LOGIN</button>
		</div>
		<form id="login" method="post" action="admin" class="input-group">
			<label for="username">Username:</label>
			<input type="text" name="Username" id="username" class="input-field" placeholder="Username" required>
			<label for="password">Password:</label>
			<input type="password" name="Password" id="password" class="input-field" placeholder="Password" required>
			<input type="checkbox" class="chech-box"><span>Remember password</span>
			<button type="Submit" class="submit-btn">LOGIN</button>
		</form>
		<p id="error-message">${errorMessage}</p>
	</div>
</div>
</body>
</html>