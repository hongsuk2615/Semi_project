package com.khtime.member.model.vo;

import java.util.Date;

public class UserProFileImg {
	private int refUserId;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	
	public UserProFileImg() {
		super();
	}

	public int getRefUserId() {
		return refUserId;
	}

	public void setRefUserId(int refUserId) {
		this.refUserId = refUserId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserProFileImg [refUserId=" + refUserId + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	
}
