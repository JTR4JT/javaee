//待验证的输入数据
var idcardObj;//身份证
var usernameObj;//会员名
var passwordObj;//密码
var confirmObj;//重复密码
var phoneObj;
var addressObj;

//对应的提示信息
var idcardMsg;//身份证提示信息
var usernameMsg;//会员名提示信息
var passwordMsg;//密码提示信息
var confirmMsg;//重复密码提示信息
var phoneMsg;
var addressMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
    idcardObj = document.getElementById("idcard");//获取用户填写的身份证
    usernameObj = document.getElementById("username");//获取用户填写的账号
    passwordObj = document.getElementById("password");//获取用户填写的密码
    confirmObj = document.getElementById("repassword");//获取用户填写的重复密码
    phoneObj = document.getElementById("phone");
    addressObj = document.getElementById("address")

    idcardMsg = document.getElementById("idcardMsg");//获取身份证提示信息
    usernameMsg = document.getElementById("usernameMsg");//获取账号提示信息
    passwordMsg = document.getElementById("passwordMsg");//获取密码提示信息
    confirmMsg = document.getElementById("confirmMsg");//获取重复密码提示信息
    phoneMsg = document.getElementById("phoneMsg");
    addressMsg = document.getElementById("addressMsg");
};
//总入口
function checkForm() {			// 验证整个表单
    var bIdcard = checkIdcard();//验证身份证
    var bUsername = checkUsername();//验证账号
    var bPassword = checkPassword();//验证密码
    var bConfirm = checkConfirm();//验证重复密码
    var bphone = checkPhone();
    var baddress = checkAddress();
    console.log(bIdcard);
    return bUsername && bPassword && bConfirm && bIdcard && bphone && baddress;	// return false后, 事件将被取消
}
//举例
function checkIdcard() {			// 验证身份证
    var regex = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;//判断身份证格式
    var value =idcardObj.value;//获取用户填写内容，将其赋予value
    var msg = "";  //提示信息为空
    if (!value)   //判断身份证是否为空
        msg = "身份证必须填写：";
    else if (!regex.test(value))  //判断格式是否正确
        msg = "身份证格式不合法：";
        idcardMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    idcardObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

function checkUsername(){       //验证账号
    var regex = /^[^0-9][a-zA-Z0-9*_]{0,9}$/;//判断首位是不是字母
    var value =usernameObj.value;//获取用户填写内容，将其赋予value
    var msg = "";
    if (!value)
        msg = "账号必须填写：";
    else if (!regex.test(value))
        msg = "账号格式不合法：";
    else if (value.length>10)
        msg = "账号格式不合法：";
    usernameMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    usernameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

function checkPassword(){        //验证密码
    var value =passwordObj.value;//获取用户填写内容，将其赋予value
    var msg = "";
    if (!value)
        msg = "密码必须填写：";
    else if (value.length<6||value.length>16)
        msg = "密码格式不合法：";
    passwordMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    passwordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

function checkConfirm(){       //验证重复密码
    var value =passwordObj.value;//获取用户填写内容，将其赋予value
    var value1 =confirmObj.value;//获取用户填写内容，将其赋予value1
    var msg = "";
    if (value!=value1)
        msg = "密码不一致  ";
    confirmMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    confirmObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

function checkPhone(){       
    var value =phoneObj.value;//获取用户填写内容，将其赋予value
    var msg = "";
    if (!value)
        msg = "电话必须填写";
    phoneMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    phoneObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

function checkAddress(){       //验证重复密码
    var value =addressObj.value;//获取用户填写内容，将其赋予value
    var msg = "";
    if (!value)
        msg = "地址必须填写";
    addressMsg.innerHTML = msg;   //显示提示信息
    // 根据消息结果改变tr(即*Obj.parentNode.parentNode访问的对象)的颜色
    addressObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    return msg == "";//提示信息清空
}

