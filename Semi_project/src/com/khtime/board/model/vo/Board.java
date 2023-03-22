package com.khtime.board.model.vo;

import oracle.sql.DATE;

public class Board {
	private int boardNo;
	private String title;
	private String content;
	private int categoryNo;
	private int writer;
	private String isQuestion;
	private String isAnonimous;
	private int reportCount;
	private int recommendCount;
	private int scrapCount;
	private DATE enrollDate;
	private String status;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String title, String content, int categoryNo, int writer, String isQuestion,
			String isAnonimous, int reportCount, int recommendCount, int scrapCount, DATE enrollDate, String status) {
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

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
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

	public DATE getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(DATE enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", categoryNo=" + categoryNo
				+ ", writer=" + writer + ", isQuestion=" + isQuestion + ", isAnonimous=" + isAnonimous
				+ ", reportCount=" + reportCount + ", recommendCount=" + recommendCount + ", scrapCount=" + scrapCount
				+ ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
	
}
