package cn.ghang.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrderController {
		
	@RequestMapping("/list.do")
	public String showorders() {
		return "orders_list";
	}
}
