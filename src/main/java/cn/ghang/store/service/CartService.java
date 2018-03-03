package cn.ghang.store.service;

import java.util.List;

import cn.ghang.store.bean.Cart;

public interface CartService {
	
	public void add(Cart cart);
	
	List<Cart> getCartList(Integer uid);
	
}
