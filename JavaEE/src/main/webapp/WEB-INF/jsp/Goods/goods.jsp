<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <script type="text/javascript">
        function find()
        {
            var Type = $("#sel1").val()
            var Msg = $("#msg").val()
            var regex = /(^[0-9]*\.([0-9]{1}\d*)$)|(^[0-9]*$)/;
            var flag = (Type=="按商品ID")||(Type=="按商品可销售量")||(Type=="按商品单价")
            console.log(flag)
            if(Msg == null||Msg == "")
            {
                alert("输入不能为空哦")
            }else {
                if (flag&&!regex.test(Msg))
                {
                    alert("你输入的信息<"+Msg+">貌似不正确")
                }
                else {
                    var herfMsg = 'http://localhost:8080/goods/selectGoodsByEach?type='+Type+'&msg='+Msg;
                    window.location.href= herfMsg;
                }
            };
            }

        //刷新当前页面
        function refresh(){
            window.location.reload();
        }
    </script>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">商品管理</h3>
</div>
<div class="box-body">
    <%--新增按钮：如果当前登录用户权限大于等于4，页面展示新增按钮--%>
    <c:if test="${USER_SESSION.u_type >=3}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal"
                            data-target="#addOrEditModal" onclick="resetFrom()"> 新增
                    </button>
                </div>
            </div>
        </div>
    </c:if>
    <%--新增按钮 /--%>
    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
<%--            <form  method="post">--%>
                <label for="sel1" class="form-label">选择要查询的类型：</label>
<%--                <!-- 商品名称：<input name="g_name" value="${search.g_name}">&nbsp&nbsp&nbsp&nbsp--%>
<%--                商品单价：<input name="g_price" value="${search.g_price}">&nbsp&nbsp&nbsp&nbsp--%>
<%--                商品类型名：<input name="g_type_name" value="${search.g_type_name}">&nbsp&nbsp&nbsp&nbsp -->--%>
                <select class="form-select" id="sel1" name="sellist1" >
                    <option>按商品名称</option>
                    <option>按商品ID</option>
                    <option>按商品单价</option>
                    <option>按商品类型名</option>
                    <option>按商品可销售量</option>
                </select>
                <input id="msg"  >
                <input class="btn btn-default" type="submit" value="查询" onclick="find()">
<%--            </form>--%>
        </div>
    </div>
    <!--工具栏 数据搜索 /-->
    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting_asc">商品名称</th>
                <th class="sorting">商品ID</th>
                <th class="sorting">商品单价</th>
                <th class="sorting">商品类型名</th>
                <th class="sorting">商品可销售量</th>
                <c:if test="${USER_SESSION.u_type >=3}">
                    <th class="sorting">操作</th>
                </c:if>

            </tr>
            </thead>
            <tbody>
                <c:forEach var="goods" items="${goodsPageInfo.getList()}" >
                <tr>
                    <td>${goods.g_name}</td>
                    <td>${goods.g_id}</td>
                    <td>${goods.g_price}</td>
                    <td>${goods.g_type_name}</td>
                    <td>${goods.g_amt}</td>
                    <c:if test="${USER_SESSION.u_type >=3}">
                        <td class="text-center">
                            <c:if test="${USER_SESSION.u_type >=4}">
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#inoutModal"
                                        onclick="findGoodsById2(${goods.g_id},'inputgoods',${USER_SESSION.u_id})"> 入库
                                </button>
                                <c:if test="${goods.g_amt !=0}">
                                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#inoutModal"
                                            onclick="findGoodsById2(${goods.g_id},'outputgoods',${USER_SESSION.u_id})"> 出库
                                    </button>
                                </c:if>
                                <c:if test="${goods.g_amt ==0}">
                                    <button type="button" class="btn bg-olive btn-xs" disabled="true">出库</button>
                                </c:if>
                            </c:if>
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                        data-target="#addOrEditModal" onclick="findGoodsById(${goods.g_id},'edit')"> 编辑
                                </button>
                                <a href="/goods/deleteGoodsById?id=${goods.g_id}" type="button" class="btn bg-olive btn-xs" data-toggle="modal"> 删除</a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--数据表格/-->

    </div>
        <%--分页插件--%>
        <div class="row">
            <div class="col-lg-6 text-center">
                <span>当前页码为[${goodsPageInfo.getPageNum()}/${goodsPageInfo.getPages()}],一共有${goodsPageInfo.getTotal()}条记录</span>
            </div>
            <div class="col-lg-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="${pageContext.request.contextPath}/goods/selectGoods?pn=1">首页</a>
                        </li>
                        <c:if test="${1 == goodsPageInfo.pageNum}">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${1 != goodsPageInfo.pageNum}">
                            <li>
                                <a href="${pageContext.request.contextPath}/goods/selectGoods?pn=${goods_typePageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${goodsPageInfo.navigatepageNums}" var="goods_page">
                            <c:if test="${goods_page == goodsPageInfo.pageNum}">
                                <li class="active"><a href="#">${goods_page}</a></li>
                            </c:if>
                            <c:if test="${goods_page != goodsPageInfo.pageNum}">
                                <li ><a href="${pageContext.request.contextPath}/goods/selectGoods?pn=${goods_page}">${goods_page}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${goodsPageInfo.getPages() == goodsPageInfo.pageNum}">
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${goodsPageInfo.getPages() != goodsPageInfo.pageNum}">
                            <li>
                                <a href="${pageContext.request.contextPath}/goods/selectGoods?pn=${goodsPageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/goods/selectGoods?pn=${goodsPageInfo.getPages()}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    <!--数据列表/-->
</div>
<!-- /.box-body -->
<%--引入存放模态窗口的页面--%>
<jsp:include page="/main/tochange"></jsp:include>

<!-- 添加和编辑商品的模态窗口 -->
<div class="modal fade" id="addOrEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">商品信息</h3>
            </div>
            <div class="modal-body">
                <form id="addOrEditGoods">
                    <span><input type="hidden" id="ebg_id" name="id"></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>商品名称</td>
                            <td><input class="form-control" placeholder="商品名称" name="g_name" id="ebg_name"></td>
                            <td>商品可销售量</td>
                            <td><input class="form-control" placeholder="商品可销售量" name="g_amt" id="ebg_amt"></td>
                        </tr>
                        <tr>
                            <td>商品单价</td>
                            <td><input class="form-control" placeholder="商品单价" name="g_price" id="ebg_price"></td>
                            <td>商品类型名</td>
                            <td>
<%--                                <input class="form-control" placeholder="商品类型名" name="g_type_name" id="ebg_type_name">--%>

                                <select class="form-control form-select form-select-lg" name="g_type_name" id="ebg_type_name">
                                    <c:forEach items="${goods_types}" var="g_t">
                                        <option>${g_t.g_type_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success"  onclick="checkval()">确认</button>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="aoe" disabled onclick="addOrEdit()">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>

</html>