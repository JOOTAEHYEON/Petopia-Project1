package com.spring.main.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
	   //게시판 VO
	   private String userid;
	   private Integer bbsid;
	   private String bbscategory;
	   private String bbsdog;
	   private String bbstitle;
	   private String bbscontent;
	   private Date bbsdate;
	   private String bbsavailable;
	   private MultipartFile file; 
	   
	   
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public Integer getBbsid() {
		return bbsid;
	}
	
	public void setBbsid(Integer bbsid) {
		this.bbsid = bbsid;
	}
	
	public String getBbscategory() {
		return bbscategory;
	}
	
	public void setBbscategory(String bbscategory) {
		this.bbscategory = bbscategory;
	}
	
	public String getBbsdog() {
		return bbsdog;
	}
	
	public void setBbsdog(String bbsdog) {
		this.bbsdog = bbsdog;
	}
	
	public String getBbstitle() {
		return bbstitle;
	}
	
	public void setBbstitle(String bbstitle) {
		this.bbstitle = bbstitle;
	}
	
	public String getBbscontent() {
		return bbscontent;
	}
	
	public void setBbscontent(String bbscontent) {
		this.bbscontent = bbscontent;
	}
	
	public Date getBbsdate() {
		return bbsdate;
	}
	
	public void setBbsdate(Date bbsdate) {
		this.bbsdate = bbsdate;
	}
	
	public String getBbsavailable() {
		return bbsavailable;
	}
	
	public void setBbsavailable(String bbsavailable) {
		this.bbsavailable = bbsavailable;
	}
	
	
	  public MultipartFile getFile() { return file; }
	  
	  public void setFile(MultipartFile file) { this.file = file; }
	 

	@Override
	public String toString() {
		return "BoardVO [userid=" + userid + ", bbsid=" + bbsid + ", bbscategory=" + bbscategory + ", bbsdog=" + bbsdog
				+ ", bbstitle=" + bbstitle + ", bbscontent=" + bbscontent + ", bbsdate=" + bbsdate + ", bbsavailable="
				+ bbsavailable + "]";
	}
	


}
