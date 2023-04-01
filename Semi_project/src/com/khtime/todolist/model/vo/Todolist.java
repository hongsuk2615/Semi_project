package com.khtime.todolist.model.vo;

public class Todolist {
	private int toDoListNo;
	private int userNo;
	private String content;
	private int priority;
	
	public Todolist() {
		super();
	}
	
	public int getToDoListNo() {
		return toDoListNo;
	}

	public void setToDoListNo(int toDoListNo) {
		this.toDoListNo = toDoListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
