<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Website</title>
<link rel="stylesheet" type="text/css" href="css/content.css">
</head>
<body>
<div class="header">
    <nav>
        <h1>CONTENTCOVE</h1>
    <ul>
        <li><a href="#">HOME</a></li>
        <li><a href="info.jsp">ABOUT</a></li>
        <li><button onclick="window.location.href='home.jsp'">LOGOUT</button></li>
    </ul>
    </nav>
<div class="article-container">
    <div class="article-box">
    <h1>NEW ARTICLES</h1>
    <%
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database connection parameters
            String URL = "jdbc:mysql://localhost:3308/bot";
            String USERNAME = "root";
            String PASSWORD = "karish098@";
            
            // Connect to the database
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            // SQL query to fetch articles
            String sql = "SELECT * FROM articles";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            
            // Display articles
            while(resultSet.next()) {
                %>
                <div class="article">
                    <h2><%= resultSet.getString("title") %></h2>
                    <p><strong>Author:</strong> <%= resultSet.getString("author") %></p>
                    <p><%= resultSet.getString("content") %></p>
                    <form method="post" action="delete.jsp">
                        <input type="hidden" name="articleId" value="<%= resultSet.getInt("id") %>">
                        <input type="submit" value="Delete">
                    </form>
                </div>
                <%
            }
            
            // Close database connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </div>
</div>
</div>
</body>
</html>
