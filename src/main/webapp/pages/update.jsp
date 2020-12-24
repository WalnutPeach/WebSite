<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 21.12.2020
  Time: 02:28
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="subject" scope="request" type="model.Subject"/>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setBundle basename="message"/>
<fmt:setLocale value="${cookie['lang'].value}" scope="application"/>

<html>
<head>
    <title><fmt:message key="data.update"/></title>
    <style>
        @import "../bootstrap/css/bootstrap.css";
        @import "../bootstrap/css/bootstrap.min.css";
    </style>
</head>
<body>

<div style="padding: 20px">
    <h1><fmt:message key="data.update"/></h1>
    <div class="row">
        <div class="col-sm-4">
            <form method="post" action="<c:url value="/user/update"/>">

                <input style="visibility: hidden" type="number" name="id" id="id" value="${subject.id}">

                <div align="left">
                    <label class="form-label"><fmt:message key="entity.course"/></label>
                    <input type="text" class="form-control" placeholder=
                    <fmt:message key="entity.course"/> value="${subject.courses}" name="course"
                           id="course" required>
                </div>
                <div align="left">
                    <label class="form-label"><fmt:message key="entity.lecturer"/></label>
                    <select class="form-control" name="lecturer" id="lecturer" required>
                        <c:forEach items="${list}" var="lecturer">
                            <option

                                    <c:if  test="${subject.lecturerId == lecturer.key}">
                                        selected
                                    </c:if>

                                    value="${lecturer.key}">${lecturer.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div align="left">
                    <label class="form-label"><fmt:message key="entity.credits"/></label>
                    <input type="number" class="form-control" placeholder=
                    <fmt:message key="entity.credits"/> value="${subject.credits}" name="credit"
                           id="credit" required>
                </div>

                </br>
                <div align="right">
                    <input type="submit" id="submit" value=
                    <fmt:message key="button.submit"/> name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value=
                    <fmt:message key="button.cancel"/> name="reset" class="btn btn-warning"
                           onclick="location.href='/courses'">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
