package com.khtime.dday.model.vo;

import java.util.Date;

public class Dday {
	private int dDayNo;
	private Date dDay;
	private String title;
	private int userId;
	
	public Dday() {
		super();
	}

	public Dday(int dDayNo, Date dDay, String title, int userId) {
		super();
		this.dDayNo = dDayNo;
		this.dDay = dDay;
		this.title = title;
		this.userId = userId;
	}

	public int getdDayNo() {
		return dDayNo;
	}

	public void setdDayNo(int dDayNo) {
		this.dDayNo = dDayNo;
	}

	public Date getdDay() {
		return dDay;
	}

	public void setdDay(Date dDay) {
		this.dDay = dDay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Dday [dDayNo=" + dDayNo + ", dDay=" + dDay + ", title=" + title + ", userId=" + userId + "]";
	}

	
	
	
	
}
