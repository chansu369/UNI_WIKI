package com.scmaster.mypro.file.vo;

public class FileVo {
	private int filenum;
	private String originalfile;
	private String savedfile;
	
	public FileVo() {
		super();
	}

	public FileVo(int filenum, String originalfile, String savedfile) {
		super();
		this.filenum = filenum;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}

	public int getFilenum() {
		return filenum;
	}

	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	@Override
	public String toString() {
		return "FileVo [filenum=" + filenum + ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}
	
	
	
}
