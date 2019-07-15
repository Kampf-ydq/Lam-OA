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
		
		//��ȡsession���ж�session���Ƿ���userSession
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(Contans.USER_SESSION);
		//���û��session����ת����ʾ��Ϣҳ����ʾ���Ƿ���¼��
		if (null == user) {
			response.sendRedirect(request.getContextPath()+"/error.jsp");
			return false;
		}
		return true;
	}
	
	
}
