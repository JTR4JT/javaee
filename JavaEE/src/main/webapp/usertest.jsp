<%--
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/10
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">用户管理</h3>
</div>
<div class="box-body">
    <%--新增按钮：如果当前登录用户权限大于等于4，页面展示新增按钮--%>
    <c:if test="${USER_SESSION.u_type >=4}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal"
                            data-target="#EditModal" onclick="resetFrom()"> 新增
                    </button>
                </div>
            </div>
        </div>
    </c:if>
    <%--新增按钮 /--%>
    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/user/search" method="post">
                <label for="sel1" class="form-label">选择要查询的类型：</label>
                <!-- 用户ID：<input name="" value="${search.name}">&nbsp&nbsp&nbsp&nbsp
                用户姓名：<input name="" value="${search.author}">&nbsp&nbsp&nbsp&nbsp
                用户类型名：<input name="" value="${search.press}">&nbsp&nbsp&nbsp&nbsp -->
                <select class="form-select" id="sel1" name="sellist1" >
                    <option>按用户身份证</option>
                    <option>按用户ID</option>
                    <option>按用户性别</option>
                    <option>按用户账号</option>
                    <option>按用户密码</option>
                    <option>按用户地址</option>
                    <option>按联系方式</option>
                    <option>按用户权限</option>
                </select>
                <input name="" value="">
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <!--工具栏 数据搜索 /-->
    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting_asc">用户身份证</th>
                <th class="sorting">用户ID</th>
                <th class="sorting">用户性别</th>
                <th class="sorting">用户账号</th>
                <th class="sorting">用户密码</th>
                <th class="sorting">用户地址</th>
                <th class="sorting">联系方式</th>
                <th class="sorting">用户权限</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="" var="user">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="text-center">
                    <c:if test="${USER_SESSION.u_type ==5}">
                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#powerModal"
                            onclick="finduserById(${user.u_id},'power')"> 权限修改
                    </button>
                    </c:if>
                    <c:if test="${USER_SESSION.u_type >=4}">
                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                data-target="#EditModal" onclick="finduserById(${user.u_id},'edit')"> 编辑
                        </button>
                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"> 删除</button>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--数据表格/-->
        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>
    </div>
    <!--数据列表/-->
</div>
<!-- /.box-body -->
<%--引入存放模态窗口的页面--%>
<%--<jsp:include page="/admin/goods_modal.jsp"></jsp:include>--%>


<!-- 编辑的模态窗口 -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <h3 id="myModalLabel">用户信息</h3>
            </div>
            <div class="modal-body">
                <form id="EditUser">
                    <span><input type="hidden" id="ebu_id" name="id"></span>
                    <table id="EditTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>用户身份证</td>
                            <td><input class="form-control" placeholder="用户身份证" name="u_idcard" id="ebu_idcard"></td>
                            <td>用户账号</td>
                            <td><input class="form-control" placeholder="用户账号" readonly name="u_account" id="ebu_account"></td>
                        </tr>
                        <tr>
                            <td>用户密码</td>
                            <td><input class="form-control" placeholder="用户密码" name="u_psd" id="ebu_psd"></td>
                            <td>用户地址</td>
                            <td><input class="form-control" placeholder="用户地址" name="u_address" id="ebu_address"></td>
                        </tr>
                        <tr>
                            <td>联系方式</td>
                            <td><input class="form-control" placeholder="联系方式" name="u_phone" id="ebu_phone"></td>
                            <td>用户权限</td>
                            <td><input class="form-control" placeholder="用户权限" readonly name="u_type" id="ebu_type"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success"  onclick="checkval2()">确认</button>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="aoe1" disabled onclick="Edit()">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 权限修改的模态窗口 -->
<div class="modal fade" id="powerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel1">用户信息</h3>
            </div>
            <div class="modal-body">
                <form id="powerUser">
                    <span><input type="hidden" id="ebu_id1" name="id"></span>
                    <table id="powerTab" class="table table-bordered table-striped" width="800px">
                        <td>用户权限</td>
                        <td><input class="form-control" placeholder="用户权限" name="u_type" id="pbu_type"></td>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success"  onclick="checkval3()">确认</button>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="aoe2" disabled onclick="power()">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    /*分页插件展示的总页数*/
    pageargs.total = Math.ceil("${pageResult.total}/pageargs.pagesize");
    /*分页插件当前的页码*/
    pageargs.cur = ${pageNum}
        /*分页插件页码变化时将跳转到的服务器端的路径*/
        pageargs.gourl = "${gourl}"
    /*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/
    bookVO.name = "${search.name}"
    bookVO.author = "${search.author}"
    bookVO.press = "${search.press}"
    /*分页效果*/
    pagination(pageargs);
</script>
</html>

