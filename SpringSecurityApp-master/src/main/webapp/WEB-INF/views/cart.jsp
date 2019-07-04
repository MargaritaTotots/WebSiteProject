<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 30.05.2019
  Time: 16:07
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

<div class="container">
    <h1 class="text-center font-weight-bold">Added Cars</h1>

    <div class="card-deck" style=" padding-bottom: 60px;">
        <div class="row d-inline-flex">
            <c:if test="${!empty listCars}">
                <c:forEach items="${listCars}" var="car">
                    <div class ="col-6 col-sm-4 col-md-3 p-2">
                        <div class="card h-100" style="max-width: 36rem;  padding-bottom: 50px;">
                            <img  class="card-img-top" width="242" height="200" src="/resources/images/${car.imagePath}" alt="Card image cap"/>
                            <div class="card-block">
                                <h2 class="card-title text-center">Car Information</h2>
                                <p class="card-text">
                                    Mark: ${car.carMarka}<br>
                                    Number: ${car.carNumber}<br>
                                    Fullness: ${car.carFullness}<br>
                                    Transmission: ${car.carTransmission}<br>
                                    Cost: ${car.carCost}<br>
                                </p>
                            </div>
                            <div class="form-group">
                            <form action="/cart/rentInfo/${car.id}" method="get">
                                <button class="btn btn-primary " type="submit">Rent</button>
                            </form>
                            <form action="/cart/removeCar/${car.id}" method="get" >
                                <button class="btn btn-primary " type="submit">Remove</button>
                            </form>
                        </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty listCars}">
                <h4 class="text-center font-weight-bold">Empty</h4>
            </c:if>
        </div>
    </div>
</div>
<footer>
    <div class="footer"></div>
</footer>
</body>
</html>
