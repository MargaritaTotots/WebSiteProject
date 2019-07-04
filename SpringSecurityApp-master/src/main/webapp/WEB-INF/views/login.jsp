<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>
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
            width: 100%;
            height: 50px;
            background-color: #333;
        }

        nav a{
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

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>

<nav class="navbar" >
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link"   href="index.jsp">Home </a>
            <a class="nav-item nav-link" href="/carscommon">Cars</a>
            <a class="nav-item nav-link" href="/login">Login</a>
        </div>
    </div>
</nav>


<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button style="background-color: #333" class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
            <h4 style="color: #333" class="text-center"><a style="color: #333" href="${contextPath}/registration">Create an account</a></h4>
        </div>

    </form>

</div>
<footer>
    <div class="footer"></div>
</footer>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!-- /container -->
</body>
</html>