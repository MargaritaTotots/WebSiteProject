<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 31.05.2019
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cars</title>
    <style>
        body {
            width:100%;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #ddd;
        }

        .container{
            width: 930px;
            border: 10px;
            margin:0 auto;
        }


        nav {
            overflow: hidden;
            background-color: #333;
        }

        nav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        nav a.active {
            background-color: #4CAF50;
            color: white;
        }

        .navbar-right {
            float: right;
        }

        .HomeHeader{
            background-image: url(../resources/images/car22222.jpg);
            height: 650px;
            width: auto;
            margin-bottom: 180px;
        }


        .text{
            text-align: center;
            position: absolute;
            transform: translate(60%, 19%);
            font-size: 40px;
            color: whitesmoke;
        }

        .headertext{
            text-align: center;
            position: absolute;
            top: 18%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 40px;
            color: white;
        }

        .button{
            background-color: #ddd;
            color: #000;
            font-size: 24px;
            border-radius: 5px;
            font-weight: bold;
            width: 160px;
            text-transform: uppercase;
            padding: 10px 0px;
            display: block;
            margin: 0 auto;
            text-decoration: none;
            text-align: center;
        }


        .button:hover {
            background-color: #555;
            color: white;
        }

        .introduction{
            margin-top: 45px;
            font-style: oblique;
            font-size: 23px;
        }

        p{
            margin-top: 45px;
            font-size: 23px;
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

        .footer a {
            float: left;
        }
    </style>
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-datetimepicker.css" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/jquery-3.3.1.js"></script>
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        function sort() {
            jQuery("form input[name=signal]").val("sort");
            jQuery("form").submit();
        }

        function reset() {
            jQuery("form input[name=signal]").val("reset");
            jQuery("form").submit();
        }
        $(document).ready(function(){
            var date_input=$('input[name="dateStart"]'); //our date input has the name "date"
            var date_output=$('input[name="dateEnd"]');
            var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
            var options={
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
                startDate: '0m',
                endDate: '+2m'
            };
            date_input.datepicker(options);
            date_output.datepicker(options);
        })
    </script>
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


<div class="container">
    <h1 class="text-center font-weight-bold">Cars</h1>
    <form:form  action="/sort" method="post">

        <div class="form-inline" style="padding-bottom: 30px; ">

            <select name = "mark" class="form-control" style="width: 160px;">
                <option selected>Mark</option>
                <c:forEach items="${marks}" var="mark">
                    <option value=${mark}>${mark}</option>
                </c:forEach>
            </select>

            <select name="transmission" class="form-control" style="width: 160px;">
                <option selected>Transmission</option>
                <c:forEach items="${transmissions}" var="transmission">
                    <option value=${transmission}>${transmission}</option>
                </c:forEach>
            </select>

            <select name = "fullness" class="form-control" style="width: 160px;">
                <option selected>Fullness</option>
                <c:forEach items="${fullnesses}" var="fullness">
                    <option value = ${fullness}>${fullness}</option>
                </c:forEach>
            </select>

            <select name="cost" class="form-control" style="width: 160px;">
                <option selected>Cost From</option>
                <option value="100">100</option>
                <option value="200">200</option>
                <option value="200">300</option>
            </select>

            <select name="cost" class="form-control" style="width: 160px;">
                <option selected>Cost To</option>
                <option value="100">200</option>
                <option value="200">300</option>
                <option value="200">400</option>
            </select>
            <div class="form-group"> <!-- Submit button -->
                <button class="btn btn-primary " name="sort" onclick="sort()" type="submit" style="width: 160px;color: black;">Sort</button>
                <button class="btn btn-primary " name="reset" onclick="reset()" type="submit" style="width: 160px;color: black;">Reset</button>
            </div>
        </div>
    </form:form>
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
                            <a href="/addCart/${car.id}"><button type="button" class="btn btn-success">Add to cart</button></a>
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

</body>
</html>