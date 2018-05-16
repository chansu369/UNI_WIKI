package com.scmaster.mypro.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.mypro.board.vo.BoardVo;
import com.scmaster.mypro.board.vo.DebateVo;
import com.scmaster.mypro.board.vo.ReplyVo;
import com.scmaster.mypro.board.vo.SubjectVo;
import com.scmaster.mypro.board.vo.WaitVo;
import com.scmaster.mypro.file.vo.FileVo;
import com.scmaster.mypro.file.vo.LinkVo;

public interface BoardMapper {

	//위키글
		public ArrayList<BoardVo> selectBoardAll();
		
		public int updateWiki(BoardVo board);
		
		public int writeSubject(SubjectVo subject);
		
		public int writeWikiBoard(BoardVo board);
		
		public ArrayList<SubjectVo> selectSubjectAll();
		
		
		public BoardVo selectwikiOne(int subjectnum);
		
	
		
	//토론장
		//게시글 등록
		public int writeBoard(DebateVo debate);

		//게시글 전체 조회
		public ArrayList<DebateVo> selectAll(HashMap<String, Object> searchMap,RowBounds rb);

		//게시글 세부 조회
		public DebateVo selectOne(int debatenum);
		
		//조회수 증가
		public void updateHits(int debatenum);
		
		
		//글수정
		public int updateBoard(DebateVo debate);
		
		
		//글 삭제
		public int deleteBoard(DebateVo debate);
		
		
		//글 갯수 조회(검색어 포함)
		public int getTotal(HashMap<String, Object> searchMap);

		
		//리플 등록
		public int insertReply(ReplyVo reply);
		
		
		//리플 조회
		public ArrayList<ReplyVo> selectReplyAll(int debatenum);
		
		//리플 삭제
		public int deleteReply(ReplyVo reply);
		
		//리플 수정
		public int updateReply(ReplyVo reply);
		
		
		
		
	//파일
		//파일 저장
		public int insertFile(FileVo file);
		//파일번호로 해당 파일 검색
		public FileVo getFile(int filenum);
		
		public int selelctFilenum();
		
		//파일 목록 읽기
		public ArrayList<FileVo> selectFileAll();
		
	//링크
		//링크 저장
		public int writeLink(LinkVo link);
		//링크 목록 읽기
		public ArrayList<LinkVo> selectLinkAll();

		
	//수정대기
		//수정대기 입력
		public void writeWait(WaitVo wait);
		//수정대기 목록 읽기
		public ArrayList<WaitVo> selectWaitAll();

		
		
		
		
	
}
