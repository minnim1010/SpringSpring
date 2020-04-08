<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>MinniM 게시판</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
</head>
<body>

<div class="container">
    <header>
        <h1>MinniM 게시판</h1>
    </header>
    <hr/>
    <nav>처음화면 - 글쓰기 - 로그인</nav>
    <c:if test="${USER == NULL}">

        <span>
            <button onClick="location.href='/signin'">Sign in</button>
        </span>
        <span>
            <button onClick="location.href='/signup'">Sign up</button>
        </span>
    </c:if>
    <c:if test="${USER != NULL}">
        <span>
            <button onClick="location.href='/signout'">Sign Out</button>
        </span>
        <span>
            <button onClick="location.href='/deleteaccount'">Delete Account</button>
        </span>
    </c:if>
    <span>
        <button onClick="location.href='/post'">Post</button>
    </span>
    <hr/>
    <section id="container">
        <h2>글 목록</h2>
        <table class="table table-hover">
            <thead>
            <th>글 제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            </thead>

            <!-- 목록 시작 -->
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td><a href="/view?bno=${member.bno}"/>${member.title}</td>
                    <td>${member.author}</td>
                    <td><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
            <!-- 목록 끝 -->

        </table>
    </section>

    <div class="col-md-offset-3">
        <ul class="pagination">
            <c:if test="${prev}">
                <span>[<a
                        href="/searchpost?num=${StartPageNum - 1}&SearchType=${SearchType}&Keyword=${Keyword}">prev</a>]</span>
            </c:if>
            <c:forEach begin="${StartPageNum}" end="${EndPageNum}" var="num">
    <span>
     <a href="/searchpost?num=${num}&SearchType=${SearchType}&Keyword=${Keyword}">${num}</a>
    </span>
            </c:forEach>
            <c:if test="${next}">
                <span>[<a href="/searchpost?num=${EndPageNum + 1}&SearchType=${SearchType}&Keyword=${Keyword}">next</a>]</span>
            </c:if>
        </ul>
    </div>

    <div class="search row">
        <div class="col-xs-2 col-sm-2">
            <select class="form-control" name="SearchType" id="SearchType">
                <option value="SearchTitle">제목</option>
                <option value="SearchContent">본문</option>
                <option value="SearchAuthor">작성자</option>
                <option value="SearchTitleContent">제목+본문</option>
            </select>
        </div>
        <input type="text" class="form-control form-control-sm" name="Keyword" id="Keyword">
        <span>
            <button class="btn btn-default" name="btnSearch" id="btnSearch">검색</button>
        </span>

    </div>

    <script>
        $(document).on('click', '#btnSearch', function (e) {
            e.preventDefault();
            var url = "/searchpost";
            url = url + "?SearchType=" + $('#SearchType').val();
            url = url + "&keyword=" + $('#Keyword').val();
            location.href = url;
            console.log(url);
        });
    </script>

</div>

</body>

</html>