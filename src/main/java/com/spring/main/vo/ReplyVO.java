package com.spring.main.vo;

import java.util.Date;

public class ReplyVO {
	
	    //게시판 댓글 VO
		private int bbsid;
		private int rpyid;
		private String rpycontent;
		private String rpywriter;
		private Date rpydate;
		
		public int getBbsid() {
			return bbsid;
		}
		
		public void setBbsid(int bbsid) {
			this.bbsid = bbsid;
		}
		
		public int getRpyid() {
			return rpyid;
		}
		
		public void setRpyid(int rpyid) {
			this.rpyid = rpyid;
		}
		public String getRpycontent() {
			return rpycontent;
		}
		
		public void setRpycontent(String rpycontent) {
			this.rpycontent = rpycontent;
		}
		
		public String getRpywriter() {
			return rpywriter;
		}
		
		public void setRpywriter(String rpywriter) {
			this.rpywriter = rpywriter;
		}
		
		public Date getRpydate() {
			return rpydate;
		}
		
		public void setRpydate(Date rpydate) {
			this.rpydate = rpydate;
		}
		
		
		@Override
		public String toString() {
			return "ReplyVO [bbsid=" + bbsid + ", rpyid=" + rpyid + ", rpycontent=" + rpycontent + ", rpywriter="
					+ rpywriter + ", rpydate=" + rpydate + "]";
		}


}
