package com.scmaster.mypro.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.mypro.board.vo.BoardVo;
import com.scmaster.mypro.board.vo.SubjectVo;
import com.scmaster.mypro.board.vo.WaitVo;
import com.scmaster.mypro.file.vo.FileVo;
import com.scmaster.mypro.file.vo.LinkVo;
import com.scmaster.mypro.board.vo.DebateVo;
import com.scmaster.mypro.board.vo.ReplyVo;
@Repository
public class BoardDAO {

	@Autowired
	SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

	// 게시글 전체 검색
	public ArrayList<BoardVo> selectBoardAll(){
		ArrayList<BoardVo> list = null;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			list = mapper.selectBoardAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int writeWikiBoard(BoardVo board){
		int result = 0;
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			result = mapper.writeWikiBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//글 수정
	public int updateWiki(BoardVo board){
		int result = 0;
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			result = mapper.updateWiki(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//전공과목 입력
	public int writeSubject(SubjectVo subject){
			int result = 0;
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				result = mapper.writeSubject(subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
	}
	
	
	
	// 전공과목 전체 검색
	public ArrayList<SubjectVo> selectSubjectAll(){
		ArrayList<SubjectVo> list = null;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			list = mapper.selectSubjectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public BoardVo selectwikiOne(int subjectnum){
		BoardVo board = null;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		try {
			board = mapper.selectwikiOne(subjectnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}

	

	
	
	
	
	//토론장
	//게시판 등록
	public int writeBoard(DebateVo debate){
			logger.info("게시판 쓰기 시작");

			int count = 0;
			BoardMapper mapper = session.getMapper(BoardMapper.class);

			try{
				count = mapper.writeBoard(debate);
			}catch(Exception e){
				e.printStackTrace();
			}

			logger.info("게시판 쓰기 종료");
			return count;
		}


	//게시글 전체 조회
	public ArrayList<DebateVo> selectAll(HashMap<String, Object> searchMap,int startRecord, int countPerPage){
			logger.info("목록 불러오기 시작");

			ArrayList<DebateVo> list = null;
			BoardMapper mapper = session.getMapper(BoardMapper.class);

			RowBounds rb = new RowBounds(startRecord,countPerPage);
			
			try{
				list = mapper.selectAll(searchMap,rb);
			}catch(Exception e){
				e.printStackTrace();
			}

			logger.info("목록 불러오기 종료");
			return list;
		}

		
			//글 갯수 조회(검색어 포함)
			public int getTotal(HashMap<String, Object> searchMap){
				logger.info("목록 불러오기 시작");

				int total = 0;
				BoardMapper mapper = session.getMapper(BoardMapper.class);

				try{
					total = mapper.getTotal(searchMap);
				}catch(Exception e){
					e.printStackTrace();
				}

				logger.info("목록 불러오기 종료");
				return total;
			}
		

		//게시글 세부 조회
		public DebateVo selectOne(int debatenum){
			logger.info("글조회 시작");
			DebateVo debate = null;
			BoardMapper mapper = session.getMapper(BoardMapper.class);

			try{
				mapper.updateHits(debatenum);
				debate = mapper.selectOne(debatenum);
			}catch(Exception e){
				e.printStackTrace();
			}

			logger.info("글조회 종료");
			return debate;

		}

		
		//글수정
		public int updateBoard(DebateVo debate){
			logger.info("게시글 수정 시작");
			int count=0;
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				count = mapper.updateBoard(debate);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			logger.info("게시글 수정 종료");
			return count;
		}
		
		

		//글 삭제
		public int deleteBoard(DebateVo debate){
			logger.info("게시글 삭제 시작");
			int count=0;

			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				count = mapper.deleteBoard(debate);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			logger.info("게시글 삭제 종료");
			return count;
		}



		//리플 등록
		public int insertReply(ReplyVo reply){
			logger.info("리플 등록 시작");
			int count=0;

			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				count = mapper.insertReply(reply);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			logger.info("리플 등록 종료");
			return count;
			
		}


		//리플 조회
		public ArrayList<ReplyVo> selectReplyAll(int debatenum){
			logger.info("리플 조회 시작");
			ArrayList<ReplyVo> list = null;
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				list = mapper.selectReplyAll(debatenum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			logger.info("리플 조회 종료");
			return list;
		}
		
		
		
		//리플 삭제
		public int deleteReply(ReplyVo reply){
			logger.info("리플 삭제 시작");
			int count=0;
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				count=mapper.deleteReply(reply);
				} catch (Exception e) {
					e.printStackTrace();
			}	
					
			logger.info("리플 삭제 종료");
			return count;
		}
		

		//리플 수정
		public int updateReply(ReplyVo reply){
			logger.info("리플 수정 시작");
			int count=0;
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				count=mapper.updateReply(reply);
				} catch (Exception e) {
					e.printStackTrace();
			}	
					
			logger.info("리플 수정 종료");
			return count;
		}
	
		
		
		
		
		
		//수정대기
		//수정대기 입력
		public void writeWait(WaitVo wait){
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				mapper.writeWait(wait);
			} catch (Exception e) {
					e.printStackTrace();
			}	
			
		}

		//수정대기 목록
		public ArrayList<WaitVo> selectWaitAll(){
			ArrayList<WaitVo> list = null;
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				list = mapper.selectWaitAll();
			} catch (Exception e) {
					e.printStackTrace();
			}	
			
			return list;
		}
		
		
		
		
		
		
		
		//파일
		/**
		 * 게시글 저장
		 * @param file 저장할 게시글 정보
		 */
		public int insertFile(FileVo file) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			int result = 0;
			try {
				result = mapper.insertFile(file);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		/**
		 * 글 번호로 해당 게시글 읽기
		 * @param filenum 검색할 글번호
		 * @return 검색된 게시글 정보. 없으면 null.
		 */
		public FileVo getFile(int filenum) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			//해당 번호의 글정보 읽기
			FileVo file = mapper.getFile(filenum);
			return file;
		}
		
		public int selelctFilenum(){
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.selelctFilenum();
			return result;
		}
		
		//파일 목록
		public ArrayList<FileVo> selectFileAll(){
			ArrayList<FileVo> list = null;
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				list = mapper.selectFileAll();
			} catch (Exception e) {
					e.printStackTrace();
			}	
			
			return list;
		}
				
		
		
		
		
		
		
		//링크
		//링크등록
		public int writeLink(LinkVo link){
			int result = 0;
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				result = mapper.writeLink(link);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		
		//링크 목록
		public ArrayList<LinkVo> selectLinkAll(){
			ArrayList<LinkVo> list = null;
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			try {
				list = mapper.selectLinkAll();
			} catch (Exception e) {
					e.printStackTrace();
			}	
					
			return list;
		}
								
	
		
		
		
		
}
