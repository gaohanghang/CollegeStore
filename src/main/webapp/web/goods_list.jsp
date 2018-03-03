<%@ page language="java" contentType="text/html; 
	charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品搜索页面</title>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/search.css" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/common.css" />
</head>
<!-- 页面顶部-->
<c:import url="include/header.jsp"></c:import>

<!-- nav主导航-->
<c:import url="include/nav.jsp"></c:import>

<body>
	<div id="goods_list_section_wrapper">
		<div id="goods_list_section">
			<h3>全部结果 > 笔记本</h3>
			<ul id="goods_list">
				<c:forEach items="${data}" var="goods">
					<li class="item">
						<div class="image">
							<a
								href="${pageContext.request.contextPath }/goods/details.do?id=${goods.id }">
								<img src="${pageContext.request.contextPath }${goods.image }"
								alt="${goods.title }" title="${goods.title }" />
							</a>
						</div>
						<div class="title">
							<a
								href="${pageContext.request.contextPath }/goods/details.do?id=${goods.id }">
								${goods.title } </a>
						</div>
						<div class="buy">
							<span class="price"> <b>￥</b><span class="content">${goods.price}.00</span>
							</span> <span class="add_cart"> <img id="collect"
								src="../images/search/care.png" alt="" /> <a
								href="javascript:void(0);" class="add_cart">加入购物车</a>
							</span>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div style="clear: both;"></div>

			<div class="pages">
				<c:forEach var="page" begin="1" end="${maxPage}">
					<c:if test="${page == currentPage }">
					${page }
				</c:if>
					<c:if test="${page != currentPage }">
						<a
							href="${pageContext.request.contextPath }/goods/list.do?id=${categoryId }&page=${page }">
							${page }</a>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 尾部-->
	<!-- 页面底部-->
	<c:import url="include/footer.jsp"></c:import>

	<div class="modal" style="display: none">
		<div class="modal_dialog">
			<div class="modal_header">操作提醒</div>
			<div class="modal_information">
				<img src="../images/model/model_img2.png" alt="" /> <span>将您的宝贝加入购物车？</span>

			</div>
			<div class="yes">
				<span>确定</span>
			</div>
			<div class="no">
				<span>取消</span>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src="../js/index1.js"></script>
	<script src="../js/jquery.page.js"></script>
	<script>
		$(".add_cart").click(function() {
			$(".modal").show();
			$(".modal .modal_information span").html("将您的宝贝加入购物车?");
		})
		$(".yes").click(function() {
			$(".modal").hide();
		})
		$('.no').click(function() {
			$('.modal').hide();

		})
	</script>

	<script type="text/javascript">
		/**添加到收藏**/
		$("#collect").click(function(e) {
			$(".modal").show();
			$(".modal .modal_information span").html("将您的宝贝加入收藏夹");
		})
		$(".yes").click(function() {
			$(".modal").hide();
			$('#collect').attr("src", "../images/search/care1.png");
		})
	</script>
</body>
</html>