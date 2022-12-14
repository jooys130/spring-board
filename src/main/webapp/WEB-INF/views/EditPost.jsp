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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Free goggle Korean fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <title>Edit</title>
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
        input:focus, textarea:focus{
            outline: none;
        }
    </style>
</head>
<body>
<header>
    <h1>게시판</h1>
</header>
<div id="wrapper" class="container">
    <form action="/update" method="post" onsubmit="return submitValid();">
        <table class="table" style="border : 1px solid #dddddd;">
            <thead>
            <tr>
                <th colspan="6" style="background-color: #eeeeee; text-align: center">게시글 수정</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>글 제목</td>
                    <td colspan="3"><input id="title" name="title" style="width:100%; border:0;" value="${editDetail.title}"></td>
                    <td>조회수</td>
                    <td>${editDetail.cnt}</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>${editDetail.author}</td>
                    <td >생성일시</td>
                    <td>${editDetail.insert_time}</td>
                    <td >수정일자</td>
                    <td>${editDetail.update_time}</td>
                </tr>
                <tr>
                    <td>글 내용</td>
                    <td colspan="5"  style="height: 400px";>
                        <textarea id="context" name="context" style="width:100%; border:0; resize: none;">${editDetail.context}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <input type="hidden" name="id" value="${id}"/>
        <div class="pull-right">
            <button type="submit" class="btn btn-primary active"> 저장 </button>
            <button type="button" class="btn btn-default active" onclick="location.href='/post/${editDetail.id}';"> 취소 </button>
        </div><!-- /.pull-right -->
    </form>
</div><!-- /.wrapper -->
<script>
    function submitValid() {
        if (document.getElementById("title").value === '') {
            alert("제목을 입력해주세요.");
            return false;
        }

        else if (document.getElementById("context").value === '') {
            alert("내용을 입력해주세요.");
            return false;
        }

        else {
            alert("수정되었습니다.");
        }
    }
</script>

</body>
</html>
