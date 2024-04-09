package com.Article.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteArticleServlet")
public class DeleteArticleServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the article id to delete
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        
        // Database connection parameters
        String URL = "jdbc:mysql://localhost:3308/bot";
        String USERNAME = "root";
        String PASSWORD = "karish098@";
        
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the database
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            // SQL query to delete the article
            String sql = "DELETE FROM articles WHERE id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, articleId);
            
            // Execute the deletion query
            statement.executeUpdate();
            
            // Close database connection
            conn.close();
            
            // Redirect back to the article list page
            response.sendRedirect("article.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
