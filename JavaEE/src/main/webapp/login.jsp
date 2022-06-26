<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/31
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服装库存管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="css/pages-login-manage.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/my.js"></script>
    <script type="text/javascript" src="js/gVerify.js"></script>
</head>
<body>
<div class="loginmanage ">
    <div class="py-container">
        <h4 class="manage-title">服装库存管理系统</h4>
        <div class="loginform">
            <ul class="sui-nav nav-tabs tab-wraped">
                <li class="active">
                    <h3>账户登录</h3>
                </li>
            </ul>
            <div class="tab-content tab-wraped">
<%--                <!-- &lt;%&ndash;登录提示信息&ndash;%&gt;--%>
<%--                <span style="color: red">${msg}</span> -->--%>
                <div id="profile" class="tab-pane  active">
                    <form id="loginform" class="sui-form" action="${pageContext.request.contextPath}/user/userLogin"
                          method="post" onsubmit="return checkPIN()">
                        <div class="input-prepend"><span class="add-on loginname">账&nbsp;号</span>
                            <input type="text" placeholder="请输入账号" class="span2 input-xfat" name="u_account">
                        </div>
                        <div class="input-prepend"><span class="add-on loginpwd">密码</span>
                            <input type="password" placeholder="请输入密码" class="span2 input-xfat" name="u_psd">
                        </div>
                        <div class="input-prepend">
                            <span class="add-on loginname">验证码</span>
                            <input type="text" id="code_input" class="span2 input-xfat" value="" placeholder="请输入验证码"/>
                            <div id="v_container" style="width: 200px;height: 50px;"></div>
                        </div>
                        <div class="logined">
                            <button id="LOGIN" class="sui-btn btn-block btn-xlarge btn-danger btn carrot shake-little"
                               type="submit" target="_self" >登&nbsp;&nbsp;录</button>
                        </div>
                        <div class="registered">
                            <a class="sui-btn btn-block btn-xlarge btn-danger"
                               href='register.jsp' target="_self">注&nbsp;&nbsp;册</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var verifyCode = new GVerify("v_container");
    /**
     * 登录超时 展示区跳出iframe
     */
    var _topWin = window;
    while (_topWin != _topWin.parent.window) {
        _topWin = _topWin.parent.window;
    }
    if (window != _topWin)
        _topWin.document.location.href = '${pageContext.request.contextPath}/login.jsp';

//    按下enter登录
    document.onkeyup = function (e) {
        var event = e || window.event;
        var key = event.which || event.keyCode || event.charCode;
        if (key == 13) {
            document.getElementById("LOGIN").click();
        }
    }

</script>
</html>