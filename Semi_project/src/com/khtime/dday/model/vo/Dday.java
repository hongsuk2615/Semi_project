package com.khtime.dday.model.vo;

import java.util.Date;

public class Dday {
	private int dDayNo;
	private Date dDay;
	private String title;
	private int userNo;
	
	public Dday() {
		super();
	}

	public Dday(int dDayNo, Date dDay, String title, int userNo) {
		super();
		this.dDayNo = dDayNo;
		this.dDay = dDay;
		this.title = title;
		this.userNo = userNo;
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

	public int getuserNo() {
		return userNo;
	}

	public void setUserId(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Dday [dDayNo=" + dDayNo + ", dDay=" + dDay + ", title=" + title + ", userNo=" + userNo + "]";
	}

	
	
	
	
}
