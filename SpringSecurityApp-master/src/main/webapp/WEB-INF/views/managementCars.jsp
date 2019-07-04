<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 31.05.2019
  Time: 7:20
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

        .HomeHeader{
            background-image: url(../resources/images/car22222.jpg);
            height: 650px;
            width: auto;
            margin-bottom: 180px;
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

<h1 class="text-center font-weight-bold">Management Of Cars</h1>
<div class="container center-block">
<c:url var="addAction" value="/addcar"/>

<form:form action="/editsave/${car.id}" method="post" commandName="car" enctype="multipart/form-data">
    <c:if test="${car.id > -1}">
    <c:if test="${!empty car.carMarka}">
        <h2 style="padding-left: 120px; padding-bottom: 30px;">Edit car</h2>

    <div class="form-group row">
        <label for="mark" class="col-sm-2 col-form-label">Mark:</label>
        <div class="col-sm-10">
            <input type="text"  name="carMark" class="form-control" value="${car.carMarka}"   placeholder="" style="width: 200px;">
        </div>
    </div>

    <div class="form-group row">
        <label for="Number" class="col-sm-2 col-form-label">Number:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" value="${car.carNumber}" name="carNumber" placeholder="" style="width: 200px;">
        </div>
    </div>

    <div class="form-group row">
        <label for="Transmission" class="col-sm-2 col-form-label">Transmission:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" value="${car.carTransmission}" name="carTransmission" placeholder="" style="width: 200px;">
        </div>
    </div>

    <div class="form-group row">
        <label for="Fullness" class="col-sm-2 col-form-label">Fullness:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" value="${car.carFullness}" name="carFullness" placeholder="" style="width: 200px;">
        </div>
    </div>

    <div class="form-group row">
        <label for="Cost" class="col-sm-2 col-form-label">Cost:</label>
        <div class="col-sm-10">
            <input type="number" class="form-control" value="${car.carCost}" name="carCost" placeholder="" style="width: 200px;">
        </div>
    </div>

    <div class="custom-file" style="padding-bottom: 30px;">
        <input type="file" name="file"  class="custom-file-input" value="${car.imagePath}"/>
    </div>
        <input type="submit" value="<spring:message text="Edit Car"/>"/>
    </c:if>
</c:if>
</form:form>

    <form:form action="${addAction}" commandName="car" enctype="multipart/form-data">
    <c:if test="${empty car.carMarka}">

        <h2 style="padding-left: 120px; padding-bottom: 30px;">Add car</h2>

        <div class="form-group row">
            <label for="Mark" class="col-sm-2 col-form-label">Mark:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="Mark" name="Mark" placeholder="" style="width: 200px;">
            </div>
        </div>

        <div class="form-group row">
            <label for="Number" class="col-sm-2 col-form-label">Number:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="Number" name="Number" placeholder="" style="width: 200px;">
            </div>
        </div>

        <div class="form-group row">
            <label for="Transmission" class="col-sm-2 col-form-label">Transmission:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="Transmission" name="Transmission" placeholder="" style="width: 200px;">
            </div>
        </div>

        <div class="form-group row">
            <label for="Fullness" class="col-sm-2 col-form-label">Fullness:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="Fullness" name="Fullness" placeholder="" style="width: 200px;">
            </div>
        </div>

        <div class="form-group row">
            <label for="Cost" class="col-sm-2 col-form-label">Cost:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="Cost" name="Cost" placeholder="" style="width: 200px;">
            </div>
        </div>

        <div class="custom-file" style="padding-bottom: 30px;">
            <input type="file" name="filenew"  class="custom-file-input" id="UploadedFile"/>
        </div>

        <input type="submit" value="<spring:message text="Add Car"/>"/>
    </c:if>
</form:form>
</div>

<div class="container">


<div style="padding-bottom: 15px; padding-top: 10px; width: 1140px; padding-left: 17px;" >
<input class="form-control" id="myInput" onkeyup="myFunction()" type="text" placeholder="Search Number.." >
</div>

<div class="container" style="padding-bottom: 60px;">
    <div class="form-inline" style="padding-bottom: 30px; ">
        <form:form  action="/sortcars" method="post">
        <select name = "mark" class="form-control" style="width: 200px;">
            <option selected>Mark</option>
            <c:forEach items="${marks}" var="mark">
                <option value=${mark}>${mark}</option>
            </c:forEach>
        </select>

        <select name="transmission" class="form-control" style="width: 180px;">
            <option selected>Transmission</option>
            <c:forEach items="${transmissions}" var="transmission">
                <option value=${transmission}>${transmission}</option>
            </c:forEach>
        </select>

        <select name = "fullness" class="form-control" style="width: 180px;">
            <option selected>Fullness</option>
            <c:forEach items="${fullnesses}" var="fullness">
                <option value = ${fullness}>${fullness}</option>
            </c:forEach>
        </select>

        <select name="cost" class="form-control" style="width: 180px;">
            <option selected>Cost From</option>
            <option value="100">100</option>
            <option value="200">200</option>
            <option value="200">300</option>
        </select>

        <select name="cost" class="form-control" style="width: 180px;">
            <option selected>Cost To</option>
            <option value="100">200</option>
            <option value="200">300</option>
            <option value="200">400</option>
        </select>
        <div class="form-group"> <!-- Submit button -->
            <button class="btn btn-primary " name="sort" onclick="sort()" type="submit" style="width: 190px;background-color: black; border-color: black;">Sort</button>
        </div>
    </div>
    </form:form>
    <div id="table">
        <c:if test="${!empty listCars}">
            <table id="myTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th data  width="80">ID</th>
                    <th  width="120">Mark</th>
                    <th width="120">Number</th>
                    <th width="120">Fullness</th>
                    <th width="60">Transmission</th>
                    <th width="60">Cost</th>
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
        </tr>
        </thead>
                <tbody>
        <c:forEach items="${listCars}" var="car">

            <tr>
                <td >${car.id}</td>
                <td >${car.carMarka}</td>
                <td>${car.carNumber}</td>
                <td>${car.carFullness}</td>
                <td>${car.carTransmission}</td>
                <td>${car.carCost}</td>
                <td><a href="<c:url value='/edit/${car.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${car.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</c:if>
</div>
</div>
<footer>
    <div class="footer"></div>
</footer>
<script>
    $(function()	{
        $('td').click(function(e)	{
            //ловим элемент, по которому кликнули
            var t = e.target || e.srcElement;
            //получаем название тега
            var elm_name = t.tagName.toLowerCase();
            //если это инпут - ничего не делаем
            if(elm_name == 'input')	{return false;}
            var val = $(this).html();
            var code = '<input type="text" id="edit" value="'+val+'" />';
            $(this).empty().append(code);
            $('#edit').focus();
            $('#edit').blur(function()	{
                var val = $(this).val();
                $(this).parent().empty().html(val);
            });
        });
    });

    function myFunction() {
        // Declare variables
        var input, filter, table, tr, td, td2, i, txtValue,k;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
    }
</script>
<script src="extensions/editable/bootstrap-table-editable.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>


