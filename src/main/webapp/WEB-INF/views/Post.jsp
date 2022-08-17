<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-01
  Time: 오후 3:09
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
    <!-- To ensure proper rendering and touch zooming-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Free goggle Korean fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <title>Post</title>
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
        td:nth-child(2n+1) {
            background-color: #e3f2fd;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<header>
    <h1>게시판</h1>
</header>
<div id="wrapper" class="container">
    <table class="table table-hover" style="border : 1px solid #dddddd;">
        <thead>
            <tr>
                <th colspan="6" style="background-color: #eeeeee; text-align: center">게시글 상세</th>
            </tr>
        </thead>
            <tbody>
                <tr>
                    <td>글 제목</td>
                    <td colspan="3">${postDetail.title}</td>
                    <td>조회수</td>
                    <td>${postDetail.cnt}</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td id="postDetailAuthor">${postDetail.author}</td>
                    <td >생성일시</td>
                    <td>${postDetail.insert_time}</td>
                    <td >수정일자</td>
                    <td>${postDetail.update_time}</td>
                </tr>
                <tr>
                    <td>글 내용</td>
                    <td colspan="5" style="height: 400px";>${postDetail.context}</td>
                </tr>
            </tbody>
    </table>
    <button type="button" class="btn btn-primary" onclick="location.href='/boardList';"> 목록 </button>
    <div class="pull-right hidden" id="onlyAuthor">
        <button type="button" class="btn btn-success" onclick="location.href='/edit/${postDetail.id}'"> 수정 </button>
        <button type="button" class="btn btn-danger" onclick="deleteCheck()"> 삭제 </button>
    </div><!-- /.pull-right -->
    <p id="loginUser" style="display: none"><%=name %></p>
</div><!-- /.wrapper -->
<script>
    function deleteCheck() {
        if (confirm("정말 삭제하시겠습니까??") === true){  //확인
            window.location.href='/delete/${postDetail.id}';
        }
        else{ //취소
            return false;
        }
    }

    const onlyAuthor = document.getElementById("onlyAuthor");
    const HIDDEN_CLASSNAME = "hidden";
    const postDetailAuthor = document.getElementById("postDetailAuthor")
    const author = postDetailAuthor.innerText;
    const getLoginUser = document.getElementById("loginUser");
    const loginUser = getLoginUser.innerText;

    if (author === loginUser) {
        onlyAuthor.classList.remove(HIDDEN_CLASSNAME);
    }

</script>
</body>
</html>
