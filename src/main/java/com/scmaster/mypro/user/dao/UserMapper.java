package com.scmaster.mypro.user.dao;

import com.scmaster.mypro.user.vo.UserVo;

public interface UserMapper {

	//고객정보 조회(한명)
	public UserVo searchUserOne(String userid);
	
	
	//회원 가입
	public int joinUser(UserVo user);
	
	
	//회원 정보 수정
	public int updateUser(UserVo user);
}
