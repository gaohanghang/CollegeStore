package cn.ghang.store.mapper;

import java.util.List;

import cn.ghang.store.bean.GoodsCategory;
import org.apache.ibatis.annotations.Param;

public interface GoodsCategoryMapper {

	@Deprecated //过期
	List<GoodsCategory> getGoodsCategoryList(Integer offset); // offset 偏移量
	
	GoodsCategory getGoodsCategroyById(Integer id);
	
	// 根据parentid获取相应的分类列表
	List<GoodsCategory> getGoodsCategoryListByParentId(
			@Param("parentId")Integer parentId, 
			@Param("offset")Integer offset,
			@Param("pageCount") Integer pageCount);
	
}
