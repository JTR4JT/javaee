<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/1
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服装库存管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pages-login-manage.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/form.js"></script>
</head>
<body>
<!--在form的onSubmit事件，返回false时阻止提交-->
<div id="divcontent" align="center">
    <form action="${pageContext.request.contextPath}/user/addUser" method="post" onSubmit="return checkForm();">
        <table width="850px" border="10" cellspacing="10">
            <tr>
                <td style="padding: 30px;color: white"><h1>新用户注册</h1>
                    <table width="100%" border="0" cellspacing="2" class="upline">
                        <tr>
                            <!-- 设置与右边距的距离为20% ，添加显示信息身份证-->
                            <td style="text-align: right; width: 20%;color: white">身份证：</td>
                            <td style="width: 40%">
                                <!-- 添加文本框，用于填写身份证 -->
                                <input type="text" class="textinput"  id="idcard" name="u_idcard" onKeyUp="checkIdcard();"/>
                            </td>
                            <!-- 添加文本框后的提示信息 -->
                            <td colspan="2"><span id="idcardMsg"></span><font color="#999999">请输入有效的身份证</font></td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息账号 -->
                            <td style="text-align: right;color: white">账号：</td>
                            <!-- 添加文本框，用于填写账号 -->
                            <td><input type="text" class="textinput"  id="username" name="u_account" onKeyUp="checkUsername();"/>
                            </td>
                            <!-- 添加文本框后的提示信息 -->
                            <td colspan="2"><span id="usernameMsg"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font></td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息密码 -->
                            <td style="text-align: right;color: white">密码：</td>
                            <!-- 添加文本框，用于填写密码 -->
                            <td><input type="password" class="textinput"  id="password" name="u_psd" onKeyUp="checkPassword();"/></td>
                            <!-- 添加文本框后的提示信息 -->
                            <td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息重复密码 -->
                            <td style="text-align: right;color: white">重复密码：</td>
                            <td>
                                <!-- 添加文本框，用于填写重复密码 -->
                                <input type="password" class="textinput"  id="repassword" name="repassword" onKeyUp="checkConfirm();"/>
                            </td>
                            <!-- 添加文本框后的提示信息，此处为空 -->
                            <td><span id="confirmMsg"></span>&nbsp;</td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息性别 -->
                            <td style="text-align: right;color: white">性别：</td>
                            <td colspan="2">&nbsp;&nbsp;
                                <!-- 设置按钮男 -->
                                <input type="radio" name="u_sex" value="男" checked="checked" /> <span style="color:white ;">男</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <!-- 设置按钮女 -->
                                <input type="radio" name="u_sex" value="女" /> <span style="color:white ;">女</span>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息联系电话 -->
                            <td style="text-align: right;color: white">联系电话：</td>
                            <!-- 添加文本框，用于填写联系电话 -->
                            <td colspan="1">
                                <input type="text" class="textinput"
                                       style="width: 350px" id="phone" name="u_phone" />
                            </td>
                            <!-- 添加文本框后的提示信息，此处为空 -->
                            <td><span id="phoneMsg"></span></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <!-- 添加显示信息地址 -->
                            <td style="text-align: right;color: white">地址：</td>
                            <!-- 添加文本框，用于填写地址 -->
                            <td colspan="1">
                                <textarea class="textarea" id="address" name="u_address"></textarea>
                            </td>
                            <!-- 添加文本框后的提示信息，此处为空 -->
                            <td><span id="addressMsg"></span></td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                    <table width="100%" border="0" cellspacing="0">
                        <tr>
                            <!-- 离顶部距离20PX 居中布局 -->
                            <td style="padding-top: 20px; text-align: center">
                                <input type="submit"  name="submit" border="0"/>
                                <button>
                                    <a href="login.jsp" style="color:black; text-decoration: none;">返回登录</a>
                                </button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
