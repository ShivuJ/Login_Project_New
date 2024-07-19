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
            String dbEmail = UserDao.getUserEmail(user);
            String dbPass = UserDao.getUserPassword(user);
            System.out.println("Database email: " + dbEmail);
            System.out.println("Database password: " + dbPass);

            if (dbEmail != null && dbPass != null) {
                if (loginEmail.equals(dbEmail) && loginPass.equals(dbPass)) {
                    session.setAttribute("user", user);
                    response.sendRedirect("welcome.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid%20email%20or%20password");
                }
            } else {
                response.sendRedirect("login.jsp?error=User%20not%20found");
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            throw new RuntimeException(e);
        }
    } else {
        response.sendRedirect("login.jsp?error=Please%20enter%20email%20and%20password");
    }
%>

