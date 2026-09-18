<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String name =
        (String) session.getAttribute("userName");

    String email =
        (String) session.getAttribute("userEmail");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Home</title>

</head>

<body>

    <h1>Welcome, <%= name %>!</h1>

    <h3>You are successfully logged in.</h3>

    <p>Email: <%= email %></p>

</body>

</html>