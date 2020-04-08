<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
</head>
<body>

<div id="root">
    <header>
        <h1>Sign Up</h1>
    </header>
    <hr />

    <nav>
        Sign up
    </nav>
    <hr />

    <section id="container">
        <form role="form" method="post" action="/addUser">
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
                        <label for="email">email</label><textarea id="email" name="email" ></textarea>
                    </td>
                </tr>
                <td>
                    <button type="submit">submit</button>
                </td>
                </tr>
                </tbody>
            </table>
        </form>
    </section>
    <hr />
</div>
</body>
</html>