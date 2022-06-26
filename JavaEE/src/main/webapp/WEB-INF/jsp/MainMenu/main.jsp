<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>服装库存管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_all-skins.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js"></script>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css">--%>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/iconfont.js"></script>--%>
  
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframeid = document.getElementById("iframe");
            if (document.getElementById) {
                /*设置 内容展示区的高度等于页面可视区的高度*/
                iframeid.height = document.documentElement.clientHeight;
            }
        }
        // 设置长时间未操作退出
        $(function(){
            // 监听用户长时间不操作后自动退出登录
            let currtentTime = new Date().getTime(),
                lastTime = new Date().getTime()
            // 设置自动失效时长,20分钟
            const diff = 1000 * 60 * 20;
            $(document).on('mouseover', function () {
                lastTime = new Date().getTime();
            });
            let timer = setInterval(function () {
                currentTime = new Date().getTime();
                if (currentTime - lastTime > diff) {
                    //  清除登录状态操作
                    document.getElementById("quit").click();
                    clearInterval(timer);
                }
            }, 1000);
        })

    </script>
</head>

<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper shake-chunk shake-constant shake-constant--hover dib">
    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/main/tomain" class="logo">
            <span class="logo-lg"><b>服装库存管理系统</b></span>
        </a>
        <!-- 头部导航 -->
        <nav class="navbar navbar-static-top">
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="${pageContext.request.contextPath}/user/userPersonalMsg" target="iframe">
                            <img src="${pageContext.request.contextPath}/img/user.jpg" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">${USER_SESSION.u_account}</span>
                        </a>
                    </li>
                    <c:if test="${USER_SESSION.u_type != 5}">
                    <li class="dropdown user user-menu">
                        <a href="${pageContext.request.contextPath}/apply/powerRequestMsg" target="iframe">
                            <span class="hidden-xs">权限申请</span>
                        </a>
                    </li>
                    </c:if>
                    <li class="dropdown user user-menu">
                        <a id="quit" href="${pageContext.request.contextPath}/login.jsp">
                            <span class="hidden-xs">注销</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li >
                    <a href="${pageContext.request.contextPath}/main/tomain">
                        <i class="fa fa-dashboard"></i> <span>首页</span>
                    </a>
                </li>
<%--                <c:if test="${USER_SESSION.u_type >=2}">--%>
<%--                    <li >--%>
<%--                        <a href="${pageContext.request.contextPath}/user/allUser" target="iframe">--%>
<%--                            <i class="fa fa-circle-o"></i>用户管理--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
                <c:if test="${USER_SESSION.u_type >= 2 }">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/selectAllUserMsg" target="iframe">
                            <i class="fa fa-circle-o"></i>用户管理
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER_SESSION.u_type == 1 }">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/finduserById1?u_id=${USER_SESSION.u_id}" target="iframe">
                            <i class="fa fa-circle-o"></i>用户管理
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER_SESSION.u_type >= 2 }">
                    <li >
                        <a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg" target="iframe">
                            <i class="fa fa-circle-o"></i>用户权限申请管理
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER_SESSION.u_type == 1 }">
                    <li >
                        <a href="${pageContext.request.contextPath}/apply/apply1?u_id=${USER_SESSION.u_id}" target="iframe">
                            <i class="fa fa-circle-o"></i>用户权限申请管理
                        </a>
                    </li>
                </c:if>

                <li>
                    <a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg" target="iframe">
                        <i class="fa fa-circle-o"></i>商品类型管理
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/goods/selectGoods" target="iframe">
                        <i class="fa fa-circle-o"></i>商品管理
                    </a>
                </li>
                <c:if test="${USER_SESSION.u_type >= 3 }">
                    <li >
                        <a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg" target="iframe">
                            <i class="fa fa-circle-o"></i>服装库存单管理
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER_SESSION.u_type < 3 }">
                    <li >
                        <a href="${pageContext.request.contextPath}/goods_trade/goods_trade1?u_id=${USER_SESSION.u_id}" target="iframe">
                            <i class="fa fa-circle-o"></i>服装库存单管理
                        </a>
                    </li>
                </c:if>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->
    <!-- 内容展示区域 -->
    <div class="content-wrapper">
        <iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()"
                frameborder="0" src="${pageContext.request.contextPath}/goods/selectNewgoods"></iframe>
    </div>
</div>
</body>
</html>