<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/2
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="inoutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">商品信息</h3>
            </div>
            <div class="modal-body">
                <form id="inoutgoods" action="${pageContext.request.contextPath}/goods_trade/addGoodsTrade">
                    <table id="inoutTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>商品名称</td>
                            <td><input class="form-control" readonly name="g_name" id="bg_name" value=""></td>
                            <td>商品ID</td>
                            <td><input class="form-control" readonly name="g_id" id="bg_id"></td>
                        </tr>
                        <tr>
                            <td>商品单价</td>
                            <td><input class="form-control" readonly name="g_price" id="bg_price"></td>
                            <td>商品类型名</td>
                            <td><input class="form-control" readonly name="g_type_name" id="bg_type_name"></td>
                        </tr>
                        <tr>
                            <td>商品可销售量</td>
                            <td><input class="form-control" readonly name="g_amt" id="bg_amt"></td>
                            <td>流动类型</td>
                            <td><input class="form-control" readonly name="g_trade_type" id="bg_trade_type"></td>

                        </tr>
                        <tr>
                            <td>操作数量<br/><span style="color: red">*</span></td>
                            <%--数量控件中的内容改变时，调用js文件中的cg()方法--%>
                            <td><input class="form-control" name="g_trade_amt" id="bg_amt1" oninput="cg()"></td>
<%--                            <td>操作人</td>--%>
                            <td><input type="hidden" class="form-control" readonly name="u_id" id="bg_u_id"></td>
                        </tr>
                    </table>
                                <div class="modal-footer">
                                    <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                                    <button class="btn btn-success"  type="submit"
                                             id="savemsg">保存
                                    </button>
                                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
                                </div>
                </form>
            </div>
<%--            <div class="modal-footer">--%>
<%--                &lt;%&ndash;点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法&ndash;%&gt;--%>
<%--                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="inoutgoods()"--%>
<%--                        disabled="true" id="savemsg">保存--%>
<%--                </button>--%>
<%--                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
