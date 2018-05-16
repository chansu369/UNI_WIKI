package com.scmaster.mypro.board.vo;

public class SubjectVo {
	private int subjectnum;
	private String subjectname;
	
	public SubjectVo() {
		super();
	}

	public SubjectVo(int subjectnum, String subjectname) {
		super();
		this.subjectnum = subjectnum;
		this.subjectname = subjectname;
	}

	public int getSubjectnum() {
		return subjectnum;
	}

	public void setSubjectnum(int subjectnum) {
		this.subjectnum = subjectnum;
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	@Override
	public String toString() {
		return "SubjectVo [subjectnum=" + subjectnum + ", subjectname=" + subjectname + "]";
	}
	
	
	
	
}
