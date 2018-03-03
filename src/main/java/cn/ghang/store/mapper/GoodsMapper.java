package cn.ghang.store.mapper;

import java.util.List;

import cn.ghang.store.bean.Goods;
import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
	
	// 通过属性获取商品
	List<Goods> getGoodsListByCategoryId(
			@Param("categoryId")Integer categoryId,
			@Param("orderBy")		String orderBy,
			@Param("offset")Integer offset,
			@Param("pageCount")Integer pageCount);

	// 读取某个商品分类中的商品的数量
	Integer getRecordCountByCategoryId(Integer categoryId);
	
	Goods getGoodsById(Integer id);
	
	List<Goods> getGoodsListByItemType(String itemType);

	/**
	 * 获取商品列表 
	 * 接下来的这1个方法仅用于测试
	 * @param offset 偏移量
	 * @return
	 */
	@Deprecated //声明为已过期
	List<Goods> getGoodsList(Integer offset);
	
}
