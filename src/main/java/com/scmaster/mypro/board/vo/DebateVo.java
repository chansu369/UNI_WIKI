package com.scmaster.mypro.board.vo;

public class DebateVo {
	
	private int debatenum;
	private int subjectnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	public DebateVo() {
		super();
	}
	public DebateVo(int debatenum, int subjectnum, String id, String title, String content, String inputdate,
			int hits) {
		super();
		this.debatenum = debatenum;
		this.subjectnum = subjectnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hits = hits;
	}
	public int getDebatenum() {
		return debatenum;
	}
	public void setDebatenum(int debatenum) {
		this.debatenum = debatenum;
	}
	public int getSubjectnum() {
		return subjectnum;
	}
	public void setSubjectnum(int subjectnum) {
		this.subjectnum = subjectnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "DebateVo [debatenum=" + debatenum + ", subjectnum=" + subjectnum + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", inputdate=" + inputdate + ", hits=" + hits + "]";
	}

	
	
	
}
