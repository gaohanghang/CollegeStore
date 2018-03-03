<%@ page language="java" 
	contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>

<div id="leftsidebar_box" class="lf">
	<div class="line"></div>
	<dl class="my_order">
		<dt>
			我的订单 <img src="../images/myOrder/myOrder2.png">
		</dt>
		<dd class="first_dd">
			<a href="${pageContext.request.contextPath }/orders/list.do">全部订单</a>
		</dd>
		<dd>
			<a href="#"> 待付款 <span>
					<!--待付款数量-->
			</span>
			</a>
		</dd>
		<dd>
			<a href="#"> 待收货 <span>
					<!--待收货数量-->1
			</span>
			</a>
		</dd>
		<dd>
			<a href="#"> 待评价<span>
					<!--待评价数量-->
			</span>
			</a>
		</dd>
		<dd>
			<a href="#">退货退款</a>
		</dd>
	</dl>

	<dl class="footMark">
		<dt>
			我的优惠卷<img src="../images/myOrder/myOrder1.png">
		</dt>
	</dl>

	<dl class="address">
		<dt>
			收货地址<img src="../images/myOrder/myOrder1.png">
		</dt>
		<dd>
			<a href="${pageContext.request.contextPath }/user/address.do">地址管理</a>
		</dd>
	</dl>
	<dl class="count_managment">
		<dt>
			帐号管理<img src="../images/myOrder/myOrder1.png">
		</dt>
		<dd class="first_dd">
			<a href="${pageContext.request.contextPath }/user/user_center.do">我的信息</a>
		</dd>
		<dd>
			<a href="${pageContext.request.contextPath }/user/user_password.do">安全管理</a>
		</dd>
	</dl>
</div>

<!-- 定义函数，用于展开某个分组 -->
<script type="text/javascript">
	// 显示某个分组，参数表示需要显示的分组的class，例如.my_order
	function showMenuItem(className) {
		// 将所有分组的所有选项全部隐藏：hide()
		$("#leftsidebar_box dd").hide();
		// 将当前分组的所有选项全部显示：show()
		$("#leftsidebar_box " + className + " dd").show();
		
		// 将所有分组的右侧箭头调整为向下：2号
		$("#leftsidebar_box dt img").attr("src","../images/myOrder/myOrder2.png");
		// 将当前分组的右侧箭头调整为向右：1号
		$("#leftsidebar_box " + className + " dt img").attr("src","../images/myOrder/myOrder1.png");
	}
</script>

