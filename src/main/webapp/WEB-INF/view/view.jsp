<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시판 조회</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
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
    <form role="form" method="post">

        <div class="media">
            <div class="media-body">
                <h1 class="mt-0">${member.title}</h1>
                <hr/>
                <h4 style="display: inline;">Author:${member.author}</h4>
                <div style="display: inline; float:right;" >
                    <button type="button" class="btn btn-outline-primary"
                            onClick="location.href='/edit?bno=${member.bno}'">edit
                    </button>
                    <button type="button" class="btn btn-outline-danger"
                            onClick="location.href='/delete?bno=${member.bno}'">delete
                    </button>
                    <button type="button" class="btn btn-outline-info"
                            onClick="location.href='/'">list
                    </button>
                </div>
                <hr/>
                <h4>${member.content}</h4>
            </div>
        </div>
    </form>
</div>
</body>
</html>