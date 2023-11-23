<%--
  Created by IntelliJ IDEA.
  User: 18424
  Date: 2023/10/26
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>

    <style type="text/css">
        a {
            text-decoration: none;
            color: #007bff;
            background:white;
            font-size: 20px;
        }
    </style>
</head>
<body>
欢迎${user.getName()}<br>

<a href="toRecordAll-servlet?userId=${user.getId()}">查看做题记录</a><br>
<a href="toUpdate-servlet">更新问题</a>
</body>

</html>
