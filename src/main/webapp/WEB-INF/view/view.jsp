<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>게시판 조회</title>
</head>
<body>

<div id="root">
    <header>
        <h1>게시판</h1>
    </header>
    <hr />

    <nav>
        게시판 조회
    </nav>
    <hr />

    <section id="container">
        <form role="form" method="post">
            <table>
                <tbody>
                <tr>
                    <td>
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" value="${member.title}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="author">작성자</label>
                        <input type="text" id="author" name="author" value="${member.author}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="content">내용</label>
                        <textarea id="content" name="content">${member.content}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </section>
    <hr />
</div>
</body>
<button onClick="location.href='/edit?bno=${member.bno}'">edit</button>
<button onClick="location.href='/delete?bno=${member.bno}'">delete</button>
</html>