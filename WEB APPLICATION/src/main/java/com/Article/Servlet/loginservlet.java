package com.Article.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        if (validateUser(Username, Password)) {
            // Redirect to welcome page
            response.sendRedirect("articlepost.jsp");
        } else {
            // Show error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean validateUser(String Username, String Password) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/bot", "root", "karish098@")) {
            String query = "SELECT * FROM users WHERE username=? AND password=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, Username);
                preparedStatement.setString(2, Password);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    return resultSet.next(); // If a row is returned, user exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}