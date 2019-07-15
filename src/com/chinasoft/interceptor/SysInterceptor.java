package com.chinasoft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chinasoft.pojo.User;
import com.chinasoft.utils.Contans;

public class SysInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//获取session，判断session中是否有userSession
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(Contans.USER_SESSION);
		//如果没有session，跳转到提示信息页，提示“非法登录”
		if (null == user) {
			response.sendRedirect(request.getContextPath()+"/error.jsp");
			return false;
		}
		return true;
	}
	
	
}
