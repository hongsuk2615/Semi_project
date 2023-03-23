package com.khtime.message.model.vo;

import java.util.Date;

public class Message {
	private int sender;
	private int receiver;
	private String content;
	private Date date;
	
	public Message() {
		super();
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Message [sender=" + sender + ", receiver=" + receiver + ", content=" + content + ", date=" + date + "]";
	}
	
	
	
	
	
}
