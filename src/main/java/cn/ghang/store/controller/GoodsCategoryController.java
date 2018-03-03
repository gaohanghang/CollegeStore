package cn.ghang.store.controller;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.GoodsCategory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ghang.store.service.GoodsCategoryService;

@Controller
@RequestMapping("/goods_category")
public class GoodsCategoryController {

	@Resource
	private GoodsCategoryService 
				goodsCategoryService;
	
	@RequestMapping("/list.do")
	public String showGoodsCategoryList(
	    Integer page,
	    ModelMap modelMap) {
	    List<GoodsCategory> data;
	    if (page == null || page < 0) {
	    	page = 1;
	    }

	    data = goodsCategoryService.getGoodsCategoryList(page);
	    modelMap.addAttribute("data", data);

	    return "goods_category_list";
	}   
	
}
