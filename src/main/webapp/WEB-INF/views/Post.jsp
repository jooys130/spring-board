<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-01
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="container">
        <div class="row">
            <table class="table table-hover" style="border : 1px solid #dddddd;">
                <thead>
                    <tr>
                        <th colspan="6" style="background-color: #eeeeee; text-align: center">게시판 내용</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>글 제목</td>
                        <td colspan="3">Post Title</td>
                        <td>조회수</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>admin</td>
                        <td >생성일시</td>
                        <td>2022-08-01 15:42:58</td>
                        <td >수정일자</td>
                        <td>2022-08-01 15:55:58</td>
                    </tr>
                    <tr>
                        <td>글 내용</td>
                        <td colspan="5"  style="height: 400px";>Post Content</td>
                    </tr>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" onclick="location.href='/boardlist';"> 목록 </button>
            <button type="button" class="btn btn-success" onclick="location.href='/edit';"> 수정 </button>
            <button type="button" class="btn btn-danger"> 삭제 </button>
        </div>
    </div>
</body>
</html>
