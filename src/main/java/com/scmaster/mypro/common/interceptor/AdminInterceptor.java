package com.scmaster.mypro.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scmaster.mypro.user.dao.UserDAO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	UserDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션 획득
		HttpSession session = request.getSession();
		
		String loginType = (String)session.getAttribute("loginType");
		String errorMsgIn = "Not admin user";
		if(!(loginType.equals("admin"))){
			
			response.sendRedirect("/mypro?errorMsgIn="+errorMsgIn);
			return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}

	
}
