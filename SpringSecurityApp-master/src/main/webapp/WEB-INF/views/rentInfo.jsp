<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 30.05.2019
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a class="nav-item nav-link" href="/admin">Admin</a>
            <a class="nav-item nav-link" href="/logout">Logout</a>
        </div>
    </div>
</nav>


<div class="container" style="width: 300px; margin: auto; padding-top: 40px;">
    <form:form  action="/confirmrentinfo/${pageContext.request.userPrincipal.name}"  >
    <h1 class="text-center font-weight-bold">Confirm Dates</h1>
<div class="bootstrap-iso">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group"> <!-- Date input -->
                        <label class="control-label" for="dateStart">Date Start:</label>
                        <input class="form-control" id="dateStart" name="dateStart" placeholder="DD/MM/YYY" type="date" style="width: 300px"/>
                        <label class="control-label" for="dateEnd">Date End:</label>
                        <input class="form-control" id="dateEnd" name="dateEnd" placeholder="DD/MM/YYY" type="date" style="width: 300px"/>
                    </div>
            </div>
        </div>
    </div>
</div>
    <div class="form-group"> <!-- Submit button -->
        <button class="btn btn-primary " name="confirm"  type="submit" style="width: 160px;border-color: black; background-color: black;">Confirm</button>
    </div>
    </form:form>
</div>
<footer>
    <div class="footer">
    </div>
</footer>
</body>
</html>
