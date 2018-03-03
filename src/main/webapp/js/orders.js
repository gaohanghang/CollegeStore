/**
 * Created by yy on 2016/12/15.
 */

$("#leftsidebar_box dt")
	.css({"background-color":" #0AA1ED"});
$(function(){
	// 隐藏菜单中所有的选项
    $("#leftsidebar_box dd").hide();
    // 显示class=my_order下的所有的选项
    $("#leftsidebar_box .my_order dd").show();
    
    // 为各组选项的分类标题（4个）配置了点击事件的响应
    $("#leftsidebar_box dt").click(function(){
    	// 为各组选项的分类标题（4个）设置背景颜色
        $("#leftsidebar_box dt").css({"background-color":"#0AA1ED"});
        // 设置自身的背景颜色
        $(this).css({"background-color": "#0AA1ED"});
        
        // 把每一项都移除class=menu_chioce样式设置
        $(this).parent().find('dd').removeClass("menu_chioce");
        
        // 找到所有的分组标签下的img标签，设置src属性的值，表示箭头向下的图片
        $("#leftsidebar_box dt img").attr("src","../images/myOrder/myOrder2.png");
        
        // 找到自身所在的父级标签下的img标签，设置src属性的值，表示箭头向右的图片
        $(this).parent().find('img').attr("src","../images/myOrder/myOrder1.png");
        
        // 收起class=menu_chioce
        $(".menu_chioce").slideUp();
        
        // 将自身对应的所有选项切换开关显示
        $(this).parent().find('dd').slideToggle();
        
        // 添加所有选项的样式是menu_chioce
        $(this).parent().find('dd').addClass("menu_chioce");
        
        // 找到除自身所在的以外的3个分组中的所有选项，全部收起
        $(this).parent().siblings().children('dd').slideUp();
    });
})
//分页部分
$(".tcdPageCode").createPage({
    pageCount:6,
    current:1,
    backFn:function(p){

          }
});


