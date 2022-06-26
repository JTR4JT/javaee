<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/8
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8">
    <title>商品推荐</title>
    <%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
    <%--    <script type="text/javascript"src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pagination.js"></script>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js"></script>--%>
    <script type="text/javascript">
        function searchFuzzy()
        {
            var Msg = $("#search").val()
            var herfMsg = 'http://localhost:8080/goods_type/selectGoodsTypeByFuzzy?g_type_name='+Msg;
            window.location.href= herfMsg;
        };
        //刷新当前页面
        function refresh(){
            window.location.reload();
        }
        /*全选或者全不选*/
        $(function () {
            $("#checkAll").click(function(){
                //这些原生的属性是dom里的，attr用来获取自定义的，dom获取原生的
                //alert($(this).attr("checked"))//返回unDeified
                //alert($(this).prop("checked"));//prop修改和读取原生的dom属性
                $(".eachCheck").prop("checked",$(this).prop("checked"));
            });
            $(document).on("click",".eachCheck",function () {
                var flag = $(".eachCheck:checked").length==$(".eachCheck").length;
                $("#checkAll").prop("checked",flag);

            });
            //绑定单击事件
            $("#deleteAll").click(function () {
                var brand_name = "";
                var ids = "";
               $.each( $(".eachCheck:checked"),function () {
                   brand_name+=$(this).parents("tr").find("td:eq(2)").text()+",";
                    ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
               });
               // 去除多余的符号
              brand_name = brand_name.substring(0,brand_name.length-1);
              ids = ids.substring(0,ids.length-1);
               if(confirm("确定要与品牌 "+brand_name+" 解约吗？")){
                   //发送请求
                   var delete_href = "/goods_type/deleteGoodsType?ids="+ids;
                    $.get(delete_href,function (data) {
                        refresh()
                    })
               }
            });
        });
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini">
<!--数据展示头部-->
<div class="box-header with-border">
    <h3 class="box-title">商品类型信息</h3>
</div>
<div class="row">
    <c:if test="${USER_SESSION.u_type >=3}">
        <div  class="col-sm-1 p-3"> <button id="deleteAll" type="button" class="btn btn-info" >删除</button></div>

        <div class="col-sm-1 p-3"><button type="button" class="btn btn-info"  data-toggle="modal" data-target="#inout_type_Modal">增加</button></div>
    </c:if>
    <div class="col-sm-2 p-3 text-center offset-md-5"><input id="search" class="form-control" type="text" placeholder="商品类型名"></div>
    <div class="col-sm-1 p-3"> <button type="button" class="btn btn-info" onclick="searchFuzzy()">搜索</button></div>


</div>
<!--数据展示头部-->
<!--数据展示内容区-->
<div class="box-body">
    <!-- 数据表格 -->
    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
        <thead>
        <tr>
            <th class="sorting_asc"><input id="checkAll" type="checkbox" ></th>
            <th class="sorting_asc">商品类型ID</th>
            <th class="sorting">商品类型名</th>
            <c:if test="${USER_SESSION.u_type >=3}">
                <th class="sorting">操作</th>
            </c:if>


        </tr>
        </thead>
        <tbody>
        <c:forEach var="g_ty" items="${goods_typePageInfo.getList()}" >
            <tr>
                <td><input class="eachCheck" type="checkbox"></td>
                <td>${g_ty.g_type_id}</td>
                <td>${g_ty.g_type_name}</td>
                <c:if test="${USER_SESSION.u_type >=3}">
                    <td class="text-center">
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/goods_type/toUpdateGoodsType?id=${g_ty.g_type_id}">更改</a>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/goods_type/deleteGoodsType?ids=${g_ty.g_type_id}">删除</a>
                    </td>
                </c:if>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 数据表格 /-->
</div>
            <%--分页--%>
<div class="row">
    <div class="col-lg-6 text-center">
        <span>当前页码为[${goods_typePageInfo.getPageNum()}/${goods_typePageInfo.getPages()}],一共有${goods_typePageInfo.getTotal()}条记录</span>
    </div>
    <div class="col-lg-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg?pn=1">首页</a>
                </li>
                <c:if test="${1 == goods_typePageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${1 != goods_typePageInfo.pageNum}">
                <li>
                    <a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg?pn=${goods_typePageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                    </c:if>

                <c:forEach items="${goods_typePageInfo.navigatepageNums}" var="goods_type_page">
                    <c:if test="${goods_type_page == goods_typePageInfo.pageNum}">
                        <li class="active"><a href="#">${goods_type_page}</a></li>
                    </c:if>
                    <c:if test="${goods_type_page != goods_typePageInfo.pageNum}">
                        <li ><a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg?pn=${goods_type_page}">${goods_type_page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${goods_typePageInfo.getPages() == goods_typePageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${goods_typePageInfo.getPages() != goods_typePageInfo.pageNum}">
                <li>
                    <a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg?pn=${goods_typePageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                    </c:if>

                <li><a href="${pageContext.request.contextPath}/goods_type/selectAllGoodsTypeMsg?pn=${goods_typePageInfo.getPages()}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
<%--<div class="container mt-3 text-center">--%>

<%--    <ul class="pagination">--%>
<%--        <li class="page-item"><a class="page-link" href="#">《《</a></li>--%>
<%--        <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--        <li class="page-item "><a class="page-link" href="#">2</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">》》</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<jsp:include page="/goods_type/toTypeModal"></jsp:include>
</body>
</html>

