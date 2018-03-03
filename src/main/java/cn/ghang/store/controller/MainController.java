package cn.ghang.store.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.Goods;
import cn.ghang.store.bean.GoodsCategory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ghang.store.service.GoodsCategoryService;
import cn.ghang.store.service.GoodsService;

@Controller
@RequestMapping("/main")
public class MainController 
	extends BaseController {
	
	@RequestMapping("/help.do")
	public String showOrders() {
		return "help";
	}
	
	@RequestMapping("/favorites.do")
	public String showFavorites() {
		return "favorites";
	}	
	
	@RequestMapping("/search.do")
	public String showSearch() {
		return "favorites";
	}	
	
	
	@Resource
	private GoodsService goodsService;
	@Resource
	private GoodsCategoryService goodsCategoryService;

	@RequestMapping("/index.do")
	public String showIndex(ModelMap modelMap) {
		// 笔记本电脑的分类id
		Integer categoryId = 163;
		// 指定排序规则
		String orderBy = "priority DESC";
		// 获取首页中热卖的3种笔记本电脑
		List<Goods> hotNotebooks
			= goodsService.getGoodsListByCategoryId(
					categoryId, orderBy, 0, 3);
		
		// 获取笔记本的一级分类下属的前3个二级分类
		Integer notebookCategory = 161;
		List<GoodsCategory> categories161
			= goodsCategoryService.getGoodsCategoryListByParentId(notebookCategory, 0, 3);
		// 获取这3个二级分类下的所有三级分类信息
		List<List<GoodsCategory>> subCategories
			= new ArrayList<List<GoodsCategory>>();
		// 遍历以上3个二级分类，分别获取对应的3级分类
		for (int i = 0; i < categories161.size(); i++) {
			subCategories.add(
					goodsCategoryService
						.getGoodsCategoryListByParentId(
								categories161.get(i).getId(), 
								null, null));
		}
		
		// 将数据封装到ModelMap中以转发给JSP
		modelMap.addAttribute("hotNotebooks", hotNotebooks);
		modelMap.addAttribute("categories161", categories161);
		modelMap.addAttribute("subCategories", subCategories);
		
		return "index";
	}
	
}
