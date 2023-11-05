<%--
  Created by IntelliJ IDEA.
  User: 18424
  Date: 2023/10/31
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>做题记录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<div class="container">
<p>做题记录</p><br>
<%--${orderList}--%>

<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>题号</th>
                <th>做题人</th>
                <th>做题时间</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="order" items="${requestScope.get('orderList')}">
                <tr>

                    <td>${order.getQid()}</td>
                    <td>${order.getUid()}</td>
                    <td>${order.getTime()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>

</body>
</html>
