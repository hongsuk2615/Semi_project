package com.khtime.message.model.vo;

import java.util.Date;

public class Message {
	private int messageNo;
	private int sender;
	private int receiver;
	private String content;
	private Date sendDate;
	
	public Message() {
		super();
	}

	public Message(int messageNo, int sender, int receiver, String content, Date sendDate) {
		super();
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.sendDate = sendDate;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
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

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", sender=" + sender + ", receiver=" + receiver + ", content="
				+ content + ", sendDate=" + sendDate + "]";
	}

	
	
	
	
	
	
	
	
}
