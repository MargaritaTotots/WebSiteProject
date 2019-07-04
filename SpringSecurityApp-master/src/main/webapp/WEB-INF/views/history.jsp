<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 02.07.2019
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            width:100%;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #ddd;
        }

        .navbar {
            overflow: hidden;
            background-color: #333;
            padding: -10px;
        }

        .navbar a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        .navbar-right {
            float: right;
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .footer {
            position:fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 50px;
            background-color: #333;
            color: #fff;

        }

    </style>
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-datetimepicker.css" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/jquery-3.3.1.js"></script>
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

</head>
<body>
<nav class="navbar" >
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="/welcome">Cars</a>
            <a class="nav-item nav-link" href="/history/${pageContext.request.userPrincipal.name}">Rent History</a>
            <a class="nav-item nav-link" href="/cart">Cart</a>
            <a class="nav-item nav-link" href="/logout">Logout</a>
        </div>
    </div>
</nav>

<div class="container" style="padding-bottom: 60px;">
    <h1 class="text-center font-weight-bold">History Of Rents</h1>

    <c:if test="${!empty listRents}">
        <table id="myTable" class="table table-bordered table-striped">
            <tr>
                <th width="120">Mark of Car</th>
                <th width="40">Number of Car</th>
                <th type="date" width="60">Date Start</th>
                <th type="date" width="40">Date End</th>
                <th width="40">Total</th>
                <th width="70">Actions</th>
            </tr>
            <c:forEach items="${listRents}" var="rent">
                <tr>
                    <td>${rent.car.carMarka}</td>
                    <td>${rent.car.carNumber}</td>
                    <td>${rent.dateStart}</td>
                    <td>${rent.dateEnd}</td>
                    <td>${rent.total}</td>
                    <c:if test="${rent.status.equals('Rent')}">
                    <td ><a href="<c:url value='/historyreturn/${rent.id}'/>">Return</a></td>
                    </c:if>
                    <c:if test="${rent.status.equals('Allowed')}">
                    <td><a href="<c:url value='/historyrent/${rent.id}'/>">Rent</a></td>
                    </c:if>
                    <c:if test="${rent.status.equals('Returned')}">
                        <td>Returned</td>
                    </c:if>
                    <c:if test="${rent.status.equals('Request')}">
                        <td>Request for rent</td>
                    </c:if>
                    <c:if test="${rent.status.equals('Denied')}">
                        <td>Denied</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty listRents}">
        <h4 class="text-center font-weight-bold">Empty</h4>
    </c:if>
</div>
<footer>
    <div class="footer"></div>
</footer>

</body>
</html>
