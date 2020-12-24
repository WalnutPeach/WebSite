<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 20.12.2020
  Time: 04:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import "../styles/main.css";
    </style>
</head>
<body>

    <h1>COUNTER</h1>
    <h3>You visit this page </h3> <h2><%=request.getParameter("c")%></h2><h3> times</h3>

</body>
</html>
