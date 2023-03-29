package com.khtime.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userClass;
	private String userName;
	private String nickName;
	private String email;
	private Date enrollDate;
	private int authority;
	private int reportCount;
	private int recommendCount;
	private String isBanned;
	private String isWhitelist;
	private String available;
	private String status;

	public Member() {
		super();
	}
	
	
	

	public Member(int userNo, String userId, String userPwd, String userClass, String userName, String nickName,
			String email, Date enrollDate, int authority, int reportCount, int recommendCount, String isBanned,
			String isWhitelist, String available, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userClass = userClass;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.enrollDate = enrollDate;
		this.authority = authority;
		this.reportCount = reportCount;
		this.recommendCount = recommendCount;
		this.isBanned = isBanned;
		this.isWhitelist = isWhitelist;
		this.available = available;
		this.status = status;
	}




	public Member(String userId, String userPwd, String userClass, String userName, String nickName, String email,
			int authority) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userClass = userClass;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.authority = authority;
	}



	public Member(int userNo, String userId, String userPwd, String userClass, String userName, String nickName,
			String email, Date enrollDate, int authority, int reportCount, String isBanned, String isWhitelist) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userClass = userClass;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.enrollDate = enrollDate;
		this.authority = authority;
		this.reportCount = reportCount;
		this.isBanned = isBanned;
		this.isWhitelist = isWhitelist;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getUserPwd() {
		return userPwd;
	}




	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}




	public String getUserClass() {
		return userClass;
	}




	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}




	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getNickName() {
		return nickName;
	}




	public void setNickName(String nickName) {
		this.nickName = nickName;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public Date getEnrollDate() {
		return enrollDate;
	}




	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}




	public int getAuthority() {
		return authority;
	}




	public void setAuthority(int authority) {
		this.authority = authority;
	}




	public int getReportCount() {
		return reportCount;
	}




	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}




	public int getRecommendCount() {
		return recommendCount;
	}




	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}




	public String getIsBanned() {
		return isBanned;
	}




	public void setIsBanned(String isBanned) {
		this.isBanned = isBanned;
	}




	public String getIsWhitelist() {
		return isWhitelist;
	}




	public void setIsWhitelist(String isWhitelist) {
		this.isWhitelist = isWhitelist;
	}




	public String getAvailable() {
		return available;
	}




	public void setAvailable(String available) {
		this.available = available;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userClass=" + userClass
				+ ", userName=" + userName + ", nickName=" + nickName + ", email=" + email + ", enrollDate="
				+ enrollDate + ", authority=" + authority + ", reportCount=" + reportCount + ", recommendCount="
				+ recommendCount + ", isBanned=" + isBanned + ", isWhitelist=" + isWhitelist + ", available="
				+ available + ", status=" + status + "]";
	}

}
