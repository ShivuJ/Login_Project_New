<%--
  Created by IntelliJ IDEA.
  User: Shivani Jadhav
  Date: 21-07-2024
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.loginProjectNew.UserDao" %>
<%@ page import="com.example.loginProjectNew.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page session="true" %> <!-- Ensure session management is enabled -->

<%
    System.out.println("Tried Login");
    String loginEmail = request.getParameter("loginEmail");
    String loginPass = request.getParameter("loginPass");

    if (loginEmail != null && loginPass != null) {
        User user = new User(loginEmail, loginPass);
        System.out.println("Login attempt for: " + loginEmail);
        String dbEmail;
        String dbPass;
        try {
            dbEmail = UserDao.getUserEmail(user);
            dbPass = UserDao.getUserPassword(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Retrieve email and password from the database for the given user

        System.out.println("Database email: " + dbEmail);
        System.out.println("Database password: " + dbPass);

        // Compare provided credentials with those retrieved from the database
        if (loginEmail.equals(dbEmail) && loginPass.equals(dbPass)) {
            System.out.println("Login successful for: " + loginEmail);
            session.setAttribute("user", user);
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid%20email%20or%20password");
        }
    } else {
        response.sendRedirect("login.jsp?error=Please%20enter%20email%20and%20password");
    }
%>

