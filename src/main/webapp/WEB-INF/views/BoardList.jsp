<%--
  Created by IntelliJ IDEA.
  User: BD
  Date: 2022-08-01
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>BoardList</title>
</head>
<body>
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
            <tr>
                <th scope="row">${boardList.id}</th>
                <td>${boardList.title}</td>
                <td>${boardList.author}</td>
                <td>${boardList.insert_time}</td>
                <td>${boardList.update_time}</td>
                <td>${boardList.cnt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</body>
</html>
