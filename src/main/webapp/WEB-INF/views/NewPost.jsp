<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-02
  Time: 오후 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>NewPost</title>
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
    <form action="/create" method="post" onsubmit="return submitValid();">
        <table class="table" style="border : 1px solid #dddddd;">
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center">게시글 생성</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>글 제목</td>
                    <td><input id="title" name="title" placeholder="제목을 입력하세요." style="width:100%; border:0;"></td>
                </tr>
                <tr>
                    <td>글 내용</td>
                    <td style="height: 400px";>
                        <textarea id="context" name="context" placeholder="내용을 입력하세요." rows="20" style="width:100%; border:0; resize: none;"></textarea>
            </td>
                </tr>
            </tbody>
        </table>
        <div class="pull-right">
            <input type="submit" class="btn btn-primary active" value="저장">
            <button type="button" class="btn btn-default active" onclick="location.href='/boardList';"> 취소 </button>
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
            alert("저장되었습니다.");
            window.location.href='/boardList';
        }
    }
</script>
</body>
</html>

