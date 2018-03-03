<%@ page language="java" 
	contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我的订单 - 学院商城</title>
    <link href="../css/orders.css" rel="Stylesheet"/>
    <link href="../css/header.css" rel="Stylesheet"/>
    <link href="../css/footer.css" rel="Stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
</head>
<body>
<!-- 页面顶部-->
<c:import url="include/header.jsp"></c:import>

<!-- nav主导航-->
<c:import url="include/nav.jsp"></c:import>

<!-- 我的订单导航栏-->
<c:import url="include/nav_order.jsp"></c:import>

<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
    <!-- 左边栏-->
    <c:import url="include/left_side_menu.jsp"></c:import>
    
    <!-- 右边栏-->
    <!--个人信息头部-->
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span >
            	<a href="user_center.do">我的信息</a>
            </span>
            <span class="rs_header_active">
            	<a href="###">安全管理</a>
            </span>
        </div>

        <!--安全管理 -->
        <div class="rs_content">
            <p class="change_password_title">更改密码</p>
            <div class="new_password">
                <span class="word">输入旧密码：</span>
                <input id="old_pwd" type="password"/>
                <span class="change_hint"></span>
            </div>
            <div class="new_password">
                <span class="word">输入新密码：</span>
                <input id="new_pwd" type="password"/>
                <span class="change_hint"></span>
            </div>
            <div class="confirm_password">
                <span class="word">确认新密码：</span>
                <input id="new_pwd_confirm" type="password"/>
                <span class="confirm_hint"></span>
            </div>
            <div>
                <a href="###" class="save_password"
                	onclick="savePassword()">
                	保存更改
                </a>
            </div>
        </div>


    </div>
</div>

<!-- 品质保障，私人定制等-->
<div id="foot_box">
    <div class="icon1 lf">
        <img src="../images/footer/icon1.png" alt=""/>

        <h3>品质保障</h3>
    </div>
    <div class="icon2 lf">
        <img src="../images/footer/icon2.png" alt=""/>

        <h3>私人定制</h3>
    </div>
    <div class="icon3 lf">
        <img src="../images/footer/icon3.png" alt=""/>

        <h3>学员特供</h3>
    </div>
    <div class="icon4 lf">
        <img src="../images/footer/icon4.png" alt=""/>

        <h3>专属特权</h3>
    </div>
</div>
<!-- 页面底部-->
<c:import url="include/footer.jsp"></c:import>

</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" language="javascript">
function savePassword() {
	// 获取输入框中的数据
	var oldPwd = $("#old_pwd").val();
	var newPwd = $("#new_pwd").val();
	var newPwdConfirm = $("#new_pwd_confirm").val();
	
	// 检查数据的有效性（忽略）
	
	// 提交
	$.ajax({
		"url": "update_password.do",
		"data": {
				"old_password" : oldPwd,
				"new_password" : newPwd
			},
		"type": "POST",
		"dataType": "json",
		"success": function(obj) {
			alert(obj.message);
		}
	});
}

//设置左侧菜单默认展开哪一组
$(function() {
	showMenuItem(".count_managment");
});
</script>
</html>