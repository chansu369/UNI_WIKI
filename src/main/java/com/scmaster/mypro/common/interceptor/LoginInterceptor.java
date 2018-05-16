package com.scmaster.mypro.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	/**
	 * 사용자 로그인 확인 인터셉터 HandlerInterceptorAdapter를 상속받아서 정의.
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		//로그인이 되어 있는지를 판단해서
		//세션을 획득
		HttpSession session = request.getSession();
		//값이 있는지 판단
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null){
			//로그인이 되어있지 않을 경우에는 로그인 폼으로 이동
			//루트경로를 구한다
			String path = request.getContextPath();
			String requestPath = request.getRequestURI();
			
			response.sendRedirect(path+"/user/loginForm?requestPath="+requestPath);		//절대경로
			return false;			//이 경우에 원래 요청주소로 보내주지 않는다
		}
		
		//로그인이 되어 있을 경우에는 원래 요청주소로 이동
		return super.preHandle(request, response, handler);			// == return true;   (갈 길 가라)
	}

	
	
	
}
