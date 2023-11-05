<%--
  Created by IntelliJ IDEA.
  User: 18424
  Date: 2023/10/25
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有问题</title>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            background:white;
            font-size: 20px;
        }
        p{
            font-size: 20px;
        }
        h3 {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h1>this is all question</h1>
<p>${user.getName()}请选择您要做的题目</p><br>

<c:forEach var="question" items="${requestScope.get('questionList')}">
    <a href="toAnswer-servlet?questionId=${question.getId()}&userId=${user.getId()}">
            ${question.getId()}、${question.getQuestion()}
    </a><br><br>
</c:forEach>
</body>
</html>
