<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/1
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失败</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

</head>
<body>
<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-sm-10 p-3 offset-md-1  text-center "><span class="h2">亲，你的操作貌似不正确</span>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10 p-3 offset-md-1   text-center "><span class="h3">提示信息:${errorMsg}</span></div></div>
</div>
<button type="button" class="btn btn-primary yes offset-md-5 " onclick="javascript:history.back(-1);">返回</button>

</body>
</html>
