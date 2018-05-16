package com.scmaster.mypro.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.mypro.user.vo.UserVo;

@Repository
public class UserDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

	
	@Autowired
	SqlSession sqlSession;
	
	
	
	//고객정보 조회(한명)
	public UserVo searchUserOne(String userid){
		logger.info("회원 정보 검색 시작");
		UserVo user = null;
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		try {
			user = mapper.searchUserOne(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.info("회원 정보 검색 종료");
		return user;
	}
	
	
	//회원 가입
	public int joinUser(UserVo user){
		logger.info("[DB]회원 정보 등록 시작");
		int count=0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
		try {
			count = mapper.joinUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("[DB]회원 정보 등록 종료");
		return count;
	}
	
	
	//회원 정보 수정
	public int updateUser(UserVo user){
		logger.info("회원 정보 수정 시작");
		int count = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		try {
			count = mapper.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("회원 정보 수정 종료");
		return count;
	}
	
	
}
