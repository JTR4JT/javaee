<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/2
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品推荐</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini">
<!--数据展示头部-->
<div class="box-header with-border">
    <h3 class="box-title">商品推荐</h3>
</div>
<!--数据展示头部-->
<!--数据展示内容区-->
<div class="box-body text-center">
    <!-- 数据表格 -->
    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
        <thead>
        <tr>
            <th class="sorting_asc">商品名称</th>
            <th class="sorting">商品ID</th>
            <th class="sorting">商品单价</th>
            <th class="sorting">商品类型名</th>
            <th class="sorting">商品可销售量</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="${requestScope.get('list_goodsall')}" >
            <tr>
                <td> ${goods.g_name}</td>
                <td>${goods.g_id}</td>
                <td>${goods.g_price}</td>
                <td>${goods.g_type_name}</td>
                <td>${goods.g_amt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 数据表格 /-->
</div>
<!-- 数据展示内容区/ -->
<%--引入存放模态窗口的页面--%>
<jsp:include page="/main/tochange"></jsp:include>
</body>
</html>
