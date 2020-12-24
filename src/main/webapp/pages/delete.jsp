<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 21.12.2020
  Time: 03:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Integer id = Integer.valueOf(request.getParameter("id"));
    Connection connection;
    PreparedStatement pst;
    ResultSet resultSet;

    try {
        Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/webdb", "postgres", "9551");
        pst = connection.prepareStatement("delete from subjects where id = ?");
        pst.setInt(1, id);
        pst.executeUpdate();
        connection.close();

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    response.sendRedirect("/courses");
%>

<html>
<head>
    <title>Deleting...</title>
</head>
<body>

</body>
</html>
