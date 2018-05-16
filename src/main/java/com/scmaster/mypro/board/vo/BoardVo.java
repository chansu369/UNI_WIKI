package com.scmaster.mypro.board.vo;

public class BoardVo {

	private int boardnum;
	private int subjectnum;
	private String content;
	private int filenum;
	private int linknum;
	private String inputdate;
	
	
	public BoardVo() {
		super();
	}
	
	
	public BoardVo(int boardnum, int subjectnum, String content, int filenum, int linknum, String inputdate) {
		super();
		this.boardnum = boardnum;
		this.subjectnum = subjectnum;
		this.content = content;
		this.filenum = filenum;
		this.linknum = linknum;
		this.inputdate = inputdate;
	}


	public int getBoardnum() {
		return boardnum;
	}


	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}


	public int getSubjectnum() {
		return subjectnum;
	}


	public void setSubjectnum(int subjectnum) {
		this.subjectnum = subjectnum;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getFilenum() {
		return filenum;
	}


	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}


	public int getLinknum() {
		return linknum;
	}


	public void setLinknum(int linknum) {
		this.linknum = linknum;
	}


	public String getInputdate() {
		return inputdate;
	}


	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}


	@Override
	public String toString() {
		return "BoardVo [boardnum=" + boardnum + ", subjectnum=" + subjectnum + ", content=" + content + ", filenum="
				+ filenum + ", linknum=" + linknum + ", inputdate=" + inputdate + "]";
	}
	
	
	
}
