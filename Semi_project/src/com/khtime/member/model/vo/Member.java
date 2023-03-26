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
	private Date date;
	private int authority;
	private int recommendCount;
	private int reportCount;
	private String isBanned;
	private String isWhitelist;
	private String status;

	public Member() {

		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Member(int userNo, String userId, String userPwd, String userClass, String userName, String nickName,
			String email, Date date, int authority, int recommendCount, int reportCount, String isBanned, String isWhitelist,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userClass = userClass;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.date = date;
		this.authority = authority;
		this.recommendCount = recommendCount;
		this.reportCount = reportCount;
		this.isBanned = isBanned;
		this.isWhitelist = isWhitelist;
		this.status = status;
	}
	
	

	public Member(String userId, String userPwd, String userClass, String userName, String nickName, String email, int authority) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userClass = userClass;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.authority = authority;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}
	
	

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userClass=" + userClass
				+ ", userName=" + userName + ", nickName=" + nickName + ", email=" + email + ", date=" + date
				+ ", authority=" + authority + ", reportCount=" + reportCount + ", isBanned=" + isBanned
				+ ", isWhitelist=" + isWhitelist + ", status=" + status + "]";
	}

}
