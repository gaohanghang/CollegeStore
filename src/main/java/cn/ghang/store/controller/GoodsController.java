package cn.ghang.store.controller;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.Goods;
import cn.ghang.store.bean.GoodsCategory;
import cn.ghang.store.service.GoodsCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ghang.store.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Resource
	private GoodsService goodsService; 
	@Resource
	private GoodsCategoryService goodsCategoryService;
	
	@RequestMapping("/list.do")
	public String showGoodsList(
		@RequestParam("id") Integer categoryId,
	    Integer page,
	    ModelMap modelMap) {
		// 声明相关变量
	    List<Goods> data;//商品数据
	    Integer offset;
	    Integer pageCount = 20; //每页商品的数量
	    //根据商品分类id获取商品数量
	    int recordCount = goodsService.getRecordCountByCategoryId(categoryId);
	    String forword = "goods_list";
	    // maxPage
	    int maxPage = recordCount / pageCount; 
	    // 计算最多分多少页
	    if (recordCount % pageCount != 0) {
	    	maxPage++;
	    }
	    // 如果数据量为0，则后续不必再查询数据列表
	    if (recordCount == 0) {
	    	return forword;
	    }
	    
	    // 判断参数中的页码是否有效
	    if (page == null || page < 0) {
	    	page = 1;
	    }
	    if (page > maxPage) {
	    	page = maxPage;
	    }
	    // 计算翻页数据
	    offset = (page - 1) * pageCount;//偏移量

		// 获取当前需要查询的页对应的商品列表
		data = goodsService.getGoodsListByCategoryId(categoryId, null, offset, pageCount);
	    
	    // 将数据封装以转发
	    modelMap.addAttribute("data", data);
	    modelMap.addAttribute("maxPage", maxPage);
	    modelMap.addAttribute("currentPage", page);
	    modelMap.addAttribute("categoryId", categoryId);

	    return forword;
	}   
	
	@RequestMapping("/details.do")
	public String showGoodsDetails(
		@RequestParam("id") Integer goodsId,
		ModelMap modelMap) {
		// 确定返回页面
		String forword = "goods_details";
		// 通过Service读取id对应的商品
		Goods goods = 
			goodsService.getGoodsById(goodsId);
		// 判断是否获取到数据
		if (goods == null) {
			modelMap.addAttribute(
				"message", "没有匹配的商品信息！");
			return forword;
		}
		
		// 通过Service根据以上商品的itemType读取同品类商品列表
		List<Goods> goodsList = goodsService
			.getGoodsListByItemType(
				goods.getItemType());
		
		//根据商品信息获取三级分类信息
		GoodsCategory goodsCategory3 = goodsCategoryService.getGoodsCategroyById(goods.getCategoryId());
		
		//根据三级分类获取所属的二级分类
		GoodsCategory goodsCategory2 = goodsCategoryService.getGoodsCategroyById(goodsCategory3.getParentId());
		
		//根据二级分类获取所属的一级分类
		GoodsCategory goodsCategory1 = goodsCategoryService.getGoodsCategroyById(goodsCategory2.getParentId());
		
		// 转发数据
		modelMap.addAttribute("goods", goods);
		modelMap.addAttribute("goodsList", goodsList);
		modelMap.addAttribute("goodsCategory1", goodsCategory1);
		modelMap.addAttribute("goodsCategory2", goodsCategory2);
		modelMap.addAttribute("goodsCategory3", goodsCategory3);

		// 测试输出以上2项数据
		System.out.println(goods);
		System.out.println(goodsList);

		// 执行转发
		return forword;
	}
}
