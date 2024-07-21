<%--
  Created by IntelliJ IDEA.
  User: Shivani Jadhav
  Date: 11-07-2024
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<style>
    form{
        margin: 5px;
        padding: 15px;
        width: 50%;
        border: 1px solid black;
        mso-border-shadow: yes;
    }
    input{
        width: 25%;
    }
</style>
<form action="loginUser.jsp" method="post">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="loginEmail">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" name="loginPass">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>
