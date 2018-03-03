package cn.ghang.store.service;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.GoodsCategory;
import cn.ghang.store.mapper.GoodsCategoryMapper;
import org.springframework.stereotype.Service;

@Service("goodsCategoryService")
public class GoodsCategoryServiceImpl
	implements GoodsCategoryService {
	
	@Resource
	private GoodsCategoryMapper goodsCategoryMapper;

	@SuppressWarnings("deprecation")
	public List<GoodsCategory> getGoodsCategoryList(Integer page) {
		page--;
		if (page < 0) {
			page = 0;
		}
		
		int offset = page * 30;
		
		return goodsCategoryMapper
				.getGoodsCategoryList(offset);
	}

	public List<GoodsCategory> getGoodsCategoryListByParentId(
				Integer parentId, 
				Integer offset, 
				Integer pageCount) {
		// 如果使用了offset就必须使用合理的pageCount
		if (offset != null) {
			if (pageCount == null 
					|| pageCount < 0
					|| pageCount > 20) {
				pageCount = 20;
			}
		}
		// 调用Mapper完成功能
		return goodsCategoryMapper
				.getGoodsCategoryListByParentId(
						parentId, offset, pageCount);
	}
	
	public GoodsCategory getGoodsCategroyById(Integer id) {
		
		return goodsCategoryMapper.getGoodsCategroyById(id);
	
	}

}
