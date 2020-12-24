<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 19.12.2020
  Time: 23:40
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
    <h2>Hello JSP</h2>

    <%@ page import="java.util.Date" %>
    <%@ page import="logic.BusinessLogic" %>
    <% Date now = new Date(); %>
    <%= now %>

    <%
        String name = (String)session.getAttribute("current_user");
        if (name != null) {
            out.println("<div><b>Hello, " + name + "</b></div>");
        }
    %>

    <% for (int i=0; i<10; i++) {
        out.println("<p>" + "Loop number is: " + i + "</p>");
    }%>

    <%
        BusinessLogic bl = new BusinessLogic();
        out.println("<div><b>" + bl.getString() + "</b></div>");
    %>
</body>
</html>
