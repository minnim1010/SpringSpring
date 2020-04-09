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
    <style type="text/css">
        #wrapper {
            position: absolute;
            top: 100px;
            left: 300px;
            right: 300px;
            margin: auto;
        }
    </style>
</head>
<body>

<div id="wrapper">
    <h2 style="display: inline;">Hello! </h2>
    <c:if test="${USER != NULL}">
        <h2 style="display: inline;">${USER.name}</h2>
    </c:if>
    <c:if test="${USER == NULL}">
        <div style="display: inline; float:right;">
            <button type="button" class="btn btn-primary" onClick="location.href='/signin'">Sign in</button>
            <button type="button" class="btn btn-primary" onClick="location.href='/signup'">Sign up</button>
        </div>
    </c:if>
    <c:if test="${USER != NULL}">
        <div style="display: inline; float:right;">
            <button type="button" class="btn btn-primary" onClick="location.href='/signout'">Sign Out</button>
            <button type="button" class="btn btn-primary" onClick="location.href='/deleteaccount'">Delete Account</button>
        </div>
    </c:if>

    <hr/>

    <section id="container">
        <h2>Post List</h2>
        <table class="table table-hover">
            <thead>
            <th>Title</th>
            <th>Author</th>
            <th>Date</th>
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

    <div style="float:right">
        <c:if test="${USER != NULL}">
            <button type="button" class="btn btn-primary" onClick="location.href='/post'">Post</button>
        </c:if>
    </div>

    <br/>
    <nav class="text-center shrink">
        <ul class="pagination" >
            <c:if test="${prev}">
                <li class="page-item"><a class="page-link" href="/searchpost?num=${StartPageNum - 1}&SearchType=${SearchType}&Keyword=${Keyword}">prev</a></li>
            </c:if>
            <c:forEach begin="${StartPageNum}" end="${EndPageNum}" var="num">
                <li class="page-item"><a class="page-link" href="/searchpost?num=${num}&SearchType=${SearchType}&Keyword=${Keyword}">${num}</a></li>
            </c:forEach>
            <c:if test="${next}">
                <li class="page-item"><a class="page-link" href="/searchpost?num=${EndPageNum + 1}&SearchType=${SearchType}&Keyword=${Keyword}">next</a></li>
            </c:if>
        </ul>
    </nav>

    <hr/>

    <div class="search row">
        <div class="col-xs-2 col-sm-2">
            <select class="form-control" name="SearchType" id="SearchType">
                <option value="SearchTitle">제목</option>
                <option value="SearchContent">본문</option>
                <option value="SearchAuthor">작성자</option>
                <option value="SearchTitleContent">제목+본문</option>
            </select>
        </div>
        <div class="input-group">
            <input type="text" class="form-control form-control-sm" name="Keyword" id="Keyword">
            <span class="input-group-btn">
            <button class="btn btn-default" name="btnSearch" id="btnSearch">검색</button>
        </span>
        </div>
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