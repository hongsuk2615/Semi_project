package com.khtime.websocket.model.vo;

import java.util.Date;

public class Chat {
	  private String sender;
	  private String receiver;
	  private String msg; 
	  private Date date;
	  
	  public Chat() {
		  super();
	  }

	public Chat(String sender, String receiver, String msg, Date date) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
		this.date = date;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Chat [sender=" + sender + ", receiver=" + receiver + ", msg=" + msg + ", date=" + date + "]";
	}



	  
	  
}
