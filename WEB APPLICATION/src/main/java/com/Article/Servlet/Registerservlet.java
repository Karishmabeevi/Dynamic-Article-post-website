package com.Article.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/register")
public class Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Username=request.getParameter("Username");
		String Email=request.getParameter("Email");
		String Password=request.getParameter("Password");
		String Phonenumber=request.getParameter("Phonenumber");
		RequestDispatcher dispatcher =null;
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bot","root","karish098@");
			PreparedStatement pst = con.prepareStatement("insert into users(username,email,password,phonenumber) values(?,?,?,?)");
			pst.setString(1,Username);
			pst.setString(2,Email);
			pst.setString(3,Password);
			pst.setString(4,Phonenumber);
			
			int rowCount= pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("articlepost.jsp");
			if(rowCount>0) {
				request.setAttribute("status", "Success");
			}else {
				request.setAttribute("status","failed");
			}
			dispatcher.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}	finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    }
}