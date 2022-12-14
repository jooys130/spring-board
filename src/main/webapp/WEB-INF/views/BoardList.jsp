<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-01
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();

    String name = "";
    if(auth.getPrincipal() != null) {
        name = auth.getName();
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Free goggle Korean fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <title>BoardList</title>
</head>
<body>
<header>
    <h1>게시판</h1>
</header>

<div id="wrapper" class="container">
    <div class="container text-right">
        <sec:authorize access="isAnonymous()">
            <a href='<c:url value="/loginPage"/>' class="btn btn-info">LOGIN</a>
            <button id="btnJoin" class="btn btn-info" onclick="location.href='/joinPage';" >JOIN</button>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <div style="display:inline;">
            <form action="/logoutPage" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button style="float:right;" type="submit" class="btn btn-dark btn-sm">LOGOUT</button>
            </form>
            <h5 style="float:right;"><%=name %>님, 반갑습니다.&nbsp;&nbsp;</h5>
        </div>
        </sec:authorize>
    </div>
    <br><br>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">목록</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <button id="btnWrite" onclick="location.href='create'" type="button" class="btn btn-default navbar-btn">글 작성</button>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">생성일자</th>
            <th scope="col">수정일자</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${boardList}" var="boardList">
            <tr onclick="location.href='post/${boardList.id}'">
                <th scope="row" id="listNumber"></th>
                <td>${boardList.title}</td>
                <td>${boardList.author}</td>
                <td>${boardList.insert_time}</td>
                <td>${boardList.update_time}</td>
                <td>${boardList.cnt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div><!-- /.wrapper -->
</body>
</html>
<style>
    header {
        margin: 5px 50px 0px 50px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 700;
    }
    #wrapper {
        margin-top: 20px;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    tbody>tr {
        counter-increment: number;
    }
    tbody>tr>th:before {
        content: counter(number);
    }
</style>