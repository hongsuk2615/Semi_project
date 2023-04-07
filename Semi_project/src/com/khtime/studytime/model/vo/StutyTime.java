package com.khtime.studytime.model.vo;

import java.sql.Date;

public class StutyTime {
	private int studyTimeNo;
	private String userId;
	private Date timeAmount;
	private Date date;
	
	public StutyTime() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StutyTime(int studyTimeNo, String userId, Date timeAmount, Date date) {
		super();
		this.studyTimeNo = studyTimeNo;
		this.userId = userId;
		this.timeAmount = timeAmount;
		this.date = date;
	}

	public int getStudyTimeNo() {
		return studyTimeNo;
	}

	public void setStudyTimeNo(int studyTimeNo) {
		this.studyTimeNo = studyTimeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getTimeAmount() {
		return timeAmount;
	}

	public void setTimeAmount(Date timeAmount) {
		this.timeAmount = timeAmount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "StutyTime [studyTimeNo=" + studyTimeNo + ", userId=" + userId + ", timeAmount=" + timeAmount + ", date="
				+ date + "]";
	}
	
	
}
