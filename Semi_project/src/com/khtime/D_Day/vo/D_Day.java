package com.khtime.D_Day.vo;

import oracle.sql.DATE;

public class D_Day {
	private DATE dDay;
	private DATE mainDDay;
	private String userId;
	
	public D_Day() {
		super();
		// TODO Auto-generated constructor stub
	}

	public D_Day(DATE dDay, DATE mainDDay, String userId) {
		super();
		this.dDay = dDay;
		this.mainDDay = mainDDay;
		this.userId = userId;
	}

	public DATE getdDay() {
		return dDay;
	}

	public void setdDay(DATE dDay) {
		this.dDay = dDay;
	}

	public DATE getMainDDay() {
		return mainDDay;
	}

	public void setMainDDay(DATE mainDDay) {
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
