package com.khtime.message.model.vo;

import oracle.sql.DATE;

public class Message {
	private int sender;
	private int receiver;
	private String content;
	private DATE date;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(int sender, int receiver, String content, DATE date) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.date = date;
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

	public DATE getDate() {
		return date;
	}

	public void setDate(DATE date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Message [sender=" + sender + ", receiver=" + receiver + ", content=" + content + ", date=" + date + "]";
	}
	
	
	
	
	
}
