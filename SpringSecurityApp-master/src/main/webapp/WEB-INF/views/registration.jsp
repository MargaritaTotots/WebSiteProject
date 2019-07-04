<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>
    <style>
        body {
            width:100%;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #ddd;
        }

        /*main-form{
            width: 100px;
            height: 100px;
        }*/

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

        .navbar-right{
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
            <a class="nav-item nav-link" href="/rent">Rent</a>
            <a class="nav-item nav-link" href="#">Contacts</a>
            <div class="navbar-right">
                <a class="nav-item nav-link" href="/login">Log Out</a>
            </div>
        </div>
    </div>
</nav>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="main-form" cssStyle="width: 300px; margin: auto; padding-bottom: 60px;">
        <h2 class="form-signin-heading">Create your account</h2>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:label path="firstname">Firstname: </form:label>
                        <form:input type="text" path="firstname" class="form-control" placeholder="Firstame" autofocus="true"></form:input>
                        <form:errors path="firstname" cssStyle="color: red;"></form:errors>
                    </div>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Lastname: </form:label>
                <form:input type="text" path="lastname" class="form-control" placeholder="Lastname"></form:input>
                <form:errors path="lastname" cssStyle="color: red;"></form:errors>
            </div>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Birth: </form:label>
                <form:input type="date" path="birth" class="form-control" ></form:input>
                <form:errors path="birth" cssStyle="color: red;"></form:errors>
            </div>

            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Passport: </form:label>
                <form:input type="text" path="passport" class="form-control" placeholder="Passport"></form:input>
                <form:errors path="passport" cssStyle="color: red;"></form:errors>
            </div>

            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Username: </form:label>
                <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"></form:input>
                <form:errors path="username" cssStyle="color: red;"></form:errors>
            </div>


            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Password: </form:label>
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password" cssStyle="color: red;"></form:errors>
            </div>

            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="firstname">Confirm password: </form:label>
                <form:input type="password" path="confirmPassword" class="form-control" placeholder="Confirm your password"></form:input>
                <form:errors path="confirmPassword" cssStyle="color: red;"></form:errors>
            </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: black; border-color: black;">Submit</button>
    </form:form>

</div>
<footer>
    <div class="footer"></div>
</footer>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>