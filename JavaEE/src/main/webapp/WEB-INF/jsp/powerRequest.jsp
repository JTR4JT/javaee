<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/6
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限申请</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        .yes
        {
            margin: auto;
        }
        #main
        {
            margin: auto;
            width: 500px;
        }
        .sexMsg
        {
            padding-left: 100px;
            width: 400px;
            margin: auto;
        }
    </style>
</head>
<body>
<p class="h1 text-center">权限申请信息</p>
<div id="main">
    <div class="container mt-3">


        <form action="${pageContext.request.contextPath}/apply/addApply" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text">id 号</span>
                <input type="text" class="form-control" placeholder="u_id" name="u_id" readonly value="${USER_SESSION.u_id}">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">身份证号码</span>
                <input type="text" class="form-control" placeholder="u_idcard" value="${USER_SESSION.u_idcard}">

            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">账号</span>
                <input type="text" class="form-control" placeholder="u_account" value="${USER_SESSION.u_account}">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">密码</span>
                <input type="text" class="form-control" placeholder="u_psd" value="${USER_SESSION.u_psd}">

            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">地址</span>
                <input type="text" class="form-control" placeholder="u_address" value="${USER_SESSION.u_address}">
            </div>

            <div class="row mb-3 sexMsg">
                <div class="col-md-4"><input type="radio" name="gender" id="man" value="男" checked="checked" /> <span class="h5">男</span></div>
                <div class="col-md-4 "> <input type="radio" name="gender" id="woman" value="女" /> <span class="h5">女</span></div>
            </div>

            <div class="input-group ">
                <span class="input-group-text">电话号码</span>
                <input type="text" class="form-control" placeholder="u_phone" value="${USER_SESSION.u_phone}">

            </div>
            <div class="form-floating mb-3 mt-3">
                <select class="form-select" id="sel1" name="ap_power">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
                <label for="sel1" class="form-label">权限等级:</label>
            </div>
            <div class="row">
                <button type="submit" class="btn btn-primary yes col-md-4">申请</button>
                <button type="button" class="btn btn-primary yes col-md-4" onclick="javascript:history.back(-1);">返回</button>
            </div>
    </form>
</div>
</div>
<script>
    if('女'=='${USER_SESSION.u_sex}'){
        document.getElementById("woman").checked = true;
    }
    else{
        document.getElementById("man").checked = true;
    }
    $('#sel1').val('${USER_SESSION.u_type}');

</script>
</body>
</html>