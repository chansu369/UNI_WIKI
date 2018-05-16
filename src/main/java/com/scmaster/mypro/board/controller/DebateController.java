package com.scmaster.mypro.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mypro.board.dao.BoardDAO;
import com.scmaster.mypro.board.controller.DebateController;
import com.scmaster.mypro.board.vo.DebateVo;
import com.scmaster.mypro.common.util.PageNavigator;
import com.scmaster.mypro.board.vo.ReplyVo;
import com.scmaster.mypro.board.vo.SubjectVo;


@Controller
@RequestMapping(value="debate")
public class DebateController {

	@Autowired
	BoardDAO dao;	//토론장관련 데이터 처리 객체
	
	private static final Logger logger = LoggerFactory.getLogger(DebateController.class);

		//게시판 관련 상수값들
		final int countPerPage = 6;				//페이지 당 글 수
		final int pagePerGroup = 6;				//페이지 이동 그룹 당 표시할 페이지 수
		final String uploadPath = "/boardfile";	//파일 업로드 경로

		
		
		/**
		 * 글 목록
		 * @param page 현재 페이지. 없으면 1로 처리
		 * @param searchText 검색어. 없으면 ""로 처리
		 * @param searchSelect 검색수단. 없으면 title로 처리
		 * */
		@RequestMapping(value="list",method=RequestMethod.GET)
		public String list(Model model
				,@RequestParam(value="searchText", defaultValue="")String searchText
				,@RequestParam(value="searchSelect",defaultValue="title")String searchSelect
				,@RequestParam(value="page", defaultValue="1")int page) {
			
			logger.info("글 목록 시작");
			
			HashMap<String, Object> searchMap = new HashMap<>();
			searchMap.put("searchSelect", searchSelect);
			searchMap.put("searchText", searchText);
			
			//전체 글 개수 조회
			int total = dao.getTotal(searchMap);
			
			//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
			
			
			//DB에서 목록을 가져와서 화면에 전달
			ArrayList<DebateVo> list = dao.selectAll(searchMap,navi.getStartRecord(),navi.getCountPerPage());
			
			//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			model.addAttribute("searchText", searchText);
			model.addAttribute("searchSelect", searchSelect);
			
			logger.info("글 목록 종료");
			return "debate/list";
		}
		
		
		/**
		 * 글쓰기 폼 보기
		 * */
		@RequestMapping(value="writeForm",method=RequestMethod.GET)
		public String writeForm(Model model){
			logger.info("글 쓰기 폼 이동 시작");
			ArrayList<SubjectVo> subjectList = dao.selectSubjectAll();
			
			model.addAttribute("subjectList",subjectList);
			logger.info("글 쓰기 폼 이동 종료");
			return "debate/writeForm";
		}
		
		
		/**
		 * 글 저장 처리
		 * @param board 사용자가 입력한 글 내용
		 * */
		@RequestMapping(value="write",method=RequestMethod.POST)
		public String write(DebateVo debate,Model model, MultipartFile upload){
			logger.info("글 쓰기 시작");
			
			
			int result = dao.writeBoard(debate);
			
			if(result != 1){
				//입력 실패
				model.addAttribute("errorMsg", "입력실패");
				return "debate/writeForm";
			}
			
			logger.info("글 쓰기 종료");
			return "redirect:list";
		}
		
		
		/**
		 * 글 읽기
		 * @param boardnum 읽을 글번호
		 * @return 해당 글 정보
		 * */
		@RequestMapping(value="read",method=RequestMethod.GET)
		public String read(int debatenum,Model model){
			logger.info("글 불러오기 시작");
			
			//해당 글 번호의 글 내용 조회
			DebateVo debate = dao.selectOne(debatenum);
			
			//해당 글 번호의 댓글 내용을 조회
			ArrayList<ReplyVo> replyList = dao.selectReplyAll(debatenum);
			
			//본문글정보와 리플목록을 모델에 저장
			model.addAttribute("debate",debate);
			model.addAttribute("replyList",replyList);
			
			logger.info("글 불러오기 종료");
			return "debate/read";
		}
		
		
		
		/**
		 * 글 삭제
		 * @param boardnum 삭제할 글번호
		 * */
		@RequestMapping(value="delete",method=RequestMethod.GET)
		public String delete(int debatenum,HttpSession session){
			logger.info("글 삭제 시작");
			
			String id = (String)session.getAttribute("loginId");
			
			//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
			DebateVo debate = new DebateVo();
			debate.setId(id);
			debate.setDebatenum(debatenum);
			
			int result = dao.deleteBoard(debate);
			
			if(result != 1){
				//삭제 실패
			}
			
			logger.info("글 삭제 종료");
			return "redirect:list";
		}
		
		
		/**
		 * 글 수정 폼으로 이동
		 * @param debatenum 수정할 글번호
		 * @return 해당 번호의 글 정보
		 * */
		@RequestMapping(value="updateForm",method = RequestMethod.GET)
		public String updateForm(int debatenum,Model model){
			logger.info("글 수정 폼 이동 시작");

			DebateVo debate = dao.selectOne(debatenum);
		
			ArrayList<SubjectVo> subjectList = dao.selectSubjectAll();
			
			model.addAttribute("subjectList",subjectList);
			model.addAttribute("debate", debate);
			
			logger.info("글 수정 폼 이동 종료");
			return "debate/updateForm";
		}
		
		
		/**
		 * 글 수정 처리
		 * @param debate 수정할 글 정보
		 * */
		@RequestMapping(value="update",method = RequestMethod.POST)
		public String update(DebateVo debate, MultipartFile upload){
			logger.info("글 수정 시작");
			
			
			//글 수정 처리
			int result = dao.updateBoard(debate);
			
			if(result != 1){
				//수정 실패
				return "debate/updateForm";
			}
			
			logger.info("글 수정 종료");
			return "redirect:list";
		}
		
		
		
		
		/**
		 * 리플 저장 처리
		 * @param reply 사용자가 입력한 글 내용
		 * */
		@RequestMapping(value="insertReply",method=RequestMethod.POST)
		public String insertReply(ReplyVo reply,HttpSession session,Model model){
			logger.info("댓글 등록 시작");
			int result=0;
			String id = (String)session.getAttribute("loginId");
			
			reply.setId(id);
			
			result = dao.insertReply(reply);
			
			if(result != 1){
				//댓글 등록 실패
				model.addAttribute("errorMsg", "댓글 등록실패");
			}
			logger.info("댓글 등록 종료");
			return "redirect:read?debatenum="+reply.getDebatenum();
		}
		
		
		/**
		 * 리플 삭제
		 * @param reply 삭제할 리플 번호와 본문 글번호가 전달
		 * */
		@RequestMapping(value="deleteReply",method=RequestMethod.GET)
		public String deleteReply(ReplyVo reply,HttpSession session,Model model){
			logger.info("댓글 삭제 시작");

			String id = (String)session.getAttribute("loginId");
			int result = 0;
			
			//삭제할 글 번호와 본인 글인지 확인할 로그인 아이디
			reply.setId(id);

			result = dao.deleteReply(reply);
			
			if(result != 1){
				//댓글 등록 실패
				model.addAttribute("errorMsg", "댓글 등록실패");
			}
			
			logger.info("댓글 삭제 종료");
			return "redirect:read?debatenum="+reply.getDebatenum();
		}
		
		
		/**
		 * 리플 수정 처리
		 * @param reply 수정할 리플 정보
		 * */
		@RequestMapping(value="updateReply",method=RequestMethod.POST)
		public String updateReply(ReplyVo reply,HttpSession session){
			logger.info("댓글 수정 시작");

			//수정할 리플 정보와 본인 글인지 확인할 로그인아이디
			String id = (String)session.getAttribute("loginId");
			reply.setId(id);
			
			//리플  수정 처리
			dao.updateReply(reply);
			logger.info("댓글 수정 종료");
			
			//원래의 글읽기 화면으로 이동 
			return "redirect:read?debatenum="+reply.getDebatenum();
		}
		
		
}
