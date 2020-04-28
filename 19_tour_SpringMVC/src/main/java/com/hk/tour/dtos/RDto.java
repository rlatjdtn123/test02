package com.hk.tour.dtos;

import java.util.Date;

public class RDto  {
	
	private int seq;
	private int tseq;
	private String id;
	private String content;
	private String usergrade;
	private Date regdate;
	
	
	public RDto() {
		super();
	}


	public RDto(int seq, int tseq, String id, String content, String usergrade, Date regdate) {
		super();
		this.seq = seq;
		this.tseq = tseq;
		this.id = id;
		this.content = content;
		this.usergrade = usergrade;
		this.regdate = regdate;
	}

	
	

	public RDto(int tseq, String id, String content, String usergrade) {
		super();
		this.tseq = tseq;
		this.id = id;
		this.content = content;
		this.usergrade = usergrade;
	}
	
	
	


	public RDto(int tseq, String id, String content) {
		super();
		this.tseq = tseq;
		this.id = id;
		this.content = content;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getTseq() {
		return tseq;
	}


	public void setTseq(int tseq) {
		this.tseq = tseq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getUsergrade() {
		return usergrade;
	}


	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "RDto [seq=" + seq + ", tseq=" + tseq + ", id=" + id + ", content=" + content + ", usergrade="
				+ usergrade + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
