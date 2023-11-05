<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            width: 300px;
            padding: 16px;
            background-color: white;
            margin: 100px auto;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>


</head>
<body>
</h1>
<br/>
<a href="hello-servlet"></a>
<h3 style="text-align: center; font-size: 36px; color: #4CAF50;">欢迎使用sql答题系统</h3>
<div class="container">
        <label for="num"><b>${message}</b></label>
    <form action="login-servlet" method="POST">

        <label for="num"><b>账号</b></label>
        <input type="text" name="num" id="num" ><br>
        <label for="password"><b>密码</b></label>
        <input type="password" name="password" id="password"><br>
        <button type="submit">登录</button>


    </form>
   <a href="toRegister-servlet">注册</a>
</div>

<%--在allquestionservlet里调用service或者doget<a href="toAllQuestion-servlet">所有题目</a>--%>

</body>
</html>

