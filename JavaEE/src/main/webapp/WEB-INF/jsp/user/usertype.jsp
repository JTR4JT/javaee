<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户权限申请</title>
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
    <h3 class="box-title">用户权限申请</h3>
</div>
<div class="box-body">
    <c:if test="${USER_SESSION.u_type >= 3}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <a type="button" class="btn btn-default" href="/apply/Findfi_state"> 已处理</a>
                    <a type="button" class="btn btn-default" href="/apply/Find_state"> 未处理</a>
                </div>
            </div>
        </div>
    </c:if>
    <!--工具栏 数据搜索 -->
    <c:if test="${USER_SESSION.u_type >= 3}">
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="/apply/SearchApply" method="post">
                <label for="sel1" class="form-label">选择要查询的类型：</label>
                <!-- 用户ID：<input name="" value="${search.name}">&nbsp&nbsp&nbsp&nbsp
                用户姓名：<input name="" value="${search.author}">&nbsp&nbsp&nbsp&nbsp
                用户类型名：<input name="" value="${search.press}">&nbsp&nbsp&nbsp&nbsp -->
                <select class="form-select" id="sel1" name="sellist1" >
                    <option value="按用户id查询">按用户id查询</option>
                    <option value="按用户申请权限等级查询">按用户申请权限等级查询</option>
                </select>
                <input name="hiden" value="" type="text">
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
        <%
            HttpSession sess = request.getSession();
            String message = (String)sess.getAttribute("mes1");
            if(message == null || message.equals("")){
            }else{
        %>
        <script type="text/javascript">
            alert("<%=message %>");
        </script>
        <%
                sess.setAttribute("mes1","");
            }
        %>


    </c:if>
    </div>
    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <table id="dataList3" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting_asc">申请人ID</th>
                <th class="sorting">申请等级</th>
                <th class="sorting">申请日期</th>
                <th class="sorting">状态</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${applyPageInfo.getList()}" var="apply">
            <tr>
                <td>${apply.u_id}</td>
                <td>${apply.ap_power}</td>
                <td>${apply.ap_date}</td>
                <td>${apply.ap_state}</td>
                <td class="text-center">
                    <c:if test="${USER_SESSION.u_type == 5 && apply.ap_state eq '待处理' }">
                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                            data-target="#quanxianguanli" onclick="findtypeById(${apply.u_id},'agree')"> 同意</button>
                    <a type="button" class="btn bg-olive btn-xs"
                       href="Detype?u_id=${apply.u_id}"> 不同意</a>
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

<!-- 确认修改的模态窗口 -->
<div class="modal fade" id="quanxianguanli" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">权限信息</h3>
            </div>
            <div class="modal-body">
                <form id="quanxian">
                    <table id="quanxianTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>申请人ID</td>
                            <td><input class="form-control" readonly name="u_id" id="etu_id"></td>
                            <td>申请等级</td>
                            <td><input class="form-control" readonly name="u_type" id="etu_type"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true"  onclick="agreepower()">确认</button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--分页--%>
<div class="row">
    <div class="col-lg-6 text-center">
        <span>当前页码为[${applyPageInfo.getPageNum()}/${applyPageInfo.getPages()}],一共有${applyPageInfo.getTotal()}条记录</span>
    </div>
    <div class="col-lg-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg?pn=1">首页</a>
                </li>
                <c:if test="${1 == applyPageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${1 != applyPageInfo.pageNum}">
                    <li>
                        <a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg?pn=${applyPageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${applyPageInfo.navigatepageNums}" var="apply_page">
                    <c:if test="${apply_page == applyPageInfo.pageNum}">
                        <li class="active"><a href="#">${apply_page}</a></li>
                    </c:if>
                    <c:if test="${apply_page != applyPageInfo.pageNum}">
                        <li ><a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg?pn=${apply_page}">${apply_page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${applyPageInfo.getPages() == applyPageInfo.pageNum}">
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${applyPageInfo.getPages() != applyPageInfo.pageNum}">
                    <li>
                        <a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg?pn=${applyPageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${pageContext.request.contextPath}/apply/selectAllApplyMsg?pn=${applyPageInfo.getPages()}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>


</body>
<!-- <script>
    /*分页插件展示的总页数*/
    pageargs.total = Math.ceil(${pageResult.total}/pageargs.pagesize);
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
</script> -->
</html>