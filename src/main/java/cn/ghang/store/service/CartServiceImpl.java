package cn.ghang.store.service;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.Cart;
import cn.ghang.store.mapper.CartMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cartService")
public class CartServiceImpl implements CartService{
	 
	@Resource
	private CartMapper cartMapper;

	public void add(Cart cart) {
		 cartMapper.add(cart);
	}
	
	@Transactional
	public List<Cart> getCartList(Integer uid) {
		return cartMapper.getCartList(uid);
	}
	
}
