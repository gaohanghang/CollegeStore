<%@ page language="java" 
	contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>500页面</title>
    <link href="../css/header.css" rel="Stylesheet"/>
    <link href="../css/footer.css" rel="Stylesheet"/>
    <link href="../css/404.css" rel="Stylesheet"/>
</head>
<!-- 页面顶部-->
<c:import url="include/header.jsp"></c:import>
<!-- nav主导航-->
<!-- nav主导航-->
<c:import url="include/nav.jsp"></c:import>

<!--500-->
<div id="container">
    <div class="rightsidebar_box rt" >
        <div class="sys_err">
            <img src="../images/500/500_img1.png" alt=""/>
            <p>
                <img src="../images/500/500_img2.png" alt=""/>服务器发生了错误！
            </p>
            <span>快去看看别的吧！<b><a href="#">回首页&gt;&gt;</a></b></span>
            <br/>
        </div>
    </div>
</div>
<!--为你推荐-->
<div id="recommended">
    <p>为你推荐<span>大家都在看</span></p>
    <div id="demo" style="width:1000px;overflow:hidden;"><!-- 外面的大框 -->
        <div id="indemo" style="float: left;width: 200%;"><!-- 宽度特别大 -->
            <div id="demo1" style="float:left"><!-- 第一个宽度显示 -->
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <img src="../images/recommend/recommend_img1.png" border="0">
                    </div>
                    <p>ThinkPad New S2 (20GUA00QCD)13.3英寸超霸笔记本电脑</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <img src="../images/recommend/recommend_img2.png" border="0">
                    </div>
                    <p>戴尔 DELL燃7000 R1605S 超霸笔记本电脑</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <img src="../images/recommend/recommend_img3.png" border="0">
                    </div>
                    <p>戴尔(DELL)魔方15MF Pro-R2505TSS灵越超霸笔记本电脑</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <img src="../images/recommend/recommend_img4.png" border="0">
                    </div>
                    <p>联想(Lenovo) YOGA900 (YOGA4 PRO)多彩版超霸笔记本电脑</p>
                </div>
                <!--</div>-->
            </div>
            <div id="demo2" style="float:left">
            </div>
        </div>
        <!-- 宽度超大 -->
    </div>
    <!-- 外面大框 -->
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

<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/index.js"></script>
<!--图片轮播悬停进入详情页效果-->
<script>
    var speed = 20;
    var tab = document.getElementById("demo");
    var tab1 = document.getElementById("demo1");
    var tab2 = document.getElementById("demo2");
    tab2.innerHTML = tab1.innerHTML;
    function Marquee() {
        if (tab2.offsetWidth - tab.scrollLeft <= 0)
            tab.scrollLeft -= tab1.offsetWidth
        else {
            tab.scrollLeft++;
        }
    }
    var MyMar = setInterval(Marquee, speed);
    tab.onmouseover = function () {
        clearInterval(MyMar)
    };
    tab.onmouseout = function () {
        MyMar = setInterval(Marquee, speed)
    };
</script>
</body>
</html>