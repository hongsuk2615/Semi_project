package com.khtime.board.model.vo;

public class Category {
	private int categoryNo;
	private String available;
	private String categoryName;
	private int reqUser;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int categoryNo, String available, String categoryName, int reqUser) {
		super();
		this.categoryNo = categoryNo;
		this.available = available;
		this.categoryName = categoryName;
		this.reqUser = reqUser;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getReqUser() {
		return reqUser;
	}

	public void setReqUser(int reqUser) {
		this.reqUser = reqUser;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", available=" + available + ", categoryName=" + categoryName
				+ ", reqUser=" + reqUser + "]";
	}
	
	
}
