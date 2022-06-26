<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/29
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>开始界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/iconfont.js"></script>

    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
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


<h3>
    <a href="${pageContext.request.contextPath}/login.jsp"><span class="icon iconfont icon-denglu"></span>点击登录</a>
</h3>


</body>
</html>