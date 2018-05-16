package com.scmaster.mypro.user.vo;

public class UserVo {
	private String userid;
	private String password;
	private String usertype;
	private String name;
	private String email;
	private int subjectnum;
	
	
	public UserVo() {
		super();
	}
	
	public UserVo(String userid, String password, String usertype, String name, String email, int subjectnum) {
		super();
		this.userid = userid;
		this.password = password;
		this.usertype = usertype;
		this.name = name;
		this.email = email;
		this.subjectnum = subjectnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSubjectnum() {
		return subjectnum;
	}

	public void setSubjectnum(int subjectnum) {
		this.subjectnum = subjectnum;
	}

	@Override
	public String toString() {
		return "UserVo [userid=" + userid + ", password=" + password + ", usertype=" + usertype + ", name=" + name
				+ ", email=" + email + ", subjectnum=" + subjectnum + "]";
	}

	
	

}
