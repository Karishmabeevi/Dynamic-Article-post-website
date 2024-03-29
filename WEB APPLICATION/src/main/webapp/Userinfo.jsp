<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Article Website</title>
    <link rel="stylesheet" type="text/css" href="css/User.css">
</head>
<body>
<div class="header">
	<nav>
		<h1>CONTENTCOVE</h1>
	<ul>
		<li><a href="home.jsp">HOME</a></li>
		<li><a href="info.jsp">ABOUT</a></li>
		<li><a href="admin.jsp">ADMIN LOGIN</a></li>
		<li><button onclick="window.location.href='admin.jsp'">LOGOUT</button></li>
	</ul>
	</nav>
    <div class="container">
        <h1>User Information</h1>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phonenumber</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // JDBC Connection parameters
                    String url = "jdbc:mysql://localhost:3308/bot";
                    String user = "root";
                    String password = "karish098@";

                    try {
                        // Load JDBC driver
                        Class.forName("com.mysql.jdbc.Driver");

                        // Establish connection
                        Connection con = DriverManager.getConnection(url, user, password);

                        // Create statement
                        Statement stmt = con.createStatement();

                        // Execute query
                        ResultSet rs = stmt.executeQuery("SELECT*FROM users");

                        // Iterate over the result set and display user information in table rows
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("username") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("password") %></td>
                                <td><%= rs.getString("phonenumber") %></td>
                            </tr>
                <%
                        }

                        // Close resources
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
