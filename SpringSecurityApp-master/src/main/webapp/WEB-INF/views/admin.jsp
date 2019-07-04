<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>
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

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
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

<div class="container">
    <h1 class="text-center font-weight-bold">Cars</h1>
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
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</div>

<footer>
    <div class="footer"></div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>