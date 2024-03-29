<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
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
    
    // Get article ID from request
    int articleId = Integer.parseInt(request.getParameter("articleId"));
    
    // SQL query to delete the article
    String sql = "DELETE FROM articles WHERE id = ?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setInt(1, articleId);
    
    // Execute the delete operation
    int rowsDeleted = statement.executeUpdate();
    
    // Close database connection
    conn.close();
    
    // Redirect back to the page displaying articles
    response.sendRedirect("article.jsp");
    
} catch (Exception e) {
    e.printStackTrace();
    // Handle any errors that occur during the deletion process
    // You can display an error message or redirect to an error page
    // Example:
    // response.sendRedirect("error.jsp");
}
%>
