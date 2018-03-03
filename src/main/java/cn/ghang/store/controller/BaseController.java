package cn.ghang.store.controller;

import javax.servlet.http.HttpSession;

public abstract class BaseController {

	protected Integer getUidFromSession(HttpSession session) {
		
		return Integer.valueOf(session.getAttribute("uid").toString());
	
	}

}
