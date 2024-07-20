<%--
  Created by IntelliJ IDEA.
  User: Shivani Jadhav
  Date: 16-07-2024
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.loginProjectNew.UserDao" %>
<%@ page import="com.example.loginProjectNew.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page session="true" %> <!-- Ensure session management is enabled -->
<jsp:useBean id="u" class="com.example.loginProjectNew.User" scope="request"/>
<jsp:setProperty property="*" name="u"/>

<%
    String loginEmail = request.getParameter("loginEmail");
    String loginPass = request.getParameter("loginPass");

    if (loginEmail != null && loginPass != null) {
        User user = new User(loginEmail, loginPass);
        System.out.println("Login attempt for: " + loginEmail);

        try {
            // Retrieve email and password from the database for the given user
            String dbEmail = UserDao.getUserEmail(user);
            String dbPass = UserDao.getUserPassword(user);
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
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            response.sendRedirect("login.jsp?error=Database%20connection%20error");
        }
    } else {
        response.sendRedirect("login.jsp?error=Please%20enter%20email%20and%20password");
    }
%>
