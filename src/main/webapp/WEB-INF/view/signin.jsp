<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
    <style type="text/css">
        #wrapper {
            width: 500px;
            margin: auto;
        }
    </style>

</head>
<body>
<div style="padding:100px">

    <form class="border border-light p-5" role="form" method="post" action="/login">

        <p class="h2 mb-4 text-center">Sign in</p>

        <div class="text-center">
            <c:if test="${loginsuccess == false}">
                <p style="color:#f00;">Id or Password is wrong. Please check again!</p>
            </c:if>
        </div>
        <p>
        <input type="name" id="name" name="name" class="form-control mb-4" placeholder="ID">
        </p>
        <p>
        <input type="password" id="pwd" name="pwd" class="form-control mb-4" placeholder="Password">
        </p>

        <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

        <div class="text-center">
            <p>Not a member?
                <a href="/signup">Register</a>
            </p>

        </div>
    </form>
</div>
</body>
</html>