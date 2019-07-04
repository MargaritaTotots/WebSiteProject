<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 02.07.2019
  Time: 4:52
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
    <title>Rents Page</title>

    <style type="text/css">
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


        .navbar {
            overflow: hidden;
            background-color: #333;
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

        .footer a {
            float: left;
        }
    </style>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>

<br/>
<br/>

<nav class="navbar" >
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link"   href="index.jsp">Home </a>
            <a class="nav-item nav-link" href="/carscommon">Cars</a>
            <a class="nav-item nav-link" href="/rent">Rent</a>
            <a class="nav-item nav-link" href="/cars/addCar">Add Car</a>
            <a class="nav-item nav-link" href="#">Contacts</a>
            <div class="navbar-right">
                <a class="nav-item nav-link" href="/login">Login</a>
            </div>
        </div>
    </div>
</nav>

<form >
<div class="bootstrap-iso">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="form-group"> <!-- Date input -->
                    <label class="control-label" for="dateStart">Date</label>
                    <input class="form-control" id="dateStart" name="dateStart" placeholder="DD/MM/YYY" type="text"/>
                    <label class="control-label" for="dateEnd">Date End:</label>
                    <input class="form-control" id="dateEnd" name="dateEnd" placeholder="DD/MM/YYY" type="text" style="width: 200px"/>
                    <label class="control-label" for="Status">Status:</label>
                    <input class="form-control" id="Status" name="Status" type="text" style="width: 200px"/>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="form-group"> <!-- Submit button -->
        <button class="btn btn-primary " name="confirm"  type="submit" style="width: 160px;color: black;">Confirm</button>
    </div>
</form>
<footer>
    <div class="footer"></div>
</footer>

</body>
</html>

