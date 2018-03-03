<%@ page language="java" 
	contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学子商城收藏夹</title>
    <link rel="stylesheet" href="../css/header.css"/>
    <link rel="stylesheet" href="../css/favorites.css"/>
    <link rel="stylesheet" href="../css/footer.css"/>
</head>
<body>
<!-- 页面顶部-->
<c:import url="include/header.jsp"></c:import>
<!-- nav主导航-->
<c:import url="include/nav.jsp"></c:import>

<div class="modal" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提醒
        </div>
        <div class="modal_information">
            <img src="../images/model/model_img2.png" alt=""/>
            <span>确定删除您的这个宝贝吗？</span>

        </div>
        <div class="yes"><span>删除</span></div>
        <div class="no"><span>不删除</span></div>
    </div>
</div>
<div class="modalYi" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            操作提醒
        </div>
        <div class="modal_information">
            <img src="../images/model/model_img2.png" alt=""/>
            <span>将您的宝贝移入购物车？</span>

        </div>
        <div class="yes"><span>确定</span></div>
        <div class="no"><span>取消</span></div>
    </div>
</div>
<div class="modalNo" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提示
            <img src="../images/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="../images/model/model_img2.png" alt=""/>
            <span>请选择商品</span>

        </div>

    </div>
</div>

<div class="modalAdd" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            添加提示
            <img src="../images/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="../images/model/model_img2.png" alt=""/>
            <span>请选择商品</span>

        </div>

    </div>
</div>

<div class="big">
    <form  name="" action="" method="post" >
        <section id="section" >
            <div id="title">
                <b>收藏商品</b>&nbsp;&nbsp;&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
                <b class="store">收藏店家</b>
            </div>
            <div id="box" >
                <div class="imfor_top">
                    <div class="manage">
                        <span class="normal">管理收藏夹</span>

                    </div>
                    <div class="check_top">
                        <div class="all">
                            <span class="normal"> <img src="../images/myCollect/product_normal.png" alt=""/></span>全选
                        </div>
                        <div class="del">删除</div>
                        <div class="allAdd">加入购物车</div>
                        <div class="sure" style="display: none">
                            <img src="../images/myCollect/product_true.png" alt=""/>
                            <span>已移入购物车</span>
                        </div>
                    </div>
                    <div class="foot_qk">清空失效商品</div>
                </div>
                <div id="content_box" >
                    <div class="lf" id="d1">
                        <div class="img">
                            <img src="../images/myCollect/product_img1.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                            <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="lf" id="d2">
                        <div class="img">
                            <img src="../images/myCollect/product_img2.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                             <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="lf" id="d3">
                        <div class="img">
                            <img src="../images/myCollect/product_img3.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                             <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="lf" id="d4">
                        <div class="img">
                            <img src="../images/myCollect/product_img4.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                             <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="lf" id="d5">
                        <div class="img">
                            <img src="../images/myCollect/product_img5.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                             <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="lf" id="d6">
                        <div class="img">
                            <img src="../images/myCollect/product_img6.png" alt=""/>
                        </div>
                        <div class="describe">
                            <p>DELL燃7000&nbsp;14.0英寸微边框(i5-7200u&nbsp;
                                8GB&nbsp;256GB&nbsp;SSD&nbsp;HD620&nbsp;Win10)银</p>
                            <span class="price"><b>￥</b><span class="priceContent">4000.00</span></span>
                            <span class="addCart">加入购物车</span>
                             <span class="succee" style="display: none">
                                 <img src="../images/myCollect/product_true.png" alt=""/>
                                 <span>已移入购物车</span>
                            </span>
                        </div>
                        <div class="mask" style="display: none">
                            <div class="maskNormal">
                                <img src="../images/myCollect/product_normal_big.png" alt=""/>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="foot" >
                    <div class="manage">
                        <span class="normal">管理收藏夹</span>
                    </div>
                    <div class="check_top">
                        <div class="all">
                            <span class="normal"> <img src="../images/myCollect/product_normal.png" alt=""/></span>全选
                        </div>
                        <div class="del">删除</div>
                        <div class="allAdd">加入购物车</div>
                        <div class="sure" style="display: none">
                            <img src="../images/myCollect/product_true.png" alt=""/>
                            <span>已移入购物车</span>
                        </div>
                    </div>
                </div>


                </div>
        </section>

    </form>
    <div class="none" style="display: none">
        <div class="none_content">
            <img src="../images/model/model_img3.png" alt="" class="lf"/>
            <p class="lf">您的收藏夹竟然还是空哒( ⊙ o ⊙ )</p>
            <span class="lf">赶快去收藏商品吧！</span>
            <a href="#" class="lf">去购物>></a>
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

<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/favorites.js"></script>
<script>
    $(function(){
        if(!$(".imfor")) {
            $('#section').hide();
            $('.none').show();
        }
    })
    //搜索下拉
    $('.seek').focus(function(){

        if($(this).hasClass('clickhover')){

            $(this).removeClass('clickhover');
            $(this).find('.seek_content').hide();
            $(this).find('img').attr('src','../images/header/header_normal.png');

        }else{
            $(this).addClass('clickhover');
            $(this).find('.seek_content').show();
            $(this).find('img').attr('src','../images/header/header_true.png');
        }
    })
    $('.seek_content>div').click(function(){
        $('.seek').removeClass('clickhover');
        var text=$(this).html();
        $('.seek span').html(text);
        $(this).parent().hide();
        $('.seek').find('img').attr('src','../images/header/header_normal.png');
        $('.seek').blur();

    })
    $('.seek').blur(function(){

        $('.seek').removeClass('clickhover');
        $('.seek_content').hide();

        $('.seek').find('img').attr('src','../images/header/header_normal.png');
        console.log(1);
    })
    $(".care").hover(function(){
        $(this).attr('src',"../images/header/care1.png");
    },function(){
        $(this).attr('src',"../images/header/care.png");
    });
    $(".order").hover(function(){
        $(this).attr('src',"../images/header/order1.png");
    },function(){
        $(this).attr('src',"../images/header/order.png");
    });
    $(".shopcar").hover(function(){
        $(this).attr('src',"../images/header/shop_car1.png");
    },function(){
        $(this).attr('src',"../images/header/shop_car.png");
    });
</script>
</body>
</html>