<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-08
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Free goggle Korean fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <title>Login</title>
    <style>
        header {
            margin: 5px 50px 0px 50px;
            font-family: 'IBM Plex Sans KR', sans-serif;
            font-weight: 700;
        }
        #wrapper {
            margin-top: 20px;
            padding-left: 300px;
            padding-right: 300px;
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
    </style>
</head>
<body>
<header>
    <h1>로그인</h1>
</header>
<div id="wrapper" class="container">
<form class="form-horizontal" action="/loginPage" method="post">
    <div class="form-group">
        <label for="inputId" class="col-sm-2 control-label">Id</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputId" name=id placeholder="아이디">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" name=password placeholder="비밀번호">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> 로그인 상태 유지
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">로그인</button>
        </div>
    </div>
</form>
</div><!-- /.wrapper -->
</body>
</html>
