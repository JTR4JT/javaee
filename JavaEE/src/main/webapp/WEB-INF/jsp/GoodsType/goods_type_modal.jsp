<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/2
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 默认是隐藏的 -->
<div class="modal fade" id="inout_type_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">商品类型信息</h3>
            </div>
            <div class="modal-body">
                <form id="inoutgoods" action="${pageContext.request.contextPath}/goods_type/addGoods_type">
                    <table id="inoutTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>商品类型名称</td>
                            <td><input class="form-control"  name="g_type_name" id="g_type_name" value=""></td>
                        </tr>
                    </table>
                    <div class="modal-footer">
                        <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>

                        <button type="submit" class="btn btn-success" id="savetypemsg">保存
                        </button>
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
