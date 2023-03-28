package com.khtime.board.model.vo;

import java.util.Date;

import oracle.sql.DATE;

public class Reply {
	private int replyNo;
	private int boardNo;
	private String writer;
	private String content;
	private Date enrollDate;
	private String isAnonimous;
	private int pReplyNo;
	
	public Reply() {
		super();
	}

	
	
	public Reply(int replyNo, String writer, String content, Date enrollDate, String isAnonimous, int pReplyNo) {
		super();
		this.replyNo = replyNo;
		this.writer = writer;
		this.content = content;
		this.enrollDate = enrollDate;
		this.isAnonimous = isAnonimous;
		this.pReplyNo = pReplyNo;
	}



	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getIsAnonimous() {
		return isAnonimous;
	}

	public void setIsAnonimous(String isAnonimous) {
		this.isAnonimous = isAnonimous;
	}

	public int getpReplyNo() {
		return pReplyNo;
	}

	public void setpReplyNo(int pReplyNo) {
		this.pReplyNo = pReplyNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", writer=" + writer + ", content=" + content
				+ ", enrollDate=" + enrollDate + ", isAnonimous=" + isAnonimous + ", pReplyNo=" + pReplyNo + "]";
	}
	
	
	
	
}
