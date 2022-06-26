//出入库窗口中数量标签的内容输入时执行
function cg() {
    $("#savemsg").attr("disabled", true);
    var aa = $("#bg_amt").val();
    var bb = $("#bg_amt1").val();
    var cc = $("#bg_trade_type").val();
    if (cc=="出库") {
        if(parseInt(aa)<parseInt(bb)){
            alert("出库数量不能大于库存")
            $("#savemsg").attr("disabled", true);
        }
        else{$("#savemsg").attr("disabled", false);}
    }
    if (cc=="入库") {
        $("#savemsg").attr("disabled", false);
    }
}


//重置添加和编辑窗口中输入框的内容
function resetFrom() {
    $("#aoe").attr("disabled",true)
    var $vals=$("#addOrEditGoods input");
    $vals.each(function(){
        $(this).attr("style","").val("")
    });
    $("#aoe1").attr("disabled",true)
    var $vals=$("#EditModal input");
    $vals.each(function(){
        $(this).attr("style","").val("")
    });
}
//重置添加和编辑窗口中输入框的样式
function resetStyle() {
    $("#aoe").attr("disabled",false)
    var $vals=$("#addOrEditGoods input");
    $vals.each(function(){
        $(this).attr("style","")
    });
    $("#aoe1").attr("disabled",false)
    var $vals=$("#EditModal input");
    $vals.each(function(){
        $(this).attr("style","")
    });
}

//查询id对应的商品信息，并将商品信息回显到编辑或出入库的窗口中
function findGoodsById(id,doname) {
    resetStyle()
    var url = "findById?id=" + id;
    $.get(url ,function (data) {
        //如果是编辑商品，将获取的商品信息回显到编辑的窗口中
        if(doname=='edit'){

            //清空表单
            var $vals=$("#addOrEditGoods input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });
            $("#ebg_id").val(data[0].g_id);
            $("#ebg_name").val(data[0].g_name);
            $("#ebg_price").val(data[0].g_price);
            $("#ebg_type_name").val(data[0].g_type_name);
            $("#ebg_amt").val(data[0].g_amt);
        }
        //如果是入库商品，将获取的商品信息回显到入库的窗口中
        if(doname=='inputgoods'){

            //清空表单
            var $vals=$("#inoutgoods input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#savemsg").attr("disabled",true)
            $("#bg_id").val(data[0].g_id);
            $("#bg_name").val(data[0].g_name);
            $("#bg_price").val(data[0].g_price);
            $("#bg_type_name").val(data[0].g_type_name);
            $("#bg_amt").val(data[0].g_amt);
            $("#bg_trade_type").val("入库");
        }
        //如果是出库商品，将获取的商品信息回显到入库的窗口中
        if(doname=='outputgoods'){

            //清空表单
            var $vals=$("#inoutgoods input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#savemsg").attr("disabled",true)
            $("#bg_id").val(data[0].g_id);
            $("#bg_name").val(data[0].g_name);
            $("#bg_price").val(data[0].g_price);
            $("#bg_type_name").val(data[0].g_type_name);
            $("#bg_amt").val(data[0].g_amt);
            $("#bg_trade_type").val("出库");
        }
    })
}
//出库，入库
function findGoodsById2(id,doname,u_id) {
    resetStyle()
    var url = "findById?id=" + id;
    $.get(url ,function (data) {
        //如果是入库商品，将获取的商品信息回显到入库的窗口中
        if(doname=='inputgoods'){

            //清空表单
            var $vals=$("#inoutgoods input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#savemsg").attr("disabled",true)
            $("#bg_id").val(data[0].g_id);
            $("#bg_name").val(data[0].g_name);
            $("#bg_price").val(data[0].g_price);
            $("#bg_type_name").val(data[0].g_type_name);
            $("#bg_amt").val(data[0].g_amt);
            $("#bg_u_id").val(u_id);
            $("#bg_trade_type").val("入库");
        }
        //如果是出库商品，将获取的商品信息回显到入库的窗口中
        if(doname=='outputgoods'){

            //清空表单
            var $vals=$("#inoutgoods input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#savemsg").attr("disabled",true)
            $("#bg_id").val(data[0].g_id);
            $("#bg_name").val(data[0].g_name);
            $("#bg_price").val(data[0].g_price);
            $("#bg_type_name").val(data[0].g_type_name);
            $("#bg_amt").val(data[0].g_amt);
            $("#bg_u_id").val(u_id);
            $("#bg_trade_type").val("出库");
        }
    })
}

//重置添加和编辑窗口中输入框的样式
function resetStyle() {
    $("#aoe").attr("disabled",false)
    var $vals=$("#addOrEditGoods input");
    $vals.each(function(){
        $(this).attr("style","")
    });
    $("#aoe1").attr("disabled",false)
    var $vals=$("#EditModal input");
    $vals.each(function(){
        $(this).attr("style","")
    });
}
//查询id对应的权限申请信息，并将权限申请信息回显到窗口中
function findtypeById(id,doname) {
    resetStyle()
    var url = "findtypeById?u_id="+id;
    $.get(url ,function (data) {
        //如果是同意，将获取的申请信息回显到窗口中
        if(doname=='agree'){
            //清空表单
            var $vals=$("#quanxian input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#etu_id").val(data[0].u_id);
            $("#etu_type").val(data[0].ap_power);

        }

    })
}
//确认同意权限申请时执行
function agreepower(){
    var url = getProjectPath()+"/powerapply";
    $.post(url, $("#quanxian").serialize(), function (response) {
        //刷新页面
        window.location.href = getProjectPath()+"/selectAllApplyMsg";
    })
}

//查询id对应的用户信息信息，并将用户信息回显到编辑或权限修改窗口中
function finduserById(id,doname) {
    resetStyle()
    var url = "finduserById?u_id="+id;
    $.get(url ,function (data) {
        //如果是编辑用户，将获取的用户信息回显到编辑的窗口中
        if(doname=='edit'){
            //清空表单
            var $vals=$("#EditUser input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });
            $("#ebu_idcard").val(data[0].u_idcard);
            $("#ebu_id").val(data[0].u_id);
            $("#ebu_account").val(data[0].u_account);
            $("#ebu_psd").val(data[0].u_psd);
            $("#ebu_address").val(data[0].u_address);
            $("#ebu_phone").val(data[0].u_phone);
            $("#ebu_sex").val(data[0].u_sex);
            $("#ebu_type").val(data[0].u_type);
        }
        if(doname=='power'){
            //清空表单
            var $vals=$("#powerUser input");
            $vals.each(function(){
                $(this).attr("style","").val("")
            });

            $("#ebu_id1").val(data[0].u_id);
            $("#ebu_type").val(data[0].u_type);
        }
    })
}

//点击添加或编辑的窗口的确定按钮时，提交商品信息
function addOrEdit() {
    //获取表单中商品id的内容
    var ebid = $("#ebg_id").val();
    //如果表单中有商品id的内容，说明本次为编辑操作
    if (ebid > 0) {
        var url = "/goods/updateGoods";
        document.getElementById("ebg_id").setAttribute("name","g_id");
        $.post(url, $("#addOrEditGoods").serialize(), function (resonsep) {
            // alert(response.message)
            //成功后刷新页面
            // if (response.success == true) {
                window.location.href = "/goods/selectGoods";
            // }
        })
    }
    //如果表单中没有商品id，说明本次为添加操作
    else {
        $("g_id").attr("name","g_id");
        var url = "/goods/addGoods";
        $.post(url, $("#addOrEditGoods").serialize(), function (response) {
            // alert(response.message);
            //成功后刷新页面
            // if (response.success == true) {
                window.location.href ="/goods/selectGoods";
            // }
        })
    }
}
//保存编辑用户操作时执行
function Edit(){
    var url = getProjectPath()+"/updateUser";
    $.post(url, $("#EditUser").serialize(), function (response) {
        // alert(response.message)
        //成功后刷新页面
        // if (response.success == true) {
        window.location.href = getProjectPath()+"/selectAllUserMsg";
        // }
    })
}

//保存修改用户权限时执行
function power(type){
    var url = getProjectPath()+"/powerUser?User_type="+type;
    $.post(url, $("#powerUser").serialize(), function (response) {
        // alert(response.message)
        //成功后刷新页面
        // if (response.success == true) {
        window.location.href = getProjectPath()+"/selectAllUserMsg";
        // }
    })
}

//检查用户编辑窗口中信息是否填写完整
function checkval2(){
    var $inputs=$("#EditTab input")
    var count=0;
    $inputs.each(function () {
        if($(this).val()==''||$(this).val()=="不能为空！"){
            count+=1;
        }
    })
    //如果全部输入框都填写完整，解除确认按钮的禁用状态
    if(count==0){
        $("#aoe1").attr("disabled",false)
    }
}

//检查用户权限修改窗口中信息是否填写完整
function checkval3(){
    var $inputs=$("#powerTab input")
    var count=0;

    $inputs.each(function () {
        if($(this).val()==''||$(this).val()=="不能为空！"){
            count+=1;
        }
    })
    //如果全部输入框都填写完整，解除确认按钮的禁用状态
    if(count==0){
        $("#aoe2").attr("disabled",false)
    }
}

// //归还图书时执行
// function returnBook(bid) {
//     var r = confirm("确定归还图书?");
//     if (r) {
//         var url = getProjectPath()+"/book/returnBook?id=" + bid;
//         $.get(url, function (response) {
//             alert(response.message)
//             //还书成功时，刷新当前借阅的列表数据
//             if (response.success == true) {
//                 window.location.href = getProjectPath()+"/book/searchBorrowed";
//             }
//         })
//     }
// }
// //确认图书已经归还
// function returnConfirm(bid) {
//     var r = confirm("确定图书已归还?");
//     if (r) {
//         var url = getProjectPath()+"/book/returnConfirm?id=" + bid;
//         $.get(url, function (response) {
//             alert(response.message)
//             //还书确认成功时，刷新当前借阅的列表数据
//             if (response.success == true) {
//                 window.location.href = getProjectPath()+"/book/searchBorrowed";
//             }
//         })
//     }
// }

// //检查出入库信息的窗口中，商品信息填写是否完整
// function checkval1(){
//     var $inputs=$("#inoutTab input")
//     var count=0;
//     $inputs.each(function () {
//         if($(this).val()==''||$(this).val()=="不能为空！"){
//             count+=1;
//         }
//     })
//     //如果全部输入框都填写完整，解除确认按钮的禁用状态
//     if(count==0){
//         $("#savemsg").attr("disabled",false)
//     }
// }

//检查商品信息的窗口中，商品信息填写是否完整
function checkval(){
    var $inputs=$("#addOrEditTab input")
    var count=0;
    $inputs.each(function () {
        if($(this).val()==''||$(this).val()=="不能为空！"){
            count+=1;
        }
    })
    //如果全部输入框都填写完整，解除确认按钮的禁用状态
    if(count==0){
        $("#aoe").attr("disabled",false)
    }
}

//检查用户编辑新增窗口中信息是否填写完整
function checkval2(){
    var $inputs=$("#EditTab input")
    var count=0;
    $inputs.each(function () {
        if($(this).val()==''||$(this).val()=="不能为空！"){
            count+=1;
        }
    })
    //如果全部输入框都填写完整，解除确认按钮的禁用状态
    if(count==0){
        $("#aoe1").attr("disabled",false)
    }
}

//检查用户权限修改窗口中信息是否填写完整
function checkval3(){
    var $inputs=$("#powerTab input")
    var count=0;

    $inputs.each(function () {
        if($(this).val()==''||$(this).val()=="不能为空！"){
            count+=1;
        }
    })
    //如果全部输入框都填写完整，解除确认按钮的禁用状态
    if(count==0){
        $("#aoe2").attr("disabled",false)
    }
}

//页面加载完成后，给出入库窗口的输入框绑定失去焦点和获取焦点事件，以及一些合法判断
$(function() {
    var regex = /^[+]{0,1}(\d+)$/;//判断非负整数
    var $inputs=$("#inoutgoods input")
    var bg_amt1="";
    $inputs.each(function () {
        //给输入框绑定失去焦点事件,this就是代表着当前的输入框，在每个输入框都会这样
        $(this).blur(function () {
            if($(this).val()==''){
                $("#savemsg").attr("disabled",true)
                $(this).attr("style","color:red").val("不能为空！")
            }
            else if($(this).attr("name")=="g_amt1"&&bg_amt1!==$(this).val()){
                if(!regex.test($(this).val())){
                    $("#savemsg").attr("disabled",true)
                    alert("出入库数量不合法！")
                    $(this).val("")
                }
            }
            else if(cc=="出库"){
                if(aa<bb){
                    alert("出库数量不能大于库存")
                    $("#savemsg").attr("disabled", true);
                    $(this).val("")
                }
            }
            else{
                // checkval1()
            }
        }).focus(function () {
            if($(this).val()=='不能为空！'){
                $(this).attr("style","").val("")
            }else{
                $(this).attr("style","")
            }
            if($(this).attr("name")=="g_amt1"){
                bg_amt1=$(this).val();
            }
        })
    })
});

//页面加载完成后，给商品模态窗口的输入框绑定失去焦点和获取焦点事件，以及一些合法判断
$(function() {
    var regex = /^[+]{0,1}(\d+)$/;//判断非负整数
    var regex1 = /^((0{1}\.\d{1,2})|([1-9]\d*\.{1}\d{1,2})|([1-9]+\d*)|0)$/;//判断非负数
    var $inputs=$("#addOrEditGoods input")
    var eg_amt="";
    var ebg_price="";
    $inputs.each(function () {
        //给输入框绑定失去焦点事件,this就是代表着当前的输入框，在每个输入框都会这样
        $(this).blur(function () {
            if($(this).val()==''){
                $("#aoe").attr("disabled",true)
                $(this).attr("style","color:red").val("不能为空！")
            }
            else if($(this).attr("name")=="g_amt"&&eg_amt!==$(this).val()){
                if(!regex.test($(this).val())){
                    $("#aoe").attr("disabled",true)
                    alert("交易数量不合法！")
                    $(this).val("")
                }
            }
            else if($(this).attr("name")=="g_price"&&ebg_price!==$(this).val()){
                if(!regex1.test($(this).val())){
                    $("#aoe").attr("disabled",true)
                    alert("价格不合法！")
                    $(this).val("")
                }
            }
            else{
                checkval()
            }
        }).focus(function () {
            if($(this).val()=='不能为空！'){
                $(this).attr("style","").val("")
            }else{
                $(this).attr("style","")
            }
            if($(this).attr("name")=="isbn"){
                eisbn=$(this).val();
            }
            if($(this).attr("name")=="g_price"){
                ebg_price=$(this).val();
            }
        })
    })
});

//页面加载完成后，给用户编辑新增模态窗口的输入框绑定失去焦点和获取焦点事件，以及一些合法判断
$(function() {
    var regex = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;//判断身份证格式
    var $inputs=$("#EditUser input")
    var eu_idcard="";
    $inputs.each(function () {
        //给输入框绑定失去焦点事件,this就是代表着当前的输入框，在每个输入框都会这样
        $(this).blur(function () {
            if($(this).val()==''){
                $("#aoe1").attr("disabled",true)
                $(this).attr("style","color:red").val("不能为空！")
            }
            else if($(this).attr("name")=="u_idcard"&&eu_idcard!==$(this).val()){
                if(!regex.test($(this).val())){
                    $("#aoe1").attr("disabled",true)
                    alert("身份证格式不合法！")
                    $(this).val("")
                }
            }
            else{
                checkval2()
            }
        }).focus(function () {
            if($(this).val()=='不能为空！'){
                $(this).attr("style","").val("")
            }else{
                $(this).attr("style","")
            }
            if($(this).attr("name")=="isbn"){
                eu_idcard=$(this).val();
            }
        })
    })
});

//页面加载完成后，给用户权限修改模态窗口的输入框绑定失去焦点和获取焦点事件，以及一些合法判断
$(function() {
    var regex = /^[1,2,3,4]*$/;//判断权限格式
    var $inputs=$("#powerUser input")
    var eu_type="";
    $inputs.each(function () {
        //给输入框绑定失去焦点事件,this就是代表着当前的输入框，在每个输入框都会这样
        $(this).blur(function () {
            if($(this).val()==''){
                $("#aoe2").attr("disabled",true)
                $(this).attr("style","color:red").val("不能为空！")
            }
            else if($(this).attr("name")=="u_type"&&eu_type!==$(this).val()){
                if(!regex.test($(this).val())){
                    $("#aoe2").attr("disabled",true)
                    alert("权限格式不合法！")
                    $(this).val("")
                }
            }
            else{
                checkval3()
            }
        }).focus(function () {
            if($(this).val()=='不能为空！'){
                $(this).attr("style","").val("")
            }else{
                $(this).attr("style","")
            }
            if($(this).attr("name")=="isbn"){
                eu_type=$(this).val();
            }
        })
    })
});

//获取当前项目的名称
function getProjectPath() {
    //获取主机地址之后的目录，如： cloudlibrary/admin/books.jsp
    var pathName = window.document.location.pathname;
    //获取带"/"的项目名，如：/cloudlibrary
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return  projectName;
}

/**
 * 数据展示页面分页插件的参数
 * cur 当前页
 * total 总页数
 * len   显示多少页数
 * pagesize 1页显示多少条数据
 * gourl 页码变化时 跳转的路径
 * targetId 分页插件作用的id
 */
var pageargs = {
    cur: 1,
    total: 0,
    len: 5,
    pagesize:10,
    gourl:"",
    targetId: 'pagination',
    callback: function (total) {
        var oPages = document.getElementsByClassName('page-index');
        for (var i = 0; i < oPages.length; i++) {
            oPages[i].onclick = function () {
                changePage(this.getAttribute('data-index'), pageargs.pagesize);
            }
        }
        var goPage = document.getElementById('go-search');
        goPage.onclick = function () {
            var index = document.getElementById('yeshu').value;
            if (!index || (+index > total) || (+index < 1)) {
                return;
            }
            changePage(index, pageargs.pagesize);
        }
    }
}
/**
 *图书查询栏的查询参数
 * name 图书名称
 * author 图书作者
 * press 图书出版社
 */
var bookVO={
    name:'',
    author:'',
    press:''
}
/**
 *借阅记录查询栏的查询参数
 * name 图书名称
 * borrower 借阅人
 */
var recordVO={
    bookname:'',
    borrower:''
}
//数据展示页面分页插件的页码发送变化时执行
function changePage(pageNo,pageSize) {
    pageargs.cur=pageNo;
    pageargs.pagesize=pageSize;
    document.write("<form action="+pageargs.gourl +" method=post name=form1 style='display:none'>");
    document.write("<input type=hidden name='pageNum' value="+pageargs.cur+" >");
    document.write("<input type=hidden name='pageSize' value="+pageargs.pagesize+" >");
    //如果跳转的是图书信息查询的相关链接，提交图书查询栏中的参数
    if(pageargs.gourl.indexOf("book")>=0){
        document.write("<input type=hidden name='name' value="+bookVO.name+" >");
        document.write("<input type=hidden name='author' value="+bookVO.author+" >");
        document.write("<input type=hidden name='press' value="+bookVO.press+" >");
    }
    //如果跳转的是图书记录查询的相关链接，提交图书记录查询栏中的参数
    if(pageargs.gourl.indexOf("record")>=0){
        document.write("<input type=hidden name='bookname' value="+recordVO.bookname+" >");
        document.write("<input type=hidden name='borrower' value="+recordVO.borrower+" >");
    }
    document.write("</form>");
    document.form1.submit();
    pagination(pageargs);
}

function checkPIN() {
    var res = verifyCode.validate(document.getElementById("code_input").value);
    if(res){
        return true;
    }else{
        alert("验证码错误");
        document.getElementById("code_input").value = "";
        return false;
    }

}
