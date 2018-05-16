package com.scmaster.mypro.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mypro.board.dao.BoardDAO;
import com.scmaster.mypro.board.vo.BoardVo;
import com.scmaster.mypro.board.vo.SubjectVo;
import com.scmaster.mypro.board.vo.WaitVo;
import com.scmaster.mypro.file.vo.FileVo;
import com.scmaster.mypro.file.vo.LinkVo;

@RequestMapping(value="admin")
@Controller
public class AdminController {

	@Autowired
	BoardDAO dao;
	
	//관리자 모드페이지 이동
	@RequestMapping(value="manage",method=RequestMethod.GET)
	public String manage(Model model){
		
		ArrayList<WaitVo> waitList = dao.selectWaitAll();
		ArrayList<FileVo> fileList = dao.selectFileAll();
		ArrayList<LinkVo> linkList = dao.selectLinkAll();
		
		
		model.addAttribute("waitList", waitList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("linkList", linkList);
		
		return "admin/manage";
	}
	
	//전공과목 입력 폼 이동
	@RequestMapping(value="writewikiForm",method=RequestMethod.GET)
		public String writewikiForm(Model model){
			
		ArrayList<SubjectVo> subjectList = dao.selectSubjectAll(); 
		ArrayList<FileVo> fileList = dao.selectFileAll();
		ArrayList<LinkVo> linkList = dao.selectLinkAll();
		
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("linkList", linkList);
		
		return "admin/writewikiForm";
	}
	
	//전공과목 입력 폼 이동
	@RequestMapping(value="writesubject",method=RequestMethod.GET)
	public String writesubject(){
		
		return "admin/writesubject";
	}
	
	//위키글 등록
		@RequestMapping(value="writeWikiBoard",method=RequestMethod.POST)
		public String writeWikiBoard(BoardVo board,Model model){
			
			int result = 0;
			
			result = dao.writeWikiBoard(board);
			
			if(result != 1){
				model.addAttribute("errorMsg", "위키 글 등록에 실패 하였습니다");
				return "redirect:writewikiForm";
			}
			
			return "redirect:manage";
		}
		
	
	//위키글 수정 폼 이동
	@RequestMapping(value="updatewikiForm",method=RequestMethod.GET)
	public String updatewikiForm(Model model){
		
		ArrayList<BoardVo> boardList = dao.selectBoardAll(); 
		ArrayList<SubjectVo> subjectList = dao.selectSubjectAll(); 
		ArrayList<FileVo> fileList = dao.selectFileAll();
		ArrayList<LinkVo> linkList = dao.selectLinkAll();
		ArrayList<WaitVo> waitList = dao.selectWaitAll();

		
		model.addAttribute("fileList", fileList);
		model.addAttribute("linkList", linkList);
		model.addAttribute("waitList", waitList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("subjectList", subjectList);
		
		return "admin/updatewikiForm";
	}
	
	
	//위키글 수정 --> ajax
	@ResponseBody
	@RequestMapping(value="updatewikiBoard",method=RequestMethod.POST)
	public String updateWiki(@RequestBody BoardVo board,Model model){
		String succstr = "수정에 성공하였습니다";
		int result = 0;
		System.out.println(board);
		
		
		result = dao.updateWiki(board);
		
		if(result != 1){
			model.addAttribute("errorMsg", "위키 글 수정에 실패 하였습니다");
		}
		
		return succstr;
	}
	
	
	//전공과목 추가
	@RequestMapping(value="writeSubject",method=RequestMethod.POST)
	public String writeSubject(SubjectVo subject,Model model){
		int result = 0;
		
		result = dao.writeSubject(subject);
		
		if(result != 1){
			model.addAttribute("errorMsg", "전공과목 입력에 실패 하였습니다");
			return "redirect:manage";
		}
		
		return "redirect:manage";
	}
	
	
	
}
