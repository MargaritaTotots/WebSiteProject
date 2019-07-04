<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Totot
  Date: 29.05.2019
  Time: 13:04
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
            background-image: url(../resources/images/car2222.jpg);
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
</head>
<body>

<nav class="navbar" >
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link"   href="index.jsp">Home </a>
            <a class="nav-item nav-link" href="/carscommon">Cars</a>
            <div class="navbar-right">
                <a class="nav-item nav-link" href="/login">Login</a>
            </div>
        </div>
    </div>
</nav>




<header id="HOME" class="HomeHeader">
    <div class="text">
        <h1 style="font-size:90px; font-weight: bold;  text-transform: uppercase; "> Car Rental </h1>
        Welcom to car rent service!!!<pre></pre>
        <a class="button" href="#MoreInformation">More</a>
    </div>
</header>

<section>
    <div class="container">
        <div class="title">
            <h1 id="MoreInformation">
                <br> Who we are
            </h1>
                <p> Our founders had the simple idea of wanting to make renting cars much better. And we’ve flourished because our customers love how we work.<br> We started in 2004 as TravelJigsaw. Four years later, we were making 1000 bookings a day. <br>Everything we do is about giving you the freedom to discover more. We’ll move mountains to find you the right rental car, and bring you a smooth, hassle-free experience from start to finish.<br>We use all our experience – and the experiences of millions of our customers – to bring you the car you need and the quality of service you want. <br> I find this increases efficiency and helps the rest of the team stay on track, too. I pride myself on making sure people have the right information because it drives better results.<br><br><br></p>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="footer"></div>
</footer>

</body>
</html>
