package com.khtime.dday.model.vo;

import java.util.Date;

public class Dday {
	private int dDayNo;
	private Date dDay;
	private Date mainDDay;
	private String userId;
	
	public Dday() {
		super();
	}

	public Dday(int dDayNo, Date dDay, Date mainDDay, String userId) {
		super();
		this.dDayNo = dDayNo;
		this.dDay = dDay;
		this.mainDDay = mainDDay;
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

	public Date getMainDDay() {
		return mainDDay;
	}

	public void setMainDDay(Date mainDDay) {
		this.mainDDay = mainDDay;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	
	
}
