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

<%
    System.out.println("Page Loaded");
    String loginEmail = request.getParameter("loginEmail");
    String loginPass = request.getParameter("loginPass");

    if (loginEmail != null && loginPass != null) {
        User user = new User(loginEmail, loginPass);
        System.out.println("Login attempt for: " + loginEmail);

        String dbEmail = null;
        String dbPass = null;
        try {
            dbEmail = UserDao.getUserEmail(user);
            dbPass = UserDao.getUserPassword(user);
            System.out.println("Database email: " + dbEmail);
            System.out.println("Database password: " + dbPass);
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        // Compare provided credentials with those retrieved from the database
        if (loginEmail.equals(dbEmail) && loginPass.equals(dbPass)) {
            System.out.println("Login successful for: " + loginEmail);
            session.setAttribute("user", user);
            response.sendRedirect("welcome.jsp");
        } else {
            System.out.println("Invalid email or password");
            response.sendRedirect("loginError.jsp");
        }
    } else {
        System.out.println("Email or password is null");
        response.sendRedirect("login.jsp?error=Please%20enter%20email%20and%20password");
    }
%>
