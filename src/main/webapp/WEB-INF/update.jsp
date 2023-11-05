<%--
  Created by IntelliJ IDEA.
  User: 18424
  Date: 2023/10/26
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="resource/js/jquery.min.js"></script>
    <title>更新题目</title>
    <style type="text/css">
        textarea {
            font-size: 20px;
            font-family: "微软雅黑";
            color: darkblue;
            width: 500px;
            height: 150px;
        }
        p {
            font-family: "微软雅黑";
        }

    </style>
</head>
<body>
<div class="container">
用户${user.getName()}正在更新题目<br>

<form action="updateQuestion-servlet?userId=${user.getId()}" method="get">
    <p>
    请输入：
    </p>
    <br>
    <textarea cols="80" rows="20"  name="userSql">${userSql}</textarea>
    <br>
    <br>
    <input type="submit" value="更新">
</form>
<br>
    insert into sqltest.order(uid,qid,time) values(2,3,3)
    <p>${result}</p>






</body>
</html>
