<%--
  Created by IntelliJ IDEA.
  User: Shivani Jadhav
  Date: 11-07-2024
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.loginProjectNew.UserDao" %>
<%@ page import="com.example.loginProjectNew.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.logging.Logger" %>

<%
    Logger logger = Logger.getLogger("RegisterJSP");
    logger.info("Starting registration process");

    User u = new User(request.getParameter("username"), request.getParameter("password"), request.getParameter("email"));

    try {
        logger.info("Saving user: " + u.getName());
        int i = UserDao.save(u);
        if (i > 0) {
            logger.info("User saved successfully");
            response.sendRedirect("register-success.jsp");
        } else {
            logger.warning("User not saved");
        }
    } catch (SQLException e) {
        logger.severe("SQL Exception: " + e.getMessage());
        throw new RuntimeException(e);
    }
%>

