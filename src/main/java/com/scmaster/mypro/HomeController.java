package com.scmaster.mypro;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scmaster.mypro.board.dao.BoardDAO;
import com.scmaster.mypro.board.vo.BoardVo;
import com.scmaster.mypro.board.vo.SubjectVo;
import com.scmaster.mypro.board.vo.WaitVo;
import com.scmaster.mypro.common.util.FileService;
import com.scmaster.mypro.file.vo.FileVo;
import com.scmaster.mypro.file.vo.LinkVo;


@Controller
public class HomeController {
	
	@Autowired
	BoardDAO dao;
	
	final String uploadPath = "/wikifile";	//파일 업로드 경로

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	@RequestMapping(value = "index3", method = RequestMethod.GET)
	public String index3() {
		return "index3";
	}
	

	@RequestMapping(value ="sidebar", method = RequestMethod.GET)
	public String sidebar(HttpSession session,Model model){
		ArrayList<BoardVo> list1 = null;
		ArrayList<SubjectVo> list2 = null;
		
		list1 = dao.selectBoardAll();
		list2 = dao.selectSubjectAll();
		
		model.addAttribute("boardList",list1);
		model.addAttribute("subjectList",list2);
		
		return "wiki/sidebar";
	}
	
	/**
	 * Ajax 전체 글 목록 불러오기
	 * */
	@ResponseBody
	@RequestMapping(value="listSelect",method=RequestMethod.GET)
	public ArrayList<BoardVo> listSelect(){
		ArrayList<BoardVo> boardList = null;

		boardList = dao.selectBoardAll();
		
		return boardList;
	}
	
	@ResponseBody
	@RequestMapping(value="subjectList",method=RequestMethod.GET)
	public ArrayList<SubjectVo> subjectList(){
		ArrayList<SubjectVo> subjectList = null;

		subjectList = dao.selectSubjectAll();
		
		return subjectList;
	}
	
	@ResponseBody
	@RequestMapping(value="writeWait",method=RequestMethod.POST)
	public void writeWait(String updatetext,String subjectnum){
		int f_subnum = 0;
		try{
			f_subnum = Integer.parseInt(subjectnum);
		}catch(Exception e){
			e.printStackTrace();
		}
		BoardVo boVo = dao.selectwikiOne(f_subnum);
		WaitVo wait = new WaitVo();
		wait.setBoardnum(boVo.getBoardnum());
		wait.setContent(updatetext);
		wait.setFilenum(boVo.getFilenum());
		wait.setLinknum(boVo.getLinknum());
		
		dao.writeWait(wait);
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="selectWiki",method=RequestMethod.POST)
	public BoardVo selectWiki(String subjectnum){
		int find_num = 0;
		BoardVo board= null;
		
		try{
			find_num = Integer.parseInt(subjectnum);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		board = dao.selectwikiOne(find_num);
		
		return board;
	}
	
	
	@ResponseBody
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public FileVo fileupload(MultipartHttpServletRequest request, HttpServletResponse response) {
        Iterator<String> itr =  request.getFileNames();
        FileVo file = new FileVo();
        if(itr.hasNext()) {
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(mpf.getOriginalFilename() +" uploaded!");
            try {
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
        		if (!mpf.isEmpty()) {
        			String savedfile = FileService.saveFile(mpf, uploadPath);
        			file.setOriginalfile(mpf.getOriginalFilename());
        			file.setSavedfile(savedfile);
        			dao.insertFile(file);
        		}
            } catch (IOException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
            return file;
        } else {
            return file;
        }
    }
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDownload(HttpServletResponse response, String origin , String saved){
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(origin, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String fullPath = uploadPath + "/" + saved;
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="writeLink",method=RequestMethod.POST)
	public String writeLink(String linkaddress,Model model){
		int result = 0;
		LinkVo link = new LinkVo();
		link.setLinkaddress(linkaddress);

		try {
			result = dao.writeLink(link);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result != 1){
			model.addAttribute("errorMsg","링크 등록 실패");
		}
		
		return "redirect:sidebar";
	}
	
	
}