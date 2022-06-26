<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
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
<p class="h1 text-center">个人信息展示</p>
<div id="main">
    <div class="container mt-3">


        <form action="${pageContext.request.contextPath}/user/updateMsg" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text">id 号</span>
                <input type="text" class="form-control" placeholder="u_id" name="u_id" readonly value="${USER_SESSION.u_id}">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">身份证号码</span>
                <input type="text" class="form-control" placeholder="u_idcard" name="u_idcard" value="${USER_SESSION.u_idcard}">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">账号</span>
                <input type="text" class="form-control" placeholder="u_account" name="u_account" value="${USER_SESSION.u_account}">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">密码</span>
                <input type="text" class="form-control" placeholder="u_psd" name="u_psd" value="${USER_SESSION.u_psd}">

            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">地址</span>
                <input type="text" class="form-control" placeholder="u_address" name="u_address" value="${USER_SESSION.u_address}">
            </div>

            <div class="row mb-3 sexMsg">
                <div class="col-md-4"><input type="radio" id="man" name="u_sex" value="男"  /> <span class="h5">男</span></div>
                <div class="col-md-4 "> <input type="radio"id="woman" name="u_sex" value="女" /> <span class="h5">女</span></div>
            </div>

            <div class="input-group mb-3 ">
                <span class="input-group-text">电话号码</span>
                <input type="text" class="form-control" placeholder="u_phone" name="u_phone" value="${USER_SESSION.u_phone}">

            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">权限等级</span>
                <input type="text" class="form-control" placeholder="u_type" readonly name="u_type" value="${USER_SESSION.u_type}">

            </div>

            <div class="row">
                <button type="submit" class="btn btn-primary yes col-md-4">修改</button>
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
</script>
</body>
</html>