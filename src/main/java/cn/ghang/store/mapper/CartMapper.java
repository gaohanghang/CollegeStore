package cn.ghang.store.mapper;

import java.util.List;

import cn.ghang.store.bean.Cart;

public interface CartMapper {
	
	void add(Cart cart);
	
	List<Cart> getCartList(Integer uid);

}
