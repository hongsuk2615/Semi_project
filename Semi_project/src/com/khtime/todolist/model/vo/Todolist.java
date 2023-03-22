package com.khtime.todolist.model.vo;

public class Todolist {
	private String userId;
	private String content;
	private int priority;
	
	public Todolist() {
		super();
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	@Override
	public String toString() {
		return "Todolist [userId=" + userId + ", content=" + content + ", priority=" + priority + "]";
	}
	
	
}
