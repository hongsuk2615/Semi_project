package com.khtime.board.model.vo;

import java.util.Date;

public class Reply {
	private int replyNo;
	private int boardNo;
	private int writer;
	private String content;
	private int recommendCount;
	private int reportCount;
	private Date enrollDate;
	private String isAnonimous;
	private String userProfile;
	private String stringDate;
	private String nickName;
	
	public Reply() {
		super();
	}


	public Reply(int replyNo, int boardNo, int writer, String nickName, String content, int recommendCount, int reportCount,
			Date enrollDate, String isAnonimous, String userProfile) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.writer = writer;
		this.nickName = nickName;
		this.content = content;
		this.recommendCount = recommendCount;
		this.reportCount = reportCount;
		this.enrollDate = enrollDate;
		this.isAnonimous = isAnonimous;
		this.userProfile = userProfile;
	}


	public int getRecommendCount() {
		return recommendCount;
	}



	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}



	public int getReportCount() {
		return reportCount;
	}



	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
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

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
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
	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getStringDate() {
		return stringDate;
	}

	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", writer=" + writer + ", content=" + content
				+ ", recommendCount=" + recommendCount + ", reportCount=" + reportCount + ", enrollDate=" + enrollDate
				+ ", isAnonimous=" + isAnonimous+ "]";
	}
	
}
