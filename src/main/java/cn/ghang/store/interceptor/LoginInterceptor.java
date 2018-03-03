package cn.ghang.store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor 
	implements HandlerInterceptor {

	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		// 日志：
		System.out.println("LoginInterceptor");
		System.out.println("\t请求路径：" + request.getServletPath());
		
		// 获取Session
		HttpSession session = request.getSession();
		
		// 判断是否登录
		if (session.getAttribute("uid") != null) {
			// Session中的uid是存在的，表示已经登录，则放行
			// 日志：
			System.out.println("\t已经登录，放行！");
			return true;
		} else {
			// Session中没有uid，表示没有登录，或登录已经过期，则重定向
			String url = request.getContextPath() + "/user/login.do";
			
			// 日志：
			System.out.println("\t没有登录，将拦截，并重定向：" + url);

			// 执行重定向
			response.sendRedirect(url);

			// 拦截
			return false;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
