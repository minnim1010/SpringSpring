<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page session="false"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello, MinniM's Blog!
</h1>

<p><a href="/list?num=1">게시물 목록</a></p>
<p><a href="/post">게시물 작성</a></p>

<c:if test="${USER != NULL}">
    <p>Welcome! ${USER.name}!</p>
</c:if>

</body>
</html>

