package com.scmaster.mypro.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.scmaster.mypro.board.dao.BoardDAO;
import com.scmaster.mypro.board.vo.SubjectVo;
import com.scmaster.mypro.user.dao.UserDAO;
import com.scmaster.mypro.user.vo.UserVo;


/**
 * 회원 가입 콘트롤러
 * 모델에 "user"라는 이름의 값이 저장될 때, 세션에도 저장
 * 가입단계의 시작부터 마지막단계까지 세션의 값 유지
 */
@Controller
@RequestMapping(value="user")
@SessionAttributes("user")
public class JoinController {

		@Autowired
		UserDAO dao;
		@Autowired
		BoardDAO bdao;
		
		private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

		/**
		 * 회원 가입 폼 보기
		 */
		@RequestMapping(value="joinForm", method=RequestMethod.GET)
		public String joinForm(Model model){
			logger.info("회원가입 폼 이동 시작");
			
			//세션에 회원가입 입력내용을 기억하기 위한 사전작업
			UserVo user = new UserVo();
			ArrayList<SubjectVo> subjectList = bdao.selectSubjectAll();
			
			model.addAttribute("user", user);
			model.addAttribute("subjectList", subjectList);
				
			
			logger.info("회원가입 폼 이동 종료");
			return "user/joinForm";
		}
		
		
		@RequestMapping(value="updateUser", method=RequestMethod.GET)
		public String updateUser(Model model,HttpSession session){
			
			String loginId = (String)session.getAttribute("loginId");
			
			UserVo user = dao.searchUserOne(loginId);
			
			model.addAttribute("user", user);
				
			
			return "user/updateUser";
		}
		
		
		@RequestMapping(value="updateUserinfo", method=RequestMethod.POST)
		public String updateUserinfo(UserVo user,Model model){
			
			dao.updateUser(user);	
			
			return "redirect:/";
		}
		
		
		
		/**
		 * [Ajax] ID 중복 검사
		 * */
		@ResponseBody
		@RequestMapping(value="idCheck2",method = RequestMethod.GET)
		public boolean idCheck2(String userid){
			boolean flag = false;
			
			UserVo user = dao.searchUserOne(userid);
			
			if(user != null){
				flag = true;
			}
			
			return flag;
		}
		
		
		
		/**
		 * 회원 가입 처리
		 * @param customer joinForm()에서 생성한 VO객체에 사용자가 입력한 가입 정보가 추가된 객체.
		 * 					세션에 해당 값이 없으면 에러.
		 */
		@RequestMapping(value="join",method=RequestMethod.POST)
		public String join(
				// session과 공유되고 있는 상황에서 customer의 값이 저장되어있는지 검사한다.
				// 원래는 모델에 값을 넣어주는 어노테이션 -> 지금은 세션에도 값이 저장된다(공유중)
				@ModelAttribute("user")UserVo user,
				Model model){	
			logger.info("회원 등록 시작");
			
			int result = dao.joinUser(user);
			
			if(result != 1){
				//등록 실패
				model.addAttribute("errorMsg", "등록 실패");
				logger.info("회원 등록 실패");
				return "user/joinForm";
			}
			
			logger.info("회원 등록 종료");
			return "redirect:/";
		}
		
		/**
		 * 회원 가입 처리 완료
		 * @param customer DB에 최종 저장된 정보
		 * @param sessionStatus @SessionAttributes에서 지정한 이름을 세션에서 삭제하기 위해 사용
		 *	로그인 프로세스의 마지막 단계에서 세션 초기화
		 */
		@RequestMapping(value="joinComplete",method = RequestMethod.GET)
		public String joinComplete(SessionStatus session,
				Model model,
				@ModelAttribute("user")UserVo user				//다른사람이 이 함수를 함부로 못쓰도록 검사!
				){
			logger.info("회원 가입 성공 폼 이동 시작");
			model.addAttribute("id", user.getUserid());
			
			session.setComplete();							//세션 초기화 (모든 모델과 리퀘스트어트리뷰트와 세션과의 관계를 초기화)
			
			logger.info("회원 가입 성공 폼 이동 종료");
			return "index";
		}
}
