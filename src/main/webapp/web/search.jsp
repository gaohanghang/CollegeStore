<%@ page language="java" 
	contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品搜索页面</title>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/search.css" />
<link rel="stylesheet" href="../css/footer.css" />
</head>
<!-- 页面顶部-->
<c:import url="include/header.jsp"></c:import>

<!-- nav主导航-->
<c:import url="include/nav.jsp"></c:import>

<body>
	<div class="big">
		<section id="section">
		<p class="header">全部结果 > 笔记本</p>
		<div id="wrap">
			<c:forEach items="${data}" var="goods">
				<div class="lf">
					<div class="img">
						<img src="${pageContext.request.contextPath }${goods.image }"
							alt="${goods.title }" title="${goods.title }" />
					</div>
					<div class="describe">
						<p>${goods.title }</p>
						<span class="price"><b>￥</b><span class="priceContent">${goods.price
								}.00</span></span> <span class="addCart"> <img id="collect"
							src="../images/search/care.png" alt="" /> <a
							href="javascript:void(0);" class="add_cart">加入购物车</a>
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<p>
		<c:forEach var="page" begin="1" end="${maxPage}">
			<c:if test="${page == currentPage }">
				${page }
			</c:if>
			<c:if test="${page != currentPage }">
				<a href="${pageContext.request.contextPath }/goods/list.do?id=${categoryId }&page=${page }">
					${page }</a> 
			</c:if>
		</c:forEach>
		</p>
		</section>
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
	<script src="../js/index.js"></script>
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
	<!--<script type="text/javascript">
	// var status = ${status};
	var pages = ${pageBean.totalPages};
	var index = ${pageBean.pageIndex};
	$(".tcdPageCode").createPage({
		// 总页数
	    pageCount:pages,
	 	// 起始页
	    current:index,
	    backFn:function(p){
	    	// 执行代码
	    	window.location.href="http://localhost:18888/search.html?q=${q}&page="+p;
	    }
	});
</script>-->
	<!--<script type="text/javascript">
    /* 商品详情页  */
	function toItemInfo(id) {
		if (id) {
			window.location.href="/toItemInfo/"+id+".html";
		}else {
			alert("商品id不存在");
		}
	} 
</script>-->
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