package com.khtime.studytime.model.vo;

import java.sql.Date;

public class StutyTime {
	private int studyTimeNo;
	private int userNo;
	private int timeAmount;
	private Date studyDate;
	private int targetTime;
	
	public StutyTime() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StutyTime(int studyTimeNo, int userNo, int timeAmount, Date studyDate, int targetTime) {
		super();
		this.studyTimeNo = studyTimeNo;
		this.userNo = userNo;
		this.timeAmount = timeAmount;
		this.studyDate = studyDate;
		this.targetTime = targetTime;
	}

	public int getStudyTimeNo() {
		return studyTimeNo;
	}

	public void setStudyTimeNo(int studyTimeNo) {
		this.studyTimeNo = studyTimeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTimeAmount() {
		return timeAmount;
	}

	public void setTimeAmount(int timeAmount) {
		this.timeAmount = timeAmount;
	}

	public Date getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}

	public int getTargetTime() {
		return targetTime;
	}

	public void setTargetTime(int targetTime) {
		this.targetTime = targetTime;
	}

	@Override
	public String toString() {
		return "StutyTime [studyTimeNo=" + studyTimeNo + ", userNo=" + userNo + ", timeAmount=" + timeAmount
				+ ", studyDate=" + studyDate + ", targetTime=" + targetTime + "]";
	}

	
	
	
}
