package com.scmaster.mypro.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.mypro.user.dao.UserDAO;
import com.scmaster.mypro.user.vo.UserVo;



@RequestMapping(value="user")
@Controller
public class LoginController {

	@Autowired
	UserDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm(){
		return "user/loginForm";
	}
	
	/**
	 * 로그인 처리
	 * @param user 사용자가 입력한 회원객체
	 * @param model Model객체
	 * @param session HttpSession객체
	 * @param requestPath 인터셉터 성공시 이동할 페이지 주소정보
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(HttpSession session,UserVo user,Model model,String requestPath){
		logger.info("로그인 시작");
		
		
		UserVo f_cus = dao.searchUserOne(user.getUserid());
		
		
		if(f_cus != null && f_cus.getPassword().equals(user.getPassword())){
			//로그인 성공
			session.setAttribute("loginId", f_cus.getUserid());
			session.setAttribute("loginName", f_cus.getName());
			session.setAttribute("loginType", f_cus.getUsertype());
		}else {
			//로그인 실패
			model.addAttribute("errorMsg", "로그인 실패");
			return "user/loginForm";
		}
		
		if(requestPath == null){
			return "redirect:sidebar";
		}
		
		//잘라내기
		int firstIndex = requestPath.indexOf("/", 1);
		String responsePath = requestPath.substring(firstIndex+1);
		
		logger.info("로그인 종료");
		
		return "redirect:"+"../"+responsePath;
		

	}
	
	/**
	 * 로그아웃 처리
	 * @param session HttpSession객체
	 */
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
}
