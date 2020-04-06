<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>게시판</title>
</head>
<body>

<div id="root">
    <header>
        <h1>Sign In</h1>
    </header>
    <hr />

    <nav>
        Sign In
    </nav>
    <hr />

    <section id="container">
        <form role="form" method="post" action="/login">
            <table>
                <tbody>
                <tr>
                    <label for="name">name</label><textarea id="name" name="name"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="pwd">password</label><textarea id="pwd" name="pwd" ></textarea>
                    </td>
                </tr>
                <tr>
                <td>
                    <button type="submit">submit</button>
                </td>
                </tr>
                </tbody>
            </table>
        </form>
        <c:if test="${loginsuccess == false}">
            <p style="color:#f00;">Id or Password is wrong. Please check again!</p>
        </c:if>
    </section>
    <hr />
</div>
</body>
</html>