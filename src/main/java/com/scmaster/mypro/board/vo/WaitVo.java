package com.scmaster.mypro.board.vo;

public class WaitVo {

	 private int updatenum;
	 private int boardnum;
	 private String content;
	 private int filenum;
	 private int linknum;
	
	 public WaitVo() {
		super();
	}
	
	
	public WaitVo(int updatenum, int boardnum, String content, int filenum, int linknum) {
		super();
		this.updatenum = updatenum;
		this.boardnum = boardnum;
		this.content = content;
		this.filenum = filenum;
		this.linknum = linknum;
	}
	
	
	public int getUpdatenum() {
		return updatenum;
	}
	public void setUpdatenum(int updatenum) {
		this.updatenum = updatenum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
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
	
	
	@Override
	public String toString() {
		return "WaitVo [updatenum=" + updatenum + ", boardnum=" + boardnum + ", content=" + content + ", filenum="
				+ filenum + ", linknum=" + linknum + "]";
	}
	 
	
}
