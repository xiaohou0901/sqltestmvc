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
    <title>答题</title>
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
用户${user.getName()}正在作答<br>

<form action="check-servlet?questionId=${oneQuestions.getId()}&userId=${user.getId()}" method="post">
    <p>
    ${oneQuestions.getId()}、${oneQuestions.getQuestion()}
    请输入：
    </p>
    <br>
    <textarea cols="80" rows="20"  name="userSql">${userSql}</textarea>
    <br>
    <br>
    <input type="submit" value="测试">

</form>
<br>
    <p>${result}</p>

    <button onclick="toggleText()">查看答案</button><br>
<div id="text" style="display:none;">${oneQuestions.getAnswer()}</div>
<br>
    <script>
       function toggleText(){
           var text=document.getElementById("text");
           if(text.style.display==="none"){
               text.style.display="block";
           }else{
               text.style.display="none";
           }
       }
    </script>

Student<br>



<div class="row clearfix">
    <div class="col-md-6 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>s_id</th>
                <th>s_name</th>
                <th>s_birth</th>
                <th>s_sex</th>
            </tr>

            </thead>

            <tbody>
            <c:forEach var="student" items="${requestScope.get('studentList')}">
                <tr>
                    <td>${student.getS_id()}</td>
                    <td>${student.getS_name()}</td>
                    <td>${student.getS_birth()}</td>
                    <td>${student.getS_sex()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


Course<br>
<div class="row clearfix">
    <div class="col-md-6 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>c_id</th>
                <th>c_name</th>
                <th>t_id</th>
            </tr>

            </thead>

            <tbody>

            <c:forEach var="course" items="${requestScope.get('courseList')}">
                <tr>
                    <td>${course.getC_id()}</td>
                    <td>${course.getC_name()}</td>
                    <td>${course.getT_id()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>



Teacher<br>

<div class="row clearfix">
    <div class="col-md-6 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>t_id</th>
                <th>t_name</th>
            </tr>

            </thead>

            <tbody>
            <c:forEach var="teacher" items="${requestScope.get('teacherList')}">
                <tr>
                    <td>${teacher.getT_id()}</td>
                    <td>${teacher.getT_name()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


Score<br>

<div class="row clearfix">
    <div class="col-md-6 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>s_id</th>
                <th>c_id</th>
                <th>s_score</th>
            </tr>

            </thead>

            <tbody>
            <c:forEach var="score" items="${requestScope.get('scoreList')}">
                <tr>
                    <td>${score.getS_id()}</td>
                    <td>${score.getC_id()}</td>
                    <td>${score.getS_score()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>


</body>
</html>
