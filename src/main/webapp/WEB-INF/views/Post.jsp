<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-01
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- To ensure proper rendering and touch zooming-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>Post</title>
    <style>
        td:nth-child(2n+1) {
            background-color: #e3f2fd;
        }
    </style>
</head>
<body>
    <header>
        <h1>게시판</h1>
    </header>
    <div class="container">
        <div class="row">
            <table class="table table-hover" style="border : 1px solid #dddddd;">
                <thead>
                    <tr>
                        <th colspan="6" style="background-color: #eeeeee; text-align: center">게시글 상세</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="boardList" items="${boardList}">
                    <tr onclick="location.href='/post/${boardList.id}'">
                        <td>글 제목</td>
                        <td colspan="3">${boardList.title}</td>
                        <td>조회수</td>
                        <td>${boardList.cnt}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${boardList.author}</td>
                        <td >생성일시</td>
                        <td>${boardList.insert_time}</td>
                        <td >수정일자</td>
                        <td>${boardList.update_time}</td>
                    </tr>
                    <tr>
                        <td>글 내용</td>
                        <td colspan="5"  style="height: 400px";>${boardList.context}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" onclick="location.href='/boardlist';"> 목록 </button>
            <button type="button" class="btn btn-success" onclick="location.href='/edit';"> 수정 </button>
            <button type="button" class="btn btn-danger"> 삭제 </button>
        </div>
    </div>
</body>
</html>
