package studytime.vo;

import oracle.sql.DATE;

public class StutyTime {
	private int studyTimeNo;
	private String userId;
	private DATE timeAmount;
	private DATE date;
	
	public StutyTime() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StutyTime(int studyTimeNo, String userId, DATE timeAmount, DATE date) {
		super();
		this.studyTimeNo = studyTimeNo;
		this.userId = userId;
		this.timeAmount = timeAmount;
		this.date = date;
	}

	public int getStudyTimeNo() {
		return studyTimeNo;
	}

	public void setStudyTimeNo(int studyTimeNo) {
		this.studyTimeNo = studyTimeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public DATE getTimeAmount() {
		return timeAmount;
	}

	public void setTimeAmount(DATE timeAmount) {
		this.timeAmount = timeAmount;
	}

	public DATE getDate() {
		return date;
	}

	public void setDate(DATE date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "StutyTime [studyTimeNo=" + studyTimeNo + ", userId=" + userId + ", timeAmount=" + timeAmount + ", date="
				+ date + "]";
	}
	
	
}
