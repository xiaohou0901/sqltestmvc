<%--
  Created by IntelliJ IDEA.
  User: 18424
  Date: 2023/10/31
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册界面</title>
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
      from {
          font-family: "微软雅黑";
          font-size: 16px;
          color: #333;
          background-color: #f5f5f5;
          padding: 2px 4px;
          border-radius: 4px;
          text-align: center;
      }

  </style>
</head>

<body>
<div class="container">
<form action="register-servlet" method="POST">
    <label for="name">姓名：</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="num">账号：</label>
    <input type="text" id="num" name="num" required><br><br>

    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required><br><br>

    <label for="role">身份：</label>
    <select id="role" name="role">
        <option value="0">学生</option>
        <option value="1">老师</option>
    </select><br><br>
    <button type="submit">注册</button>
</form>
    </div>
</body>
</html>