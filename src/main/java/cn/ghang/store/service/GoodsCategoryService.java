package cn.ghang.store.service;

import java.util.List;

import cn.ghang.store.bean.GoodsCategory;

public interface GoodsCategoryService {

	@Deprecated
	List<GoodsCategory>
		getGoodsCategoryList(Integer page);
	
	GoodsCategory getGoodsCategroyById(Integer id);
	
	List<GoodsCategory> getGoodsCategoryListByParentId(
			Integer parentId, 
			Integer offset, 
			Integer pageCount
	);
}
