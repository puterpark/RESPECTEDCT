package com.kosmo.board;

import java.io.Serializable;

public class BoardVO implements Serializable{
	private int bseq;
	private String btype;
	private String btitle;
	private String bcon;
	private int mseq;
	private String bfilePath;
	private String bfileName;
	private long bfileSize;
	private String regdate;
	
	private String searchGubun;
	private String searchStr;
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcon() {
		return bcon;
	}
	public void setBcon(String bcon) {
		this.bcon = bcon;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getBfilePath() {
		return bfilePath;
	}
	public void setBfilePath(String bfilePath) {
		this.bfilePath = bfilePath;
	}
	public String getBfileName() {
		return bfileName;
	}
	public void setBfileName(String bfileName) {
		this.bfileName = bfileName;
	}
	public long getBfileSize() {
		return bfileSize;
	}
	public void setBfileSize(long bfileSize) {
		this.bfileSize = bfileSize;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchStr() {
		return searchStr;
	}
	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}
	
	
	
}
