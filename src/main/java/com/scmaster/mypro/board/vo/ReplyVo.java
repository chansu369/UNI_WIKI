package com.scmaster.mypro.board.vo;

public class ReplyVo {

	private int replynum;
	private int debatenum;
	private String id;
	private String text;
	private String inputdate;
	public ReplyVo() {
		super();
	}
	public ReplyVo(int replynum, int debatenum, String id, String text, String inputdate) {
		super();
		this.replynum = replynum;
		this.debatenum = debatenum;
		this.id = id;
		this.text = text;
		this.inputdate = inputdate;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getDebatenum() {
		return debatenum;
	}
	public void setDebatenum(int debatenum) {
		this.debatenum = debatenum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	@Override
	public String toString() {
		return "ReplyVo [replynum=" + replynum + ", debatenum=" + debatenum + ", id=" + id + ", text=" + text
				+ ", inputdate=" + inputdate + "]";
	}
	
	
	
}
