<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>服装库存管理</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/AdminLTE.css">
    <link rel="stylesheet" href="/css/pagination.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/pagination.js"></script>
    <script src="/js/my.js"></script>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">服装库存管理</h3>
</div>
<div class="box-body">
    <c:if test="${USER_SESSION.u_type >= 3}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <a type="button" class="btn btn-default" href="/goods_trade/Find_in"> 入库单</a>
                    <a type="button" class="btn btn-default" href="/goods_trade/Findfi_out"> 出库单</a>
                </div>
            </div>
        </div>
    </c:if>
    <!--工具栏 数据搜索 -->
    <c:if test="${USER_SESSION.u_type >= 3}">
        <div class="box-tools pull-right">
            <div class="has-feedback">
                <form action="${pageContext.request.contextPath}/goods_trade/SearchGoods" method="post">
                    <label for="sel2" class="form-label">选择要查询的类型：</label>
                    <select class="form-select" id="sel2" name="sellist2" >
                        <option value="按货物id查询">按货物id查询</option>
                        <option value="按用户id查询">按用户id查询</option>
                        <option value="按交易单id查询">按交易单id查询</option>
                    </select>
                    <input name="hiden" value="" >
                    <input class="btn btn-default" type="submit" value="查询">
                </form>
            </div>
        </div>
        <%
            HttpSession sess = request.getSession();
            String message = (String)sess.getAttribute("mes2");
            if(message == null || message.equals("")){

            }else{
        %>
        <script type="text/javascript">
            alert("<%=message %>");
        </script>
        <%
                sess.setAttribute("mes2", "");
            }
        %>

    </c:if>

    <!--工具栏 数据搜索 /-->
    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <table id="dataList1" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting_asc">交易单ID</th>
                <th class="sorting">数量</th>
                <th class="sorting">操作类型</th>
                <th class="sorting">操作时间</th>
                <th class="sorting">用户ID</th>
                <th class="sorting">商品ID</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="goods_trade" items="${G_tPageInfo.getList()}" >
                <tr>
                    <td>${goods_trade.g_trade_id}</td>
                    <td>${goods_trade.g_trade_amt}</td>
                    <td>${goods_trade.g_trade_type}</td>
                    <td>${goods_trade.g_trade_date}</td>
                    <td>${goods_trade.u_id}</td>
                    <td>${goods_trade.g_id}</td>
                    <c:if test="${USER_SESSION.u_type >= 5}">
                    <td> <a  type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                             href="${pageContext.request.contextPath}/goods_trade/DeGoods_trade?g_trade_id=${goods_trade.g_trade_id}">删除</a>
                    </td>
                    </c:if>
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
<%--分页--%>
<div class="row">
    <div class="col-lg-6 text-center">
        <span>当前页码为[${G_tPageInfo.getPageNum()}/${G_tPageInfo.getPages()}],一共有${G_tPageInfo.getTotal()}条记录</span>
    </div>
    <div class="col-lg-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg?pn=1">首页</a>
                </li>
                <c:if test="${1 == G_tPageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${1 != G_tPageInfo.pageNum}">
                    <li>
                        <a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg?pn=${G_tPageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${G_tPageInfo.navigatepageNums}" var="G_t_page">
                    <c:if test="${G_t_page == G_tPageInfo.pageNum}">
                        <li class="active"><a href="#">${G_t_page}</a></li>
                    </c:if>
                    <c:if test="${G_t_page != G_tPageInfo.pageNum}">
                        <li ><a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg?pn=${G_t_page}">${G_t_page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${G_tPageInfo.getPages() == G_tPageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${G_tPageInfo.getPages() != G_tPageInfo.pageNum}">
                    <li>
                        <a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg?pn=${G_tPageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${pageContext.request.contextPath}/goods_trade/selectAllGoods_tradeMsg?pn=${G_tPageInfo.getPages()}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>

</body>
<%--<!-- <script>--%>
<%--    /*分页插件展示的总页数*/--%>
<%--    pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize);--%>
<%--    /*分页插件当前的页码*/--%>
<%--    pageargs.cur = ${pageNum}--%>
<%--    /*分页插件页码变化时将跳转到的服务器端的路径*/--%>
<%--    pageargs.gourl = "${gourl}"--%>
<%--    /*保存搜索框中的搜索条件，页码变化时携带之前的搜索条件*/--%>
<%--    bookVO.name = "${search.name}"--%>
<%--    bookVO.author = "${search.author}"--%>
<%--    bookVO.press = "${search.press}"--%>
<%--    /*分页效果*/--%>
<%--    pagination(pageargs);--%>
<%--</script> -->--%>
</html>