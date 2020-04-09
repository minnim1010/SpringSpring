<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>게시판 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
    <style type="text/css">
        #wrapper {
            position: absolute;
            top: 150px;
            left: 300px;
            right: 300px;
            margin: auto;
        }
    </style>
</head>
<body>

<div id="wrapper">
    <c:if test="${login eq null}">
        <h1><p>Please login first, if you want to edit!!</p></h1>
    </c:if>
    <c:if test="${login ne null}">
        <form role="form" method="post" action="/editposts?bno=${member.bno}">
            <div>
                <h1>Title</h1>
                <textarea type="text" name="title" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">${member.title}</textarea>
            </div>

            <div>
                <h2>Author</h2>
                <textarea type="text" name="author" id="author" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">${login.name}</textarea>
            </div>

            <div>
                <h1>Content</h1>
                <textarea type="text" name="content" id="content" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">${member.content}</textarea>
            </div>

            <br/>
            <button class="btn btn-info btn-block my-4" type="submit">edit</button>
        </form>
    </c:if>
</div>
</body>
</html>