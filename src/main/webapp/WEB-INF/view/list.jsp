<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-9">
    <title>Forum</title>
</head>

<body>
<table border="1">
    <thead>
        <tr>
            <th>BNO</th>
            <th>TITLE</th>
            <th>AUTHOR</th>
            <th>DATE</th>
            <th>CONTENT</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.bno}</td>
            <td>${member.title}</td>
            <td>${member.author}</td>
            <td>${member.regdate}</td>
            <td>${member.content}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<td>
    <button onClick="location.href='/signin'">Sign in</button>
</td>
<td>
    <button onClick="location.href='/signup'">Sign up</button>
</td>
<td>
    <button onClick="location.href='/signout'">Sign Out</button>
</td>
<td>
    <button onClick="location.href='/post'">Post</button>
</td>
</html>