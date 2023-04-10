package com.khtime.board.model.vo;

import java.util.Date;

public class Board {
	private int boardNo;
	private String title;
	private String content;
	private int categoryNo;
	private String writer;
	private String isQuestion;
	private String isAnonimous;
	private int reportCount;
	private int recommendCount;
	private int scrapCount;
	private Date enrollDate;
	private String status;
	private int replyCount;
	private String userProfile;
	private String stringDate;

	public Board() {
		super();
	}
	

	public Board(int boardNo, String title, String content, int categoryNo, String writer, String isQuestion,
			String isAnonimous, int reportCount, int recommendCount, int scrapCount, Date enrollDate, String status,
			int replyCount, String userProfile) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.reportCount = reportCount;
		this.recommendCount = recommendCount;
		this.scrapCount = scrapCount;
		this.enrollDate = enrollDate;
		this.status = status;
		this.replyCount = replyCount;
		this.userProfile = userProfile;
	}


	public Board(int boardNo, String title, String content, int categoryNo, String writer, String isQuestion,
			String isAnonimous, int recommendCount, int scrapCount, Date enrollDate, int replyCount) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.recommendCount = recommendCount;
		this.scrapCount = scrapCount;
		this.enrollDate = enrollDate;
		this.replyCount = replyCount;
	}





	public Board(int boardNo, String title, String content, int categoryNo, String writer, String isQuestion, String isAnonimous,
			int recommendCount, Date enrollDate, int replyCount) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.recommendCount = recommendCount;
		this.enrollDate = enrollDate;
		this.replyCount = replyCount;
	}

	

	public Board(int boardNo, String title, String content, String writer, String isQuestion, String isAnonimous,
			int recommendCount, Date enrollDate, int replyCount) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.recommendCount = recommendCount;
		this.enrollDate = enrollDate;
		this.replyCount = replyCount;
	}

	public Board(int boardNo,String title, String content, String writer, String isQuestion, String isAnonimous, int recommendCount,
			int scrapCount, int replyCount, int categoryNo, Date enrollDate) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.recommendCount = recommendCount;
		this.scrapCount = scrapCount;
		this.replyCount = replyCount;
		this.categoryNo = categoryNo;
		this.enrollDate = enrollDate;
	}
	
	

	public Board(int boardNo, String title, String content, int categoryNo, String writer, String isQuestion,
			String isAnonimous, int recommendCount, int replyCount, String stringDate) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.writer = writer;
		this.isQuestion = isQuestion;
		this.isAnonimous = isAnonimous;
		this.recommendCount = recommendCount;
		this.replyCount = replyCount;
		this.stringDate = stringDate;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getIsQuestion() {
		return isQuestion;
	}

	public void setIsQuestion(String isQuestion) {
		this.isQuestion = isQuestion;
	}

	public String getIsAnonimous() {
		return isAnonimous;
	}

	public void setIsAnonimous(String isAnonimous) {
		this.isAnonimous = isAnonimous;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
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
	



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", categoryNo=" + categoryNo
				+ ", writer=" + writer + ", isQuestion=" + isQuestion + ", isAnonimous=" + isAnonimous
				+ ", reportCount=" + reportCount + ", recommendCount=" + recommendCount + ", scrapCount=" + scrapCount
				+ ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
	
}
