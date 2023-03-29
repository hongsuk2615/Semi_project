package com.khtime.D_Day.vo;

import java.util.Date;

public class D_Day {
	private int dDayNo;
	private Date dDay;
	private Date mainDDay;
	private String userId;
	
	public D_Day() {
		super();
		// TODO Auto-generated constructor stub
	}

	public D_Day(int dDayNo, Date dDay, Date mainDDay, String userId) {
		super();
		this.dDayNo = dDayNo;
		this.dDay = dDay;
		this.mainDDay = mainDDay;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "D_Day [dDayNo=" + dDayNo + ", dDay=" + dDay + ", mainDDay=" + mainDDay + ", userId=" + userId + "]";
	}

	
	
	
}
