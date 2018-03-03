<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学子商城登陆页面</title>
<link href="../css/header.css" rel="stylesheet" />
<link href="../css/footer.css" rel="stylesheet" />
<link href="../css/animate.css" rel="stylesheet" />
<link href="../css/login.css" rel="stylesheet" />
</head>
<body>
	<!-- 页面顶部-->
	<header id="top">
	<div class="top">
		<img src="../images/header/logo.png" alt="" /> <span>欢迎登录</span>
	</div>
	</header>
	<div id="container">
		<div id="cover" class="rt">
			<form id="login-form" method="post" name="form1">
				<div class="txt">
					<p>
						登录学子商城<span><a href="register.do">新用户注册</a></span>
					</p>
					<div class="text">
						<input type="text" placeholder="请输入您的用户名" name="lname"
							id="username" required> <span><img
							src="../images/login/yhm.png"></span>
					</div>

					<div class="text">
						<input type="password" id="password" placeholder="请输入您的密码"
							name="lwd" required minlength="6" maxlength="15"> <span><img
							src="../images/login/mm.png"></span>
					</div>

					<div class="text">
						<input type="text" id="code" placeholder="请输入验证码" name="code"
							required minlength="4" maxlength="4"> <span><img
							id="code_image" style="top: -37px; right: -163px" src="code.do"></span>
					</div>

					<div class="chose">
						<input type="checkbox" class="checkbox" id="ck_rmbUser" value="0">自动登录
						<span>忘记密码？</span>
					</div>
					<input class="button_login" type="button" value="登录" id="bt-login" />
				</div>
			</form>
		</div>
	</div>
	<!--错误提示-->
	<div id="showResult"></div>
	<!-- 品质保障，私人定制等-->
	<div id="foot_box">
		<div class="icon1 lf">
			<img src="../images/footer/icon1.png" alt="" />

			<h3>品质保障</h3>
		</div>
		<div class="icon2 lf">
			<img src="../images/footer/icon2.png" alt="" />

			<h3>私人定制</h3>
		</div>
		<div class="icon3 lf">
			<img src="../images/footer/icon3.png" alt="" />

			<h3>学员特供</h3>
		</div>
		<div class="icon4 lf">
			<img src="../images/footer/icon4.png" alt="" />

			<h3>专属特权</h3>
		</div>
	</div>
	<!-- 页面底部-->
	<c:import url="include/footer.jsp"></c:import>

	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src="../jquery/jquery.cookie.js"></script>
	<script>
		//点击验证码图片时候更新图片
		$("#code_image").click(function() {
			var img = this;
			console.log(img);

			img.src = "code.do?" + new Date().getTime();
		});

		$("#code").blur(function() {
			var data = $("#code").val();
			console.log(data);
			if (data == null || data == "") {
				$("#showResult").text("验证码不能为空！");
				$("#showResult").css("color", "red");
				return false;
			}
			$.ajax({
				"type" : "POST",
				"url" : "checkCode.do",
				"data" : "code=" + data,
				"beforeSend" : function(XMLHttpRequest) {
					$("#showResult").text("正在查询...");
					$("#showResult").css("color", "green");
				},
				"success" : function(obj) {
					var color = obj.state == 1 ? "green" : "red";
					$("#showResult").css("color", color);
					$("#showResult").text(obj.message);
				},
				"error" : function() {
					//错误处理
				}
			});

		});

		$("#username").blur(function() {
			var data = $("#username").val();
			if (data == null || data == "") {
				$("#showResult").text("用户名不能为空！");
				$("#showResult").css("color", "red");
				return false;
			}
			$.ajax({
				"type" : "POST",
				"url" : "checkLoginUsername.do",
				"data" : "username=" + data,
				"beforeSend" : function(XMLHttpRequest) {
					$("#showResult").text("正在查询...");
					$("#showResult").css("color", "green");
				},
				"success" : function(obj) {
					var color = obj.state == 1 ? "green" : "red";
					$("#showResult").css("color", color);
					$("#showResult").text(obj.message);
				},
				"error" : function() {
					//错误处理
				}
			});
		});
	</script>
	<script>
		$('#bt-login').click(function() {
			//读取用户的输入——表单序列化
			var data = $('#login-form').serialize();
			//异步提交请求，进行验证
			$.ajax({
				"url" : "handleLogin.do",
				"data" : data,
				"type" : "POST",
				"datatype" : "json",
				"success" : function(obj) {
					if (obj.state == 1) {
						saveCookie();
						window.location = "../main/index.do";
					} else if (obj.state == -1) {
						alert(obj.message);
						$("#showResult").text(obj.message);
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			if ($.cookie("rmbUser") == "true") {
				$("#ck_rmbUser").attr("checked", true);
				$("#username").val($.cookie("username"));
				$("#password").val($.cookie("password"));
			}
		});

		//记住用户名密码
		function saveCookie() {
			if ($("#ck_rmbUser").prop("checked")) {
				var str_username = $("#username").val();
				var str_password = $("#password").val();
				$.cookie("rmbUser", "true", {
					expires : 7
				}); //存储一个带7天期限的cookie
				$.cookie("username", str_username, {
					expires : 7
				});
				$.cookie("password", str_password, {
					expires : 7
				});
			} else {
				$.cookie("rmbUser", "false", {
					expire : -1
				});
				$.cookie("username", "", {
					expires : -1
				});
				$.cookie("password", "", {
					expires : -1
				});
			}
		};
	</script>
</body>
</html>