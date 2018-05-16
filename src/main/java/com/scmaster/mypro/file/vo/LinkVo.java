package com.scmaster.mypro.file.vo;

public class LinkVo {
	private int linknum;
	private String linkaddress;
	
	public LinkVo() {
		super();
	}

	public LinkVo(int linknum, String linkaddress) {
		super();
		this.linknum = linknum;
		this.linkaddress = linkaddress;
	}

	public int getLinknum() {
		return linknum;
	}

	public void setLinknum(int linknum) {
		this.linknum = linknum;
	}

	public String getLinkaddress() {
		return linkaddress;
	}

	public void setLinkaddress(String linkaddress) {
		this.linkaddress = linkaddress;
	}

	@Override
	public String toString() {
		return "LinkVo [linknum=" + linknum + ", linkaddress=" + linkaddress + "]";
	}
	
	
}
