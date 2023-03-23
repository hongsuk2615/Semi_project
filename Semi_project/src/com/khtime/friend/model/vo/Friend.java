package com.khtime.friend.model.vo;

public class Friend {
	private int user1;
	private int user2;
	private String isAgree;
	
	public Friend() {
		super();
	}


	public int getUser1() {
		return user1;
	}

	public void setUser1(int user1) {
		this.user1 = user1;
	}

	public int getUser2() {
		return user2;
	}

	public void setUser2(int user2) {
		this.user2 = user2;
	}

	public String getIsAgree() {
		return isAgree;
	}

	public void setIsAgree(String isAgree) {
		this.isAgree = isAgree;
	}

	@Override
	public String toString() {
		return "Friend [user1=" + user1 + ", user2=" + user2 + ", isAgree=" + isAgree + "]";
	}
	
	
	
	
}
