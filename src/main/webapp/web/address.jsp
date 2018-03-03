<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单 - 学院商城</title>
<link href="../css/orders.css" rel="stylesheet" />
<link href="../css/header.css" rel="stylesheet" />
<link href="../css/footer.css" rel="stylesheet" />
<link href="../css/personage.css" rel="stylesheet" />
<link href="../css/common.css" rel="stylesheet" />
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
		<div class="rightsidebar_box rt">
			<!--标题栏-->
			<div class="rs_header">
				<span class="address_title">收获地址管理</span>
			</div>

			<!--收货人信息列表-->
			<div class="rs_content">
				<!-- 标题 -->
				<div class="address_information_manage">
					<div class="aim_title">
						<span class="dzmc dzmc_title">地址名称</span>
						<span class="dzxm dzxm_title">姓名</span>
						<span class="dzxq dzxq_title">地址详情</span>
						<span class="lxdh lxdh_title">联系电话</span>
						<span class="operation operation_title">操作</span>
					</div>
				</div>
				
				<!-- 数据 -->
				<div id="address_list"></div>

				<!-- 新增收货人地址 -->
				<div>
					<a href="###" class="button_classic" onclick="showMask(0)">
						新增收货人地址 </a>
				</div>
			</div>
		</div>
	</div>

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

	<!-- 遮罩与内容 -->
	<div id="mask"></div>
	<div id="popup_content">
		<div class="content_wrapper">
			<h3 id="popup_title"></h3>
			<form id="form-recv-info" method="post" action="">
				<!--收货人姓名-->
				<div class="recipients">
					<span class="red">*</span>
					<span class="kuan">收货人：</span>
					<input
						type="text" name="recvPerson" 
						id="receiverName" />
				</div>
				<!--收货人所在城市等信息-->
				<div data-toggle="distpicker_tedu" class="address_content">
					<span class="red">*</span>
					<span class="kuan">
					省份：</span>
					<select id="province" name="recvProvince">
					</select> 
					城市：
					<select id="city" name="recvCity">
						<option value="0">
							----- 请选择 -----
						</option>
					</select> 
					区/县：
					<select id="area" name="recvArea">
						<option value="0">
							----- 请选择 -----
						</option>
					</select>
				</div>
				<!--收货人详细地址-->
				<div class="address_particular">
					<span class="red">*</span>
					<span class="kuan">详细地址：</span>
					<textarea name="recvAddr"
						id="receiverAddress" 
						cols="60" rows="3" 
						placeholder="建议您如实填写详细收货地址"></textarea>
				</div>
				<!--收货人手机-->
				<div class="address_tel">
					<span class="red">*</span>
					<span class="kuan">手机号码：</span>
					<input
						type="text" 
						id="receiverMobile" 
						name="recvPhone" />
					固定电话：
					<input
						type="text" 
						id="recvTel"
						name="recvTel"  />
				</div>
				<!--邮政编码-->
				<div class="address_postcode">
					<span class="red">*</span>
					<span class="kuan">邮政编码：</span>
					&nbsp;
					<input type="text" id="recvAddrCode"
						name="recvAddrCode" />
				</div>
				<!--地址名称-->
				<div class="address_name">
					<span class="red">*</span>
					<span class="kuan">地址名称：</span>
					&nbsp;
					<input type="text" id="addressName" 
						name="recvName" />
					如：
					<span class="sp">家</span>
					<span class="sp">公司</span>
					<span class="sp">宿舍</span>
				</div>
				<!--保存收货人信息-->
				<div class="buttons">
					<a href="###" 
						class="button_classic"
						onclick="postForm()">
						保存收货人信息
					</a>
					<a href="###"
						class="button_cancel" 
						onclick="hideMask()">
						取消
					</a>
				</div>

			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" src="../js/distpicker.data.js"></script>
<script type="text/javascript" src="../js/distpicker.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script type="text/javascript">
	$(".lxdh_normal").each(function(i, e) {
		var phone = $(e).html();
		$(e).html(changePhone(phone));
	});
</script>
<script type="text/javascript">
	var actionId;

	function showMask(id) {
		// 将id赋值给全局变量的actionId
		actionId = id;
		
		// 重置表单
		$("#form-recv-info")[0].reset();
		
		// 内容区域的尺寸
		var contentWidth = 720;
		var contentHeight = 470;
		// 设置半透明遮罩层的尺寸
		$("#mask").css({
			"width" : $(document).width(),
			"height" : $(document).height()
		});
		// 设置内容层的尺寸与位置
		$("#popup_content").css({
			"width" : contentWidth,
			"height" : contentHeight,
			"left" : ($(window).width() - contentWidth) / 2,
			"top" : ($(window).height() - contentHeight) / 2
		});
		// 处理标题文字
		var title = id == 0 
			? "新增收货人信息" : "编辑收货人信息";
		$("#popup_title").text(title);
		// 显示
		$("#mask").show();
		$("#popup_content").show();
		
		// 判断id是否为大于0的数
		// 如果大于0
		// 则是编辑操作
		// 需要读取“收货人信息”数据并显示到表单中
		if (id > 0) {
			// 编辑状态
			editAddress(id);
		} else {
			// 增加状态，加载省列表
			getProvinceList(null, null, null);
		}
	}
	
	function editAddress(id) {
		// 读取数据
		var url = "${pageContext.request.contextPath}/address/get_address.do";
		$.ajax({
			"url": url,
			"data": "id=" + id,
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				// 判断是否获取到数据
				if (obj.state == -1) {
					alert(obj.message);
					hideMask();
					return;
				}
				// 准备显示数据
				var address = obj.data;
				// 将数据填到输入框中
				$("#receiverName").val(address.recvPerson);
				$("#receiverAddress").val(address.recvAddr);
				$("#receiverMobile").val(address.recvPhone);
				$("#recvTel").val(address.recvTel);
				$("#recvAddrCode").val(address.recvAddrCode);
				$("#addressName").val(address.recvName);
				// 测试：在控制台输入省市区的邮编
				console.log("province_code=" + address.recvProvince);
				console.log("city_code=" + address.recvCity);
				console.log("area_code=" + address.recvArea);
				// 调用加载省列表，同时传入省市区三级的邮编
				// 当省列表加载完成，会根据省的邮编进行默认选中
				// 然后会调用加载市列表，并传入市和区这2个邮编
				// 则市列表加载完成后，会根据市的邮编选中市
				// 并且还会调用加载区列表，并传入区的邮编
				getProvinceList(
						address.recvProvince,
						address.recvCity,
						address.recvArea);
			}
		});
	}

	function hideMask() {
		$("#mask").hide();
		$("#popup_content").hide();
	}
	
	function getProvinceList(provinceCode, cityCode, areaCode) {
		$.ajax({
			"url": "${pageContext.request.contextPath}/dict/get_province_list.do",
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				$("#province").empty();
				var op;
				for (var i = 0; i < obj.data.length; i++) {
					op = "<option value="
						+ obj.data[i].provinceCode
						+ ">"
						+ obj.data[i].provinceName
						+ "</option>";
					$("#province").append(op);
				}
				
				if (provinceCode != null) {
					$("#province").val(provinceCode);
				}
				
				getCityList(cityCode, areaCode);
			}
		});
	}
	
	function getCityList(cityCode, areaCode) {
		var provinceCode = $("#province").val();
		$("#city").empty();
		$("#area").empty();
		$.ajax({
			"url": "${pageContext.request.contextPath}/dict/get_city_list.do",
			"data": "provinceCode=" + provinceCode,
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				var op;
				for (var i = 0; i < obj.data.length; i++) {
					op = "<option value="
						+ obj.data[i].cityCode
						+ ">"
						+ obj.data[i].cityName
						+ "</option>";
					$("#city").append(op);
				}
				
				if (cityCode != null) {
					$("#city").val(cityCode);
				}
				
				getAreaList(areaCode);
			}
		});
	}
	
	function getAreaList(areaCode) {
		var cityCode = $("#city").val();
		$("#area").empty();
		$.ajax({
			"url": "${pageContext.request.contextPath}/dict/get_area_list.do",
			"data": "cityCode=" + cityCode,
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				var op;
				for (var i = 0; i < obj.data.length; i++) {
					op = "<option value="
						+ obj.data[i].areaCode
						+ ">"
						+ obj.data[i].areaName
						+ "</option>";
					$("#area").append(op);
				}
				
				if (areaCode != null) {
					$("#area").val(areaCode);
				}
			}
		});
	}
	
	function postForm() {
		// 序列化表单中的数据，即拿到所有数据
		var data = $("#form-recv-info").serialize();
		// 确定表单提交到的路径
		var url;
		// 根据全局变量actionId判断当前是新增操作还是编辑操作
		if (actionId == 0) {
			// 新增
			url = "${pageContext.request.contextPath}/address/handle_add_address.do";
			// 测试日志：提交的数据
			console.log("新增：" + data);
		} else {
			// 编辑
			url = "${pageContext.request.contextPath}/address/handle_update_address.do";
			data += "&id=" + actionId;
			// 测试日志：提交的数据
			console.log("编辑：" + data);
		}
		// 调用ajax()函数提交请求并处理
		$.ajax({
			"url": url,
			"data": data,
			"type": "POST",
			"dataType": "json",
			"success": function(obj) {
				// 关闭遮罩
				hideMask();
				// 刷新列表
				showAddressList();
			}
		});
	}
	
	function showAddressList() {
		var url = "${pageContext.request.contextPath}/address/list.do";
		$.ajax({
			"url": url,
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				// 清除当前列表数据
				$("#address_list").empty();
				
				var addr; // 循环过程中每次循环到的收货人信息的数据
				var htmlString; // 每条数据对应的html源代码

				for (var i = 0; i < obj.data.length; i++) {
					addr = obj.data[i];

					htmlString = getAddressHtml(addr);
					
					$("#address_list").append(htmlString);
				}
			}
		});
	}
	
	function deleteAddress(id) {
		var confirmResult = confirm("删除操作将不可恢复！您确定要删除这条数据吗？");
		if (!confirmResult) {
			return;
		}
		
		var url = "${pageContext.request.contextPath}/address/delete.do";
		$.ajax({
			"url": url,
			"data": "id=" + id,
			"type": "GET",
			"dataType": "json",
			"success": function(obj) {
				// 删除成功，直接刷新列表
				showAddressList();
			}
		});
	}
	
	var addressItemTemplate = 
		'<div class="address_list_item %is_item_active%">'
		+ '<span class="addr_name %addr_name_active%">%recv_name%</span>'
		+ '<span class="recv_person">%recv_person%</span>'
		+ '<span class="recv_addr_full">%recv_addr_full%</span>'
		+ '<span class="recv_phone">%recv_phone%</span>'
		+ '<span class="op">'
		+ '	<a href="###" onclick="showMask(%id_val%)">编辑</a>'
		+ '	<a href="###" onclick="deleteAddress(%id_val%)">删除</a>'
		+ '</span>'
		+ '<span class="is_default">'
		+ ' %set_default%'
		+ '</span>'
		+ '</div>';
		
	function getAddressHtml(address) {
		var html = addressItemTemplate;
		
		if (address.isDefault) {
			html = html.replace("%is_item_active%", "address_list_item_active");
			html = html.replace("%addr_name_active%", "addr_name_active");
			html = html.replace("%set_default%", "--");
		} else {
			html = html.replace("%is_item_active%", "");
			html = html.replace("%addr_name_active%", "");
			html = html.replace("%set_default%", "<a href=\"###\" onclick=\"setDefaultAddress(" + address.id + ")\">设为默认</a>");
		}
		
		html = html.replace("%recv_name%", address.recvName);
		html = html.replace("%recv_person%", address.recvPerson);
		html = html.replace("%recv_addr_full%", address.recvDistrict + " " + address.recvAddr);
		html = html.replace("%recv_phone%", address.recvPhone);
		html = html.replace(/%id_val%/g, address.id);
		
		return html;
	}
	
	function setDefaultAddress(id) {
		var url = "${pageContext.request.contextPath}/address/set_default.do";
		$.ajax({
			"url": url, 
			"data": "id=" + id, 
			"type": "GET", 
			"dataType": "json", 
			"success": function(obj) {
				showAddressList();
			}
		});
	}
	
	$(function() {
		showMenuItem(".address");
		
		$("#province").change(function() {
			getCityList();
		});
		$("#city").change(function() {
			getAreaList();
		});
		
		showAddressList();
	});
</script>
</html>