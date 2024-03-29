package com.Article.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class adminservlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Connect to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bot", "root", "karish098@");

            PreparedStatement ps = con.prepareStatement("select * from admins where username=? and password=?");
            ps.setString(1, Username);
            ps.setString(2, Password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("username", Username);
                response.sendRedirect("Userinfo.jsp"); // Redirect to admin home page after successful login
            } else {
                // Failed login
                String errorMessage = "Invalid username or password. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
