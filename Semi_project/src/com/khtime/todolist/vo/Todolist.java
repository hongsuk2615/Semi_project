package com.khtime.todolist.vo;

public class Todolist {
	private String userId;
	private String content;
	private int priority;
	
	public Todolist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Todolist(String userId, String content, int priority) {
		super();
		this.userId = userId;
		this.content = content;
		this.priority = priority;
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
