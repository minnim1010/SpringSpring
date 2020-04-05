<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>MinniM 게시판</title>
</head>
<body>

<div id="root">
    <header>
        <h1>MinniM 게시판</h1>
    </header>
    <hr />
    <nav>처음화면 - 글쓰기 - 로그인</nav>
    <hr />
    <section id="container">
        <h2>글 목록</h2>

        <table>
            <tr><th>글 제목</th><th>작성자</th><th>작성일자</th></tr>

            <!-- 목록 시작 -->
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td><a href="/view?bno=${member.bno}">${member.title}</td>
                    <td>${member.author}</td>
                    <td><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
            <!-- 목록 끝 -->

        </table>

    </section>
    <div>
        <c:if test="${prev}">
            <span>[<a href="/list?num=${StartPageNum - 1}">prev</a>]</span>
        </c:if>
        <c:forEach begin="${StartPageNum}" end="${EndPageNum}" var="num">
    <span>
     <a href="/list?num=${num}">${num}</a>
    </span>
        </c:forEach>
        <c:if test="${next}">
            <span>[<a href="/list?num=${EndPageNum + 1}">next</a>]</span>
        </c:if>
    </div>
    <hr />

    <footer>
        <p>만든이 : MinniM</p>
    </footer>

</div>

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