package com.khtime.dday.model.vo;

import java.util.Date;

public class Dday {
	private Date dDay;
	private Date mainDDay;
	private String userId;
	
	public Dday() {
		super();
	}

	public Dday(Date dDay, Date mainDDay, String userId) {
		super();
		this.dDay = dDay;
		this.mainDDay = mainDDay;
		this.userId = userId;
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

	@Override
	public String toString() {
		return "D_Day [dDay=" + dDay + ", mainDDay=" + mainDDay + ", userId=" + userId + "]";
	}
	
	
}
