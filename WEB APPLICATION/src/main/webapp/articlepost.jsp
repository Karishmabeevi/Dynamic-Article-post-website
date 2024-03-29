<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Website</title>
<link rel="stylesheet" type="text/css" href="css/article.css">
</head>
<body>
<div class="header">
	<nav>
		<h1>CONTENTCOVE</h1>
	<ul>
		<li><a href="#">HOME</a></li>
		<li><a href="info.jsp">ABOUT</a></li>
		<li><button onclick="window.location.href='article.jsp'">ARTICLE POST</button></li>
	</ul>
	</nav>
<div class="container">
        <h1>Create Article</h1>
        <form action="CreateArticleServlet" method="post">
            <label for="author">Author Name:</label>
            <input type="text" id="author" name="author" required>
       
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="content">Content:</label>
            <textarea id="content" name="content" required></textarea>
            
            <input type="submit" value="Submit">
        </form>
</div>
</div>
</body>
</html>
