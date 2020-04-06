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
        <h1> 게시판</h1>
    </header>
    <hr />

    <nav>
        홈 - 글 작성
    </nav>
    <hr />

    <section id="container">
        <c:if test="${login == true}">
            <form role="form" method="post" action="/insert">
                <table>
                    <tbody>
                    <tr>
                        <td>
                            <label for="title">제목</label><input type="text" id="title" name="title" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">내용</label><textarea id="content" name="content" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="author">작성자</label>
                            <input type="text" id="author" name="author" value="${USER.name}" readonly="readonly"/>
                        </td>
                    <tr>
                        <td>
                            <button type="submit">작성</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </c:if>
        <c:if test="${login == false}">
            <p> Please log in first, if you want to post!!</p>
        </c:if>
    </section>
    <hr />
</div>
</body>
</html>