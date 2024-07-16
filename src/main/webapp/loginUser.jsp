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
<%@ page import="java.util.logging.Logger" %>
<jsp:useBean id="u" class="com.example.loginProjectNew.User"/>
<jsp:setProperty property="*" name="u"/>

<%
    String loginEmail = request.getParameter("loginEmail");
    String loginPass = request.getParameter("loginPass");

    if (u.getEmail().equals(loginEmail) && u.getPassword().equals(loginPass)) {
        User user = new User(loginEmail, loginPass);

        try {
            int i = UserDao.getUser(user);
            if(i > 0){
                response.sendRedirect("welcome.jsp");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
%>
