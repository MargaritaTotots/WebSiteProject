<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 29.05.2019
  Time: 21:47
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
            <a class="nav-item nav-link" href="/admin">Main</a>
            <a class="nav-item nav-link" href="/rent">Rents</a>
            <a class="nav-item nav-link" href="/managementCars">Cars</a>
            <a class="nav-item nav-link" href="/logout">Logout</a>
        </div>
    </div>
</nav>

<div class="container" style="padding-bottom: 60px;">
    <form:form action="/renteditsave/${rent.id}" commandName="rent" method="post">
        <c:if test="${rent.id > -1}">
            <h1 class="font-weight-bold">Edit Rent</h1>
<div class="bootstrap-iso">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="form-group"> <!-- Date input -->
                    <label class="control-label" for="dateStart">Date Start:</label>
                    <input class="form-control" id="dateStart" name="dateStart" value="${rent.dateStart}" type="date" style="width: 200px"/>
                    <label class="control-label">Date End:</label>
                    <input class="form-control" name="dateEnd"  value="${rent.dateEnd}" type="date" style="width: 200px"/>
                    <label  class="control-label">Status:</label>
                    <input type="text" class="form-control" name="Status" placeholder="" value="${rent.status}" style="width: 200px">
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="form-group"> <!-- Submit button -->
        <button class="btn btn-primary " name="edit" value="Edit"  type="submit" style="width: 80px;">Edit</button>
        <button class="btn btn-primary " name="cancel" value="Cancel"  type="submit" style="width: 80px;">Cancel</button>
    </div>
        </c:if>
    </form:form>

<h1 class="text-center font-weight-bold">Management Of Rents</h1>

<c:if test="${!empty listRents}">
    <table id="myTable" class="table table-bordered table-striped">
        <tr>
            <th width="100">Firstname User</th>
            <th width="100">Lastname User</th>
            <th width="90">Passport</th>
            <th width="120">Mark of Car</th>
            <th width="40">Number of Car</th>
            <th type="date" width="60">Date Start</th>
            <th type="date" width="40">Date End</th>
            <th width="40">Status</th>
            <th width="70">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listRents}" var="rent">
            <tr>
                <td>${rent.user.firstname}</td>
                <td>${rent.user.lastname}</td>
                <td>${rent.user.passport}</td>
                <td>${rent.car.carMarka}</td>
                <td>${rent.car.carNumber}</td>
                <td>${rent.dateStart}</td>
                <td>${rent.dateEnd}</td>
                <td>${rent.status}</td>
                <td><a href="<c:url value='/rentedit/${rent.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/rentremove/${rent.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</div>
<footer>
    <div class="footer"></div>
</footer>
</body>
</html>
